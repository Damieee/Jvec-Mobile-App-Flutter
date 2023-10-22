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
import 'signup_controller.dart';

class SignupScreen extends GetView<SignupController> {
  SignupScreen({Key? key}) : super(key: key);

  Future<void> _launchInBrowser(
    String host,
  ) async {
/*     final Uri toLaunch = Uri.parse(host);
    //Uri(scheme: 'https', host: host, path:  path);
    if (!await launchUrl(
      toLaunch,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $toLaunch';
    } */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          Get.back();
          return true;
        },
        child: SafeArea(
          child: Form(
            key: controller.formKey,
            child: FlexibleScrollViewColumn(
              padding: EdgeInsets.all(AppPadding.p24),
              children: [
                Gap(20),
                Text(
                  'Let’s Get Started',
                  style: Get.textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppTextFormField(
                          label: 'First Name',
                          autofillHints: [AutofillHints.name],
                          hintText: 'e.g Avan',
                          onSaved: (val) => controller.name = val!,
                          validator: Validator.isName,
                        ),
                        spacer(),
                        AppTextFormField(
                          label: 'Last Name',
                          autofillHints: [AutofillHints.name],
                          hintText: 'e.g Evan',
                          onSaved: (val) => controller.surname = val!,
                          validator: Validator.isName,
                        ),
                        spacer(),
                        AppTextFormField(
                          label: 'Email Address',
                          autofillHints: [AutofillHints.email],
                          hintText: 'e.g alexushud@gmail.com',
                          onSaved: (val) => controller.email = val!.trim(),
                          validator: Validator.isEmail,
                        ),
                        spacer(),
                        AppTextFormField(
                          label: 'username',
                          autofillHints: [AutofillHints.telephoneNumber],
                          hintText: 'e.g shegs',
                          onSaved: (val) => controller.phone = val!.trim(),
                          validator: Validator.isNotEmpty,
                        ),
                        spacer(),
                        Obx(() => AppTextFormField(
                              label: 'Password',
                              hintText: 'Enter your password',
                              autofillHints: [AutofillHints.password],
                              obscureText: controller.hidePassword.value,
                              validator: Validator.isPassword,
                              onSaved: (val) =>
                                  controller.password = val!.trim(),
                              suffixIcon: IconButton(
                                icon: controller.hidePassword.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.remove_red_eye),
                                onPressed: controller.hidePasswordPressed,
                              ),
                            )),
                        spacer(),
                        // Row(
                        //   children: [
                        //     Obx(
                        //       () => Checkbox(
                        //         value: controller.agreedToTerms.value,
                        //         activeColor: AppColors.primary,
                        //         onChanged: (val) {
                        //           FocusManager.instance.primaryFocus?.unfocus();
                        //           controller.onCheckboxChanged(val);
                        //         },
                        //       ),
                        //     ),
                        //     Expanded(
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           _launchInBrowser(
                        //               'https://terms.foodelo.africa');
                        //         },
                        //         child: RichText(
                        //           text: TextSpan(
                        //               text: 'I agree to ',
                        //               style: Get.textTheme.titleSmall,
                        //               children: [
                        //                 TextSpan(
                        //                     text: 'terms and conditions',
                        //                     style: Get.textTheme.titleSmall!
                        //                         .copyWith(
                        //                       decoration:
                        //                           TextDecoration.underline,
                        //                       color: Colors.blue,
                        //                     ))
                        //               ]),
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        SizedBox(height: AppSize.s48),
                        ElevatedButton(
                          child: Text('Create account'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          onPressed: controller.createAccount,
                        ),
                        SizedBox(height: AppSize.s8),
                        // Row(
                        //   children: [
                        //     Expanded(child: Divider()),
                        //     Padding(
                        //         padding: EdgeInsets.symmetric(horizontal: 25),
                        //         child: Text('OR')),
                        //     Expanded(child: Divider())
                        //   ],
                        // ),
                        // SizedBox(height: AppSize.s8),
                        // OutlinedButton.icon(
                        //   label: Text('Sign up with Google'),
                        //   icon: Image.asset('assets/icons/google_icon.png'),
                        //   onPressed: () {},
                        // ),
                      ],
                    ),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style:
                        Get.textTheme.labelLarge!.copyWith(letterSpacing: 0.75),
                    text: "I have an account - ",
                    children: [
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(color: AppColors.primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            if (kIsWeb) {
                              Get.offAndToNamed(Routes.login);
                            } else {
                              Get.back();
                            }
                          },
                      ),
                    ],
                  ),
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
