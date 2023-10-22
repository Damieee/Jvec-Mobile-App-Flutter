import 'package:jvec_app/domain/repositories/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../core/app_routes.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/validators.dart';
import '../../../utils/values.dart';
import '../../../widgets/app_text_form_field.dart';
import '../../../widgets/column_pro.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      // controller.emailText.text = 'seyi@gmail.com';
      // controller.passText.text = 'seyi123';
      controller.emailText.text = 'test@gmail.com';
      controller.passText.text = 'Test1234';
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ImageIcon(
            //   AssetImage('assets/icons/hand_wave.png'),
            //   color: AppColors.primary,
            //   size: 24,
            // )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: FlexibleScrollViewColumn(
            children: [
              Gap(20),
              Text(
                'Welcome back!',
                style: Get.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(AppPadding.p24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppTextFormField(
                        textEditingController: controller.emailText,
                        label: 'Email Address or Username',
                        autofillHints: [AutofillHints.email],
                        hintText: 'e.g alexushud@gmail.com or stella',
                        onSaved: (val) => controller.email = val!.trim(),
                        validator: Validator.isNotEmpty,
                      ),
                      spacer(),
                      Obx(() => AppTextFormField(
                            textEditingController: controller.passText,
                            label: 'Password',
                            autofillHints: [AutofillHints.password],
                            hintText: 'Enter your password',
                            obscureText: controller.hidePassword.value,
                            validator: Validator.isPassword,
                            onSaved: (val) => controller.password = val!.trim(),
                            suffixIcon: IconButton(
                              icon: controller.hidePassword.value
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.remove_red_eye),
                              onPressed: controller.hidePasswordPressed,
                            ),
                          )),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text(
                            '', //Forgot password',
                            textAlign: TextAlign.right,
                            style: Get.textTheme.labelLarge!.copyWith(
                              letterSpacing: 0.75,
                              color: AppColors.primary,
                            ),
                          ),
                          onPressed: controller.onForgetPasswordPressed,
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        child: Text('Log In'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        onPressed: controller.onLoginPressed,
                      ),
                      SizedBox(height: AppSize.s8),
                      if (AuthRepository.instance.isAuthenticated)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Expanded(child: Divider()),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    child: Text('OR')),
                                Expanded(child: Divider())
                              ],
                            ),
                            SizedBox(height: AppSize.s8),
                            OutlinedButton(
                              child: Text(
                                  'Continue with ${AuthRepository.instance.user.value.email}'),
                              onPressed: () {
                                Get.offAllNamed(Routes.home);
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Get.textTheme.labelLarge!.copyWith(
                    letterSpacing: 0.75,
                  ),
                  text: "Don’t have an account? - ",
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: TextStyle(color: AppColors.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = controller.onSignupTap,
                    ),
                  ],
                ),
              ),
              spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
