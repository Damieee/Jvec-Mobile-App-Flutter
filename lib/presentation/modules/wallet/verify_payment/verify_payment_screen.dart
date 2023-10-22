import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'verify_payment_controller.dart';

class VerifyPaymentScreen extends GetView<VerifyPaymentController> {
  VerifyPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Verifying payment'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container(
            //   margin: EdgeInsets.all(20),
            //   alignment: Alignment.center,
            //   child: Column(
            //     children: [
            //       Text('Enter Amount'),
            //       Gap(10),
            //       TextFormField(
            //         decoration: InputDecoration(
            //           border: InputBorder.none,
            //           enabledBorder: InputBorder.none,
            //           focusedBorder: InputBorder.none,
            //           errorBorder: InputBorder.none,
            //           disabledBorder: InputBorder.none,
            //         ),
            //         style: GoogleFonts.getFont(
            //           'Roboto',
            //           fontSize: 35,
            //           fontWeight: FontWeight.w500,
            //           letterSpacing: 1.5,
            //         ),
            //         textAlign: TextAlign.center,
            //         initialValue: controller.formatter.format('0'),
            //         inputFormatters: <TextInputFormatter>[controller.formatter],
            //         keyboardType: TextInputType.number,
            //       ),
            //     ],
            //   ),
            // ),
            Gap(100),
            SvgPicture.asset('assets/icons/payment_icon.svg'),
            Gap(20),
            Text(
              'Add Money to your Wallet',
              textAlign: TextAlign.center,
            ),
            Gap(50),
            // GetX<VerifyPaymentController>(
            //   builder: (_) {
            //     return AppTextFormField(
            //       label: 'Amount',
            //       hintText: 'Enter amount to be added in Wallet',
            //       moneyInput: true,
            //       readOnly: controller.paymentResponse.value != null,
            //       prefixText: 'NGN ',
            //       initialValue: controller.formatter.format('0'),
            //       inputFormatters: <TextInputFormatter>[controller.formatter],
            //       validator: (String? value) {
            //         if (controller.amount < 100) {
            //           return 'Amount must be greater than NGN 99';
            //         }
            //         return null;
            //       },
            //       onChanged: controller.onTextChanged,
            //     );
            //   },
            // ),
            Gap(36),
            GetX<VerifyPaymentController>(
              builder: (_) {
                return ElevatedButton(
                  onPressed: controller.paymentResponse.value == null
                      ? () {}
                      : controller.verify_payment,
                  child: Text(controller.paymentResponse.value == null
                      ? 'Proceed To Pay'
                      : 'Verify Payment'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
