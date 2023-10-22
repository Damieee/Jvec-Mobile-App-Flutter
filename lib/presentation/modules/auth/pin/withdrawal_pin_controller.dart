/* import 'package:flutter/material.dart';
import '../core/extentions.dart';
import '../domain/repositories/app_repo.dart';
import 'package:get/get.dart';

class WithdrawalPinController extends GetxController {
  final withdrawFormKey = GlobalKey<FormState>();
  late String oldPin; //= ''.obs;
  late String newPin; //= ''.obs;
  late String confirmPin; //= ''.obs;

  void setWithdrawalPin() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final form = withdrawFormKey.currentState!;
    if (form.validate()) {
      form.save();

      if (newPin != confirmPin) {
        showError('Pin do not match');
        return;
      }

      showLoadingState;

      try {
        final response = await AppRepository.instance
            .setWithdrawalPin(oldPin: oldPin, newPin: newPin);
        if (response != null) {
          debugPrint("$response");
          Get.back();
          showMessage(response);
          await Future.delayed(Duration(seconds: 5));
          Get.back();
        }
      } catch (e) {
        Get.back();
        showError(e);
      }
    }
  }
}
 */