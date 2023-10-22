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

class CardsSelectionController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final amount;
  final cards = Rxn<DebitCards>();

  Rx<User> get user => AuthRepository.instance.user;

  final CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(locale: 'en_NG', decimalDigits: 0, symbol: '');

  final paymentResponse = Rxn<FundwalletResponse>();

  @override
  void onInit() {
    amount = Get.arguments;
    fetchData();
    super.onInit();
  }

  Future fetchData() async {
    AppRepository.instance.cards().then((responses) {
      cards.value = responses;
    }).catchError((err, stackTrace) {
      cards.value = [];
      if (err is! String) {
        err = err.toString();
      }

      // Error
      showError(err);
    });
  }

  Future<void> _launchUrl(Uri url) async {
    launchUrl(
      url,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_self',
    );
  }

  void delete_card(int id) {
    showLoadingState;

    AppRepository.instance.delete_card(id).then((response) {
      // Success, Show web page!
      Get.back();
      showMessage(response, clear: true);
    }).catchError((err, stackTrace) {
      if (err is! String) {
        err = err.toString();
      }
      // Error
      showError(err, clear: true);
    });
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
      //   showMessage('Payment Successful', clear: true);
      //   AppSharedPrefs.instance.deleteObject('ref');

      if (kIsWeb) {
        Get.offAndToNamed(Routes.home);
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
