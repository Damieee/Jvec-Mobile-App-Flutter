import 'package:jvec_app/presentation/modules/auth/change_password/change_password_controller.dart';
import 'package:jvec_app/presentation/utils/colors.dart';
import 'package:jvec_app/presentation/utils/validators.dart';
import 'package:jvec_app/presentation/utils/values.dart';
import 'package:jvec_app/presentation/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jvec_app/presentation/modules/auth/login/login_controller.dart';

import '../../../widgets/column_pro.dart';
//import 'login_controller.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text("Contact"),
      ),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: FlexibleScrollViewColumn(
            padding: EdgeInsets.all(AppPadding.p24),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(40),
                  Obx(
                    () => AppTextFormField(
                      label: 'Old Password',
                      autofillHints: [AutofillHints.password],
                      hintText: 'Enter your current password',
                      obscureText: controller.hidePassword.value,
                      validator: Validator.isPassword,
                      onSaved: (val) => controller.old_password = val!.trim(),
                      suffixIcon: IconButton(
                        icon: controller.hidePassword.value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.remove_red_eye),
                        onPressed: controller.hidePasswordPressed,
                      ),
                    ),
                  ),
                  const Gap(20),
                  Obx(
                    () => AppTextFormField(
                      label: 'New Password',
                      autofillHints: [AutofillHints.password],
                      hintText: 'Enter new password',
                      obscureText: controller.hidePassword.value,
                      validator: Validator.isPassword,
                      onSaved: (val) => controller.new_password = val!.trim(),
                      suffixIcon: IconButton(
                        icon: controller.hidePassword.value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.remove_red_eye),
                        onPressed: controller.hidePasswordPressed,
                      ),
                    ),
                  ),
                  const Gap(20),
                  Obx(
                    () => AppTextFormField(
                      label: 'Confirm New Password',
                      autofillHints: [AutofillHints.password],
                      hintText: 'Confirm new password',
                      obscureText: controller.hidePassword.value,
                      validator: Validator.isPassword,
                      onSaved: (val) =>
                          controller.new_password_confirm = val!.trim(),
                      suffixIcon: IconButton(
                        icon: controller.hidePassword.value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.remove_red_eye),
                        onPressed: controller.hidePasswordPressed,
                      ),
                    ),
                  ),
                  const Gap(100),
                  ElevatedButton(
                    onPressed: controller.onSubmitPressed,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text("Submit"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
