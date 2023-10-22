import 'package:jvec_app/core/extentions.dart';
import 'package:jvec_app/presentation/modules/wallet/card_payment/cards_controller.dart';
import 'package:jvec_app/presentation/widgets/app_card.dart';
import 'package:jvec_app/presentation/widgets/app_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../widgets/column_pro.dart';
import 'fund_wallet_controller.dart';

class FundWalletScreen extends GetView<FundWalletController> {
  FundWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fund Wallet'),
      ),
      body: Form(
        key: controller.formKey,
        child: FlexibleScrollViewColumn(
          padding: EdgeInsets.all(20),
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
            Image.asset(
              'assets/images/wallet.png',
              height: 187,
            ),
            Gap(40),
            // Text(
            //   'Add Money to your Wallet',
            //   textAlign: TextAlign.center,
            // ),
            Gap(20),
            AppTextFormField(
              label: 'Amount',
              hintText: 'Enter amount to be added in Wallet',
              moneyInput: true,
              // readOnly: controller.paymentResponse.value != null,
              prefixText: 'NGN ',
              initialValue: controller.formatter.format('0'),
              inputFormatters: <TextInputFormatter>[controller.formatter],
              validator: (String? value) {
                if (controller.amount < 100) {
                  return 'Amount must be greater than NGN 99';
                }
                return null;
              },
              onChanged: controller.onTextChanged,
            ),
            Gap(36),
            ElevatedButton(
              onPressed: controller.proceed_to_pay,
              child: Text(
                'Proceed To Pay',
              ),
            ).center
          ],
        ),
      ),
    );
  }
}

class PaymentErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/images/404.png'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [kDropShadow(0, 0, 16)],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Oops! Something went wrong',
                            style: Get.textTheme.titleMedium,
                          ),
                          Gap(20),
                          Text(
                            "Your device is having trouble connecting to the internet. \nPlease try the following troubleshooting tips:",
                            style: Get.textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                _buildItem(
                                  text:
                                      'Make sure you are connected to the internet',
                                ),
                                Gap(20),
                                _buildItem(
                                  text:
                                      "If you are connected to 'Fastlink-Internet', try turning your Wi-Fi off and on again, and claim the '20MB Free data'",
                                ),
                                Gap(20),
                                _buildItem(
                                  text:
                                      "Try claiming the '20 MB Free Data' again",
                                ),
                              ],
                            ),
                          ),
                          Gap(20),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Get.textTheme.labelMedium,
                              text:
                                  "If the issue persists, please contact our ",
                              children: [
                                TextSpan(
                                  text: 'support team',
                                  style: TextStyle(color: AppColors.primary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      final phoneNumber = kSupport;
                                      final smsUri =
                                          Uri(scheme: 'sms', path: phoneNumber);
                                      try {
                                        if (await canLaunchUrl(
                                          smsUri,
                                        )) {
                                          await launchUrl(smsUri);
                                        }
                                      } catch (e) {
                                        Get.snackbar('Some error occured', '');
                                      }
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Back'),
                        style:
                            OutlinedButton.styleFrom(fixedSize: Size(258, 0)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildItem({
    required String text,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/icons/bullet.png'),
        Gap(8),
        Expanded(
          child: Text(
            text,
            style: Get.textTheme.labelMedium,
          ),
        )
      ],
    );
  }
}

class PaymentMethodBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16, 36, 16, 35),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Text(
                  'Payment methods',
                  style: Get.textTheme.titleSmall,
                ),
                Text(
                  'Choose your preferred payment option',
                  style: Get.textTheme.bodySmall,
                ),
              ],
            ),
            Gap(34),
            OutlineMaterial(
              child: Text('Pay with card'),
              onTap: () async {
                await kAnimationDelay;
                Get.back(result: 'card');
              },
            ),
            Gap(20),
            OutlineMaterial(
              child: Text('Other payment methods'),
              onTap: () async {
                await kAnimationDelay;
                Get.back(result: 'others');
              },
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}

class CardSelectionBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16, 36, 16, 35),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Card Tansaction',
              style: Get.theme.appBarTheme.titleTextStyle,
              textAlign: TextAlign.center,
            ),
            Gap(36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saved cards',
                      style: Get.textTheme.titleSmall,
                    ),
                    Text(
                      'List of all cards you saved',
                      style: Get.textTheme.bodySmall,
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Get.back(result: 'new_card');
                  },
                  child: Text(
                    'Use a new card',
                    style: Get.textTheme.labelMedium
                        ?.apply(color: AppColors.primary),
                  ),
                )
              ],
            ),
            Expanded(
              child: GetX<CardsSelectionController>(
                init: CardsSelectionController(),
                builder: (controller) => controller.cards.value == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : controller.cards.value?.isEmpty ?? false
                        ? Center(
                            child: Text(
                              'Oops, no saved card. \nkindly add a new card up there',
                              textAlign: TextAlign.center,
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.cards.value!.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 20),
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final debitCard = controller.cards.value![index];

                              return Padding(
                                padding: EdgeInsetsDirectional.only(top: 20),
                                child: OutlineMaterial(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 15,
                                  ),
                                  onTap: () {
                                    Get.back(result: debitCard);
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${debitCard.card_type.capitalize!} XXXX ${debitCard.last4}',
                                              style: Get.textTheme.labelMedium,
                                            ),
                                            Text(
                                              'Expires ${debitCard.exp_month}/${debitCard.exp_year}',
                                              style: Get.textTheme.labelSmall,
                                            )
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller.delete_card(debitCard.id);
                                        },
                                        icon: Image.asset(
                                          'assets/icons/trash.png',
                                          height: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            ),
            Gap(36),
          ],
        ),
      ),
    );
  }
}
