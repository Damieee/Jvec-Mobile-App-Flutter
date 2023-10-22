import 'package:jvec_app/core/app_routes.dart';
import 'package:jvec_app/presentation/modules/data/buy_data/buy_data_controller.dart';
import 'package:jvec_app/presentation/widgets/indicators.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../utils/colors.dart';
import '../../../widgets/app_card.dart';
import '../../../widgets/money_text_view.dart';

class BuyDataScreen extends GetView<BuyDataController> {
  BuyDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Data'),
      ),
      body: RefreshIndicator(
        onRefresh: controller.fetchData,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Current Plan',
                  style: Get.textTheme.titleSmall,
                ),
              ),
              AppMaterial(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                color: AppColors.blue,
                child: DefaultTextStyle(
                  style: TextStyle(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => Text(controller.user.value.profile)),
                          Image.asset(
                            'assets/images/fast_link_logo_compact.png',
                            width: 60,
                          )
                        ],
                      ),
                      Gap(8),
                      Obx(
                        () => Text(
                          '${controller.user_plan.value?.data_value ?? ''} ${controller.user_plan.value?.data_unit.toUpperCase() ?? ''}',
                          style: Get.textTheme.headlineLarge
                              ?.apply(color: Colors.white),
                        ),
                      ),
                      Gap(10),
                      Obx(
                        () => Text(
                            'Valid for ${controller.user_plan.value?.days_to_use ?? 90} days'),
                      ),
                      Gap(6),
                      GetX<BuyDataController>(
                        builder: (_) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MoneyText(
                                controller.user_plan.value?.price ?? 0,
                                style: Get.textTheme.titleLarge
                                    ?.apply(color: Colors.white),
                              ),
                              if (controller.user_plan.value?.renewable ??
                                  false)
                                TextButton(
                                  child: Row(
                                    children: [
                                      Text(
                                        'Re-purchase plan ',
                                        style: Get.textTheme.bodySmall
                                            ?.apply(color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.north_east,
                                        size: 12,
                                        color: Colors.white,
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
                                      arguments: controller.user_plan.value,
                                    );
                                  },
                                ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Gap(20),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Our Data Plans',
                  style: Get.textTheme.titleSmall,
                ),
              ),
              Gap(20),
              Obx(
                () => controller.plan_categories.value == null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.plan_categories.value!.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 20),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final plan_category =
                              controller.plan_categories.value![index];

                          /*  return AppMaterial(
                            height: 220, //220
                            // width: 200,
                            margin: EdgeInsets.only(top: 38),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/high_speed.png'),
                                  fit: BoxFit.cover),
                            ),
                            onTap: () {}, // onPressed,
                            // color: Colors.red,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 110,
                                width: double.maxFinite,
                                color: Colors.black54,
                                padding:
                                    const EdgeInsets.fromLTRB(12, 10, 12, 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'High-Speed Monthly Plans',
                                      style: Get.textTheme.titleSmall?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Stream videos without worrying about of data',
                                        style:
                                            Get.textTheme.labelSmall?.copyWith(
                                          color: Colors.white,
                                          // fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Circle(color: Colors.white),
                                        Gap(10),
                                        Text(
                                          'Limited to 5MB/S',
                                          style: Get.textTheme.labelSmall
                                              ?.copyWith(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.w800,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Circle(color: Colors.white),
                                        Gap(10),
                                        Text(
                                          '2 Simultaneous connections',
                                          style: Get.textTheme.labelSmall
                                              ?.copyWith(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.w800,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Circle(color: Colors.white),
                                        Gap(10),
                                        Text(
                                          'Pocket Friendly',
                                          style: Get.textTheme.labelSmall
                                              ?.copyWith(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.w800,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
 */
                          return AppMaterial(
                            margin: EdgeInsets.only(bottom: 20),
                            clipBehavior: Clip.antiAlias,
                            onTap: () {
                              Get.toNamed(
                                Routes.dataPlan,
                                arguments: plan_category,
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Image.asset(
                                  plan_category.image,
                                  fit: BoxFit.cover,
                                  height: 150,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        plan_category.title,
                                        style:
                                            Get.textTheme.titleSmall?.copyWith(
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Gap(5),
                                      Wrap(
                                        children: plan_category.tips
                                            .map((e) => _build_tag(e))
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _build_tag(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Circle(color: Colors.black),
        Text(
          title,
          style: Get.textTheme.labelSmall?.copyWith(
              // fontWeight: FontWeight.w800,
              ),
        ),
        Gap(10)
      ],
    );
  }
}
