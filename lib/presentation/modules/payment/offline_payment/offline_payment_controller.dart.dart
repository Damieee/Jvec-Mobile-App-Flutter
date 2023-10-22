import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes.dart';
import '../../../../data/user/user.dart';
import '../../../../domain/repositories/auth_repo.dart';

class OfflinePaymentController extends GetxController {
  final formKey = GlobalKey<FormState>();

  Rx<User> get user => AuthRepository.instance.user;
  final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter(
      locale: 'en_NG', decimalDigits: 0, symbol: '₦');
  late String wallet_id;
  num amount = 0;
  String offlineData = 'processing...';

  @override
  void onInit() {
    super.onInit();
  }

  void generateCode() {
    amount = formatter.getUnformattedValue();

    FocusManager.instance.primaryFocus?.unfocus();

    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();

      // offlineData =
      //     '${AppStrings.baseUrl}/charge/${user.value.wallet?.id ?? 'null'}?amount=${amount}';

      Get.toNamed(Routes.offlineQrView);
    }
  }
}
