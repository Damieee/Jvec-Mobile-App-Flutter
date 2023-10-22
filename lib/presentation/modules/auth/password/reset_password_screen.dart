/* import 'package:flutter/material.dart';
import '../presentation/modules/auth/password/password_controller.dart';
import '../presentation/modules/drawer/drawer_controller.dart';
import '../presentation/utils/constants.dart';
import '../presentation/utils/validators.dart';
import '../presentation/utils/values.dart';
import '../presentation/widgets/app_text_form_field.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends GetView<PasswordController> {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  final bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    controller.prev
        ? controller.emailController.text =
            AppDrawerController.instance.email.value
        : '';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p24),
          child: Form(
            key: controller.resetFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                spacer(),
                Text(
                  'Oops! Mistakes do happen, you know!',
                  style: Get.textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                spacer(),
                Text(
                  'Input your email, then click the reset password button. A link to reset your password will be sent to you',
                  style: Get.textTheme.bodySmall!.copyWith(letterSpacing: 0.75),
                ),
                spacer(),
                AppTextFormField(
                  textEditingController: controller.emailController,
                  label: 'Email',
                  hintText: 'Enter your email',
                  onSaved: (val) => controller.email = val!.trim(),
                  validator: Validator.isEmail,
                ),
                spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100))),
                  child: Text('Reset Password'),
                  onPressed: controller.onResetPasswordPressed,
                ),
                spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 */