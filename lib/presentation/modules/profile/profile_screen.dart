import 'package:jvec_app/core/app_routes.dart';
import 'package:jvec_app/presentation/modules/profile/profile_controller.dart';
import 'package:jvec_app/presentation/utils/validators.dart';
import 'package:jvec_app/presentation/utils/values.dart';
import 'package:jvec_app/presentation/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class EditProfileScreen extends GetView<ProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(AppPadding.p24), // Set right margin
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(60),
                AppTextFormField(
                  label: 'User Name',
                  autofillHints: [AutofillHints.name],
                  hintText: 'e.g Avan',
                  onSaved: (val) => controller.username = val!,
                  validator: Validator.isName,
                ),
                const Gap(20),
                AppTextFormField(
                  label: 'Email Address / username',
                  autofillHints: [AutofillHints.email],
                  hintText: 'e.g alexushud@gmail.com',
                  onSaved: (val) => controller.email = val!.trim(),
                  validator: Validator.isEmail,
                ),
                const Gap(20),
                AppTextFormField(
                  label: 'Phone number',
                  autofillHints: [AutofillHints.email],
                  hintText: '0814580049111',
                  onSaved: (val) => controller.email = val!.trim(),
                  validator: Validator.isEmail,
                ),
                const Gap(20),
                ElevatedButton(
                  onPressed: () {
                    Get.snackbar(
                      'Fast Link',
                      'Profile update successfully done',
                      backgroundColor: AppColors.scrim,
                      colorText: Colors.white,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
