import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jvec_app/core/extentions.dart';

import '../../../../core/app_routes.dart';
import '../../../../data/plan/plan.dart';
import '../../../../data/user/user.dart';
import '../../../../domain/repositories/auth_repo.dart';

class PurchasePlanController extends GetxController {
  final formKey = GlobalKey<FormState>();

  Rx<User> get user => AuthRepository.instance.user;
  final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter(
      locale: 'en_NG', decimalDigits: 0, symbol: '₦');
  late Plan plan;

  @override
  void onInit() {
    super.onInit();
    plan = Get.arguments;
  }

  void purchasePlan() {
    showLoadingState;

    AuthRepository.instance
        .purchasePlan(plan_id: plan.id, discount_id: 0)
        .then((msg) {
      // Success, Go Back back
      showMessage(msg, clear: true);
      Get.until((route) => Get.currentRoute == Routes.home);
    }).catchError((err, stackTrace) {
      if (err is! String) {
        err = err.toString();
      }
      // Error
      showError(err, clear: true);
    });
    return;

    FocusManager.instance.primaryFocus?.unfocus();

    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();

      // Put back here
    }
  }

  void recievePayment() => Get.toNamed(Routes.receivePayment);
}
