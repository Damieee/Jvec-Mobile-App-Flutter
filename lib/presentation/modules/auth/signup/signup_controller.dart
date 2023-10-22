import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jvec_app/core/extentions.dart';
import 'package:jvec_app/domain/repositories/auth_repo.dart';

import '../../../../core/app_routes.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final agreedToTerms = false.obs;

  final hidePassword = true.obs;
  void hidePasswordPressed() => hidePassword.value = !hidePassword.value;

  late String name;
  late String surname;
  late String email;
  late String phone;
  late String password;
  late String referrerCode;

  void onCheckboxChanged(bool? value) {
    agreedToTerms.value = value!;
  }

  Future<void> onContinuePressed() async {
    // AuthRepository.instance.userType = UserType.guest;
    // final successful = await Get.toNamed(Routes.newAddress);

    // if (successful) Get.toNamed(Routes.home);
  }

  void createAccount() {
    FocusManager.instance.primaryFocus?.unfocus();

    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();

      showLoadingState;

      AuthRepository.instance
          .signup(
        email: email,
        password: password,
        name: name,
        surname: surname,
        phone: phone,
      )
          .then((msg) {
        Get.back();
        showMessage(msg, clear: true);
      }).catchError((err, stackTrace) {
        if (err is! String) {
          err = err.toString();
        }
        // Error
        showError(err, clear: true);
      });
    }
  }
}
