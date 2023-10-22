import 'package:jvec_app/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../widgets/app_card.dart';
import '../../../widgets/money_text_view.dart';
import 'data_plan_controller.dart';

class DataPlanScreen extends GetView<DataPlanController> {
  DataPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.plan_category.value!.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => controller.plan_category.value == null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: controller.plan_category.value!.plans.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 20),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final plan =
                            controller.plan_category.value!.plans[index];

                        return AppMaterial(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                plan.title,
                                style: Get.textTheme.titleMedium,
                              ),
                              Gap(23),
                              Text(
                                'Valid for ${plan.days_to_use} days',
                                style: Get.textTheme.bodySmall,
                              ),
                              Gap(24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MoneyText(
                                    plan.price,
                                    style: Get.textTheme.headlineSmall,
                                  ),
                                  TextButton(
                                    child: Row(
                                      children: [
                                        Text(
                                          'Buy now ',
                                          style: Get.textTheme.bodySmall,
                                        ),
                                        Icon(
                                          Icons.north_east,
                                          size: 15,
                                          color: Get.textTheme.bodySmall?.color,
                                        )
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(0, 31),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                    onPressed: () {
                                      Get.toNamed(
                                        Routes.purchasePlan,
                                        arguments: plan,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
