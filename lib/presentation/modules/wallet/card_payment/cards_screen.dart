import 'package:jvec_app/presentation/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import 'cards_controller.dart';

class CardsScreen extends GetView<CardsSelectionController> {
  CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Card Tansaction'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                    Get.back(result: 'card');
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
              child: Obx(
                () => controller.cards.value == null
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
                                  onTap: () {
                                    controller.charge_card(debitCard);
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
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/icons/trash.png',
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
