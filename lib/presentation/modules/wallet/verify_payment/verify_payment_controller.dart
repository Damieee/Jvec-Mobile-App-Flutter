import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:jvec_app/domain/repositories/app_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jvec_app/core/extentions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/app_routes.dart';
import '../../../../data/user/user.dart';
import '../../../../data/wallet/wallet.dart';
import '../../../../domain/repositories/auth_repo.dart';

class VerifyPaymentController extends GetxController {
  final Rx<num> amount = 0.obs;

  Rx<User> get user => AuthRepository.instance.user;

  final CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(locale: 'en_NG', decimalDigits: 0, symbol: '');

  final paymentResponse = Rxn<FundwalletResponse>();

  @override
  void onInit() {
    // _fetchBalance();
    super.onInit();
    // reff = Get.arguments;
  }

  Future<void> _launchUrl(Uri url) async {
    launchUrl(
      url,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_self',
    );
  }

  void verify_payment() {
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

        Get.until((route) => Get.currentRoute == Routes.home);
      } else {
        showMessage(
          'Previous payment is pending or failed. Kindly make a new payment',
          clear: true,
        );
        paymentResponse.value = null;
      }
    }).catchError((err, stackTrace) {
      if (err is! String) {
        err = err.toString();
      }
      // Error
      showError(err, clear: true);
    });
  }

  void onTextChanged(String value) {
    if (formatter.getUnformattedValue() != 0)
      amount.value = formatter.getUnformattedValue();
  }
}
