/* import 'package:flutter/material.dart';
import '../presentation/modules/auth/pin/pin_otp_controller.dart';
import '../presentation/utils/constants.dart';
import '../presentation/utils/values.dart';
import '../presentation/widgets/column_pro.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class PinOtpScreen extends GetView<PinOtpController> {
  const PinOtpScreen({Key? key}) : super(key: key);

  final bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FlexibleScrollViewColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          padding: const EdgeInsets.fromLTRB(
              AppPadding.p24, 0, AppPadding.p24, AppPadding.p24),
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                //'Check your SMS messages a code has been sent to ... ',
                'Check your e-mail a code has been\n sent to ${controller.email} ',
                style: Get.textTheme.labelMedium!.copyWith(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: AppSize.s70,
            ),

            // ? Add Timer
            // Text(
            //   'Expires in 10 mins',
            //   style: Get.textTheme.labelSmall!.copyWith(color: Colors.red),
            // ),
            spacer(),
            Pinput(
              onCompleted: controller.onCompleted,
              length: 6,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: AppSize.s48),
            Text(
              'Didn’t recieve a code?',
              style: Get.textTheme.titleSmall,
            ),
            TextButton(
              child: Text('Resend code'),
              style: TextButton.styleFrom(
                textStyle: Get.textTheme.titleSmall!.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              onPressed: () {
                // TODO: Move to dashboard or home screen respectively

                //Get.offAllNamed(Routes.profilePrompt);
                controller.onResendPressed();
              },
            )
          ],
        ),
      ),
    );
  }
}
 */