import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jvec_app/core/extentions.dart';

import '../../../../core/app_routes.dart';
import '../../../../domain/repositories/auth_repo.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final hidePassword = true.obs;

  void hidePasswordPressed() => hidePassword.value = !hidePassword.value;

  // String email = 'seyipaye+22@outlook.com';
  // String password = ' Seyi1234';

  String email = 'olaifaolawale43@yahoo.com';
  String password = 'wahlly';

  TextEditingController emailText = TextEditingController();
  TextEditingController passText = TextEditingController();

  void onSignupTap() => Get.toNamed(Routes.signup);

  void onForgetPasswordPressed() {
    // This prevents forgeting password as a guest
    // if (AppRepository.userIsGuest)
    //   AuthRepository.instance.userType = UserType.customer;

    Get.toNamed(Routes.resetPassword);
  }

  void onLoginPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();

    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();

      showLoadingState;

      try {
        final resp = await AuthRepository.instance.login(
          identifier: email,
          password: password,
        );

        print('dsdssasa');

        if (resp != null) {
          showMessage(resp, clear: true);
          print('dsds');
          Get.offAllNamed(Routes.home);
        }
      } catch (err) {
        print(err);
        if (err.toString().contains('Email is yet to be verified')) {
          Get.toNamed(Routes.otp, arguments: [email]);
        } else {
          // Error

          if (err is String) showError(err.toString(), clear: true);
        }
      }
    }
  }
}
