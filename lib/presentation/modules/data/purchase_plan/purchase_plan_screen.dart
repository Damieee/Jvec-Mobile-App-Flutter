import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../widgets/app_card.dart';

import '../../../widgets/money_text_view.dart';
import 'purchase_plan_controller.dart';

final discount = 0.0;

class PurchasePlanScreen extends GetView<PurchasePlanController> {
  PurchasePlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Purchase Data Plan'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.plan.title,
                        style: Get.textTheme.bodyLarge,
                      ),
                      Gap(15),
                      Text(
                        'Valid for ${controller.plan.days_to_use} days',
                        style: Get.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                AppMaterial(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  elevation: 0,
                  color: Colors.grey.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sub total'),
                          MoneyText(
                            controller.plan.price,
                          ),
                        ],
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Discount'),
                          MoneyText(
                            controller.plan.price * discount,
                          ),
                        ],
                      ),
                      Gap(15),
                      DottedLine(
                        dashLength: 3,
                        dashGapLength: 3,
                        lineThickness: 0.5,
                      ),
                      Gap(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Grand Total',
                            style: Get.textTheme.bodyLarge,
                          ),
                          MoneyText(
                            controller.plan.price -
                                controller.plan.price * discount,
                            style: Get.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(45),
                ElevatedButton(
                  onPressed: controller.purchasePlan,
                  child: Text('Proceed To Pay'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
