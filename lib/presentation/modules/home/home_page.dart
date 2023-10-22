import 'package:jvec_app/presentation/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jvec_app/presentation/widgets/app_card.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../core/app_routes.dart';
import '../../../../core/extentions.dart';

import '../../utils/constants.dart';
import '../../widgets/money_text_view.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello ${(controller.user.value.name ?? controller.user.value.username)}!',
        ),
        automaticallyImplyLeading: false,
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.contact);
        },
        elevation: 3,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    return RefreshIndicator(
      key: controller.refreshIndicatorKey,
      onRefresh: controller.refresh,
      child: ListView(
        children: [
          AppMaterial(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            onTap: () {
              // Do something on Tap
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Oluwaseyifunmi Ipaye',
                  style: Get.textTheme.labelMedium,
                ),
                Gap(10),
                Text(
                  '08156655622',
                  style: Get.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildActionButton({
    required String text,
    required VoidCallback onPressed,
    required Widget icon,
  }) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
