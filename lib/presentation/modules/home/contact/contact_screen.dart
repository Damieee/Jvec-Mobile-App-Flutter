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
import 'contact_controller.dart';
//import 'login_controller.dart';

class ContactScreen extends GetView<ContactController> {
  const ContactScreen({super.key});

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
                  AppTextFormField(
                    label: 'First Name',
                    autofillHints: [AutofillHints.name],
                    hintText: 'e.g Dami',
                    validator: Validator.isNotEmpty,
                    onSaved: (val) => controller.first_name = val!.trim(),
                  ),
                  const Gap(20),
                  AppTextFormField(
                    label: 'Last Name',
                    autofillHints: [AutofillHints.familyName],
                    hintText: 'e.g Ezikel',
                    validator: Validator.isNotEmpty,
                    onSaved: (val) => controller.last_name = val!.trim(),
                  ),
                  const Gap(20),
                  AppTextFormField(
                    label: 'Phone Number ',
                    autofillHints: [AutofillHints.telephoneNumber],
                    hintText: 'e.g 08123456789',
                    validator: Validator.isPhone,
                    onSaved: (val) => controller.phone_number = val!.trim(),
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
