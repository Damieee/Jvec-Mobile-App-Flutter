import 'package:jvec_app/core/app_routes.dart';
import 'package:jvec_app/presentation/modules/home/account/account_controller.dart';
import 'package:jvec_app/presentation/utils/colors.dart';
import 'package:jvec_app/presentation/widgets/pages/icon_and_text_wideget.dart';
import 'package:jvec_app/presentation/widgets/user_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../widgets/app_card.dart';

class AccountPage extends GetView<AccountPageController> {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white12,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(30),
            UserAvatar(initials: controller.initials, radius: 30),
            const Gap(10),
            Text(
              '${controller.user.value.name} ${controller.user.value.surname}'
                  .capitalize!,
              style: Get.textTheme.headlineSmall,
            ),
            const Gap(5),
            Text(controller.user.value.email ?? ''),
            const Gap(15),
/*             ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.editProfile);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(0, 35),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Text(
                "Edit Profile",
                style: Get.textTheme.titleSmall?.copyWith(
                  color: Colors.white,
                ),
              ),
            ), */
            Gap(30),
            AppMaterial(
              margin: EdgeInsets.all(20),
              clipBehavior: Clip.hardEdge,
              radius: 16.0,
              blurRadius: 16.0,
              color: Colors.white,
              child: Column(
                children: [
                  _buildRow(
                    icon: Icons.key,
                    title: 'Change password',
                    onTap: () {
                      Get.toNamed(Routes.changePassword);
                    },
                  ),
                  /* Divider(color: AppColors.offset, height: 1),
                  _buildRow(
                    icon: Icons.card_travel_sharp,
                    title: 'Cards',
                    onTap: () {},
                  ),
                  Divider(color: AppColors.offset, height: 1),
                  _buildRow(
                    icon: Icons.history,
                    title: 'Transaction History',
                    onTap: () {},
                  ),
                  Divider(color: AppColors.offset, height: 1),
                  _buildRow(
                    icon: Icons.history,
                    title: 'Data purchase History',
                    onTap: () {},
                  ), */
                  Divider(color: AppColors.offset, height: 1),
                  _buildRow(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: controller.logout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 7),
      leading: CircleAvatar(
        radius: 15,
        backgroundColor: AppColors.primary.shade100,
        child: Icon(
          icon,
          color: AppColors.primary,
        ),
      ),
      trailing: Icon(CupertinoIcons.right_chevron),
      onTap: onTap,
      dense: true,
      title: Text(
        title,
        // style: TextStyle(color: AppColor.text2, fontSize: 14),
        maxLines: 1,
      ),
    );
  }
}
