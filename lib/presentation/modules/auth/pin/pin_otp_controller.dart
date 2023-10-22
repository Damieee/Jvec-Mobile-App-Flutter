/* import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../core/app_routes.dart';
import '../core/extentions.dart';
import '../data/user/user.dart';
import '../domain/repositories/auth_repo.dart';
import 'package:get/get.dart';

class PinOtpController extends GetxController with StateMixin<String> {
  late String email;
  late String phone;

  get fromResetPassword => Get.previousRoute == Routes.resetPassword;

  @override
  void onInit() {
    email = AuthRepository.instance.user.value.email ?? '';
    phone = AuthRepository.instance.user.value.phone ?? '';
    super.onInit();
  }

  @override
  void onReady() {
    AuthRepository.instance.sendPinOtp();
    super.onReady();
  }

  void onCompleted(String otp) {
    if (fromResetPassword) {
      Get.toNamed(Routes.newPassword, arguments: otp);
      print(otp);
      return;
    }

    showLoadingState;

    AuthRepository.instance.submitPinOtp(otp).then((msg) {
      // Success
      Get.back();
      showMessage(msg);

      Get.until((route) => Get.currentRoute == Routes.withdrawalPin);
    }).catchError((err, stackTrace) {
      if (err is! String) {
        err = err.toString();
      }
      // Error
      Get.back();
      showError(err);
    });
  }

  void onResendPressed() {
    FocusManager.instance.primaryFocus?.unfocus();

    showLoadingState;
    final request;

    request = AuthRepository.instance.sendPinOtp().then((msg) {
      // Success
      Get.back();
      showMessage(msg);
    });

    request.catchError((err, stackTrace) {
      if (err is! String) {
        err = err.toString();
      }
      // Error
      Get.back();
      showError(err);
    });
  }
}
 */