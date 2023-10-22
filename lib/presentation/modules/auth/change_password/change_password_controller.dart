import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jvec_app/core/extentions.dart';

import '../../../../../domain/repositories/auth_repo.dart';

class ChangePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final hidePassword = true.obs;

  void hidePasswordPressed() => hidePassword.value = !hidePassword.value;

  String old_password = '';
  String new_password = '';
  String new_password_confirm = '';

  void onSubmitPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();

    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();

      if (new_password != new_password_confirm) {
        showError("New passwords dosen't match");
        return;
      }

      showLoadingState;

      try {
        final resp = await AuthRepository.instance.changePassword(
          oldPassword: old_password,
          newPassword: new_password,
        );

        if (resp != null) {
          Get.back();
          showMessage(resp, clear: true);
        }
      } catch (err) {
        print(err);
        if (err is String) showError(err.toString(), clear: true);
      }
    }
  }
}
