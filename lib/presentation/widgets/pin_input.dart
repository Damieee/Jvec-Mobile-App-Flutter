import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../utils/colors.dart';

class PinInput extends StatelessWidget {
  const PinInput({Key? key, this.onCompleted, this.textEditingController})
      : super(key: key);

  final void Function(String)? onCompleted;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    final length = 4;
    const borderColor = AppColors.primary;
    const errorColor = Color.fromRGBO(255, 234, 238, 1);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: Get.textTheme.bodyLarge!.copyWith(
        fontSize: 22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.hint),
      ),
    );

    return Pinput(
      keyboardType: TextInputType.number,
      length: length,
      defaultPinTheme: defaultPinTheme,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      onCompleted: onCompleted,
      focusedPinTheme: defaultPinTheme.copyWith(
        height: 68,
        width: 64,
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: borderColor),
        ),
      ),
      controller: textEditingController,
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: errorColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
