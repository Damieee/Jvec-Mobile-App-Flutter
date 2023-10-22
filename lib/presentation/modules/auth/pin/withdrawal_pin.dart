/* import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/app_routes.dart';
import '../core/extentions.dart';
import '../presentation/modules/auth/pin/withdrawal_pin_controller.dart';
import '../presentation/utils/colors.dart';
import '../presentation/utils/constants.dart';
import '../presentation/widgets/app_text_form_field.dart';
import 'package:get/get.dart';

class WithdrawalPinScreen extends GetView<WithdrawalPinController> {
  const WithdrawalPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Withdrawal Pin'),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          spacer(),
          Form(
            key: controller.withdrawFormKey,
            child: Column(
              children: [
                AppTextFormField(
                    label: 'Current Pin (default is 0000)',
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced),

                      /// here char limit is 5
                    ],
                    onSaved: (val) => controller.oldPin = val!.trim()),
                spacer(),
                AppTextFormField(
                  label: 'New Pin',
                  textInputType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced),

                    /// here char limit is 5
                  ],
                  onSaved: (val) => controller.newPin = val!.trim(),
                ),
                spacer(),
                AppTextFormField(
                    label: 'Confirm New Pin',
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced),

                      /// here char limit is 5
                    ],
                    onSaved: (val) => controller.confirmPin = val!.trim()),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      'Forgot Old Pin',
                      textAlign: TextAlign.right,
                      style: Get.textTheme.labelLarge!.copyWith(
                        letterSpacing: 0.75,
                        color: AppColors.primary,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.pinOtp);
                    },
                  ),
                ),
                spacer(h: 60),
                ElevatedButton(
                  child: Text('Set Pin'),
                  onPressed: () {
                    controller.setWithdrawalPin();
                  },
                ).center,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 */