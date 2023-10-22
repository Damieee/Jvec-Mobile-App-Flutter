import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:jvec_app/domain/app_shared_prefs.dart';
import 'package:jvec_app/domain/repositories/app_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jvec_app/core/extentions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/app_routes.dart';
import '../../../../data/user/user.dart';
import '../../../../data/wallet/wallet.dart';
import '../../../../domain/repositories/auth_repo.dart';
import '../../../utils/constants.dart';
import 'fund_wallet_screen.dart';
import 'package:http/http.dart' as http;
// import 'package:html/parser.dart' show parse;
import 'package:html/parser.dart';

class FundWalletController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final Rx<num> amount = 0.obs;
  String? type;

  Rx<User> get user => AuthRepository.instance.user;

  final CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(locale: 'en_NG', decimalDigits: 0, symbol: '');

  final paymentResponse = Rxn<FundwalletResponse>();

  void verify_payment({bool self = false}) {
    FocusManager.instance.primaryFocus?.unfocus();

    showLoadingState;

    AppRepository.instance
        .verify_payment(
      reference: paymentResponse.value!.reference,
    )
        .then((response) {
      // Success, Show web page!

      if (response!.status == 'success') {
        showMessage('Payment Successful', clear: true);
        AppSharedPrefs.instance.deleteObject('ref');

        if (kIsWeb && self) {
          Get.offAndToNamed(Routes.home);
        } else {
          Get.until((route) => Get.currentRoute == Routes.home);
        }
      } else {
        showError(
          'Previous payment is pending or failed. Kindly make a new payment',
          clear: true,
        );
        paymentResponse.value = null;
        AppSharedPrefs.instance.deleteObject('ref');
      }
    }).catchError((err, stackTrace) {
      if (err is! String) {
        err = err.toString();
      }
      // Error
      showError(err, clear: true);
    });
  }

  Future<void> proceed_to_pay() async {
    // showLoadingState;
    // await connect_to_hotspot();
    // return;

    if (formatter.getUnformattedValue() != 0)
      amount.value = formatter.getUnformattedValue();

    FocusManager.instance.primaryFocus?.unfocus();

    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();

      // Know weather it is card or others
      //'card' or 'others'
      final paymentMethod = await Get.bottomSheet(PaymentMethodBottomSheet());

      if (paymentMethod == 'card') {
        // Take user to Card Screen

        // Get.toNamed(Routes.cards, arguments: amount.value);
        final result = await Get.bottomSheet(CardSelectionBottomSheet());

        if (result is DebitCard) {
          charge_card(result);
          return;
        } else if (result != 'new_card') {
          type = 'card';
          return;
        } else {
          type = null;
        }
      } else if (paymentMethod == null) {
        return;
      }

      showLoadingState;

      AppRepository.instance
          .topUp(
        amount: amount.value,
        type: type,
      )
          .then((response) {
        // Success, Show web page!

        Get.close(1); // close this first
        _launchUrl(response!.link).then(
          (successful) {
            if (successful) showMessage('Follow the prompts', clear: false);
          },
        );

        // Save to shared pref
        // AppSharedPrefs.instance.saveObject('ref', response);
      }).catchError((err, stackTrace) {
        if (err is! String) {
          err = err.toString();
        }

        print('sssss' + err);
        // Error
        showError(err, clear: true);
      });
    }
  }

  void charge_card(DebitCard card) {
    showLoadingState;

    AppRepository.instance
        .chargeCard(
            authorization_code: card.authorization_code,
            email: card.user_email,
            amount: amount.toString())
        .then((response) {
      // Success, Show web page!

      // if (response!.status == 'success') {
      showMessage('Payment Successful', clear: true);
      // AppSharedPrefs.instance.deleteObject('ref');

      if (kIsWeb) {
        Get.offAndToNamed(Routes.home, arguments: {'reload': true});
      } else {
        Get.until((route) => Get.currentRoute == Routes.home);
      }
      // } else {
      //   showError(
      //     'Previous payment is pending or failed. Kindly make a new payment',
      //     clear: true,
      //   );
      //   paymentResponse.value = null;
      //   AppSharedPrefs.instance.deleteObject('ref');
      // }
    }).catchError((err, stackTrace) {
      if (err is! String) {
        err = err.toString();
      }
      // Error
      showError(err, clear: true);
    });
  }

  void delete_card(int id) {
    showLoadingState;

    AppRepository.instance.delete_card(id).then((response) {
      // Success, Show web page!
      showMessage(response, clear: true);
    }).catchError((err, stackTrace) {
      if (err is! String) {
        err = err.toString();
      }
      // Error
      showError(err, clear: true);
    });
  }

  Future<bool> _launchUrl(String url) async {
    // Check if phone is connected to the internet, if not show message
    // http://10.5.50.1/login?username=seyi@gmail.com&password=Test&popup=false&dst=https://foodelo.africa

    if (await is_not_connected()) {
      // Attemt to login

      // Claim free Data & Get credentials

      String? error_message;

      try {
        showLoadingState;
        final response = await AppRepository.instance.claim_free_data();

        // Check if exahusted
        if (response!.contains("exahusted")) {
          // print('throw');
          error_message = response;
        }

        // Check for credentials
        final credentials = await AuthRepository.instance.user_credentials;

        // I guess it should log out the person first
        if (credentials != null) {
          url =
              'http://10.5.50.1/login?username=${credentials.email}&password=${credentials.password}&popup=false&dst=$url';
        } else {
          throw ("Couldn't fetch credentials");
        }
      } catch (e) {
        print('objectsss ' + e.toString());
        if (error_message == null) {
          showError(error_message, clear: true);
        } else {
          showError(e.toString(), clear: true);
        }
        return false;
      }
    }

    Get.close(1);
    return launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_self',
    );
  }

  Future<bool> is_not_connected() async {
    // if (kDebugMode && kIsWeb) return false;
    showLoadingState;
    final url = Uri.parse(kConnectionTestUrl);
    try {
      final response = await http.get(url);
      Get.close(1);
      // Comment out to show the error message
      if (response.statusCode == 200) return false;
    } catch (e) {
      // Else show error message
      Get.close(1);
      return true;
    }
    // Else show error message
    Get.close(1);
    return true;
  }

  Future<bool> show_error_page() async {
    // Attempt to claim free data
    // Attempt to login locally ---> How do i Know if this failed? so i can give an error message

    // Claim free data

    final claim_data_response = await AppRepository.instance.claim_free_data();

    if (claim_data_response?.contains("exahusted") ?? false) {
      print('error from claim_free_data');

      // Attempt login subtle
      final success = await connect_to_hotspot(subtle: true);

      if (success == true) return Future.value(false);

      showError(claim_data_response, clear: false);
    } else {
      // Attempt login
      final success = await connect_to_hotspot();

      if (success == true) return Future.value(false);
    }

    Get.close(1); // Close Loading Page
    Get.dialog(PaymentErrorPage());
    return Future.value(true);
  }

  Future connect_to_hotspot({bool subtle = false}) async {
    // 1 Check if password is present locally
    // 2 Get password from server if not present
    // 3 Store it locally if not present
    // 3 Use it to login the user when there is an attempt to buy data

    // Check for user password
    final credentials = await AuthRepository.instance.user_credentials;

    // I guess it should log out the person first
    if (credentials != null) {
      final pay_load = {
        'username': 'seyi@gmail.com',
        'password': 'Test',
        'dst': 'https://usefastlink.com',
        'popup': 'false',
      };

      try {
        final response = await GetConnect().post(
          kCaptiveLogin,
          pay_load,
          headers: {
            'Host': 'wifi.usefastlink.com',
            'Origin': 'http://wifi.usefastlink.com',
            'Referer': 'http://wifi.usefastlink.com/login?'
          },
          contentType: 'application/x-www-form-urlencoded',
        );

        // Comment out to show the error message
        if (response.statusCode == 200 &&
            connection_successful(response.bodyString)) {
          // Continue payment request
          return true;
        }
      } catch (e) {
        // Get.close(1);
        // Else show error message

        print('dffdffdf' + e.toString());
        if (!subtle) {
          return false;
        } else {
          return true;
        }
      }
      // Get.close(1);
      if (!subtle) {
        return false;
      } else {
        return true;
      }
    }
  }

  bool connection_successful(response) {
    // final response = kHtmlLogin;
    // To know if it is sucessfull
    print(response);
    var document = parse(response);
    if (response.contains('You are logged in')) {
      return true;
    } else {
      // throw error if unsuccessful
      final error =
          document.body?.getElementsByClassName('info alert').first.text;
      // print(error);
      throw (error ?? '');
    }
  }

  FundwalletResponse? get lastPayment {
    if (AppSharedPrefs.instance.getObject('ref') != null)
      return FundwalletResponse.fromJson(
          AppSharedPrefs.instance.getObject('ref'));

    return null;
  }

  void onTextChanged(String value) {
    if (formatter.getUnformattedValue() != 0)
      amount.value = formatter.getUnformattedValue();
  }
}
