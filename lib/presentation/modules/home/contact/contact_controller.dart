import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jvec_app/core/extentions.dart';

import '../../../../../domain/repositories/auth_repo.dart';

class ContactController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final hidePassword = true.obs;

  void hidePasswordPressed() => hidePassword.value = !hidePassword.value;

  String first_name = '';
  String last_name = '';
  String phone_number = '';

  void onSubmitPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();

    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();

      showLoadingState;

      try {
        final resp = await AuthRepository.instance.save_contact(
          first_name: first_name,
          last_name: last_name,
          phone_number: phone_number,
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
