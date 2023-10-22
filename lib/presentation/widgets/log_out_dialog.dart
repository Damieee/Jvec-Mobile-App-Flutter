import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({
    super.key,
    required this.onContinuationPressed,
  });

  final VoidCallback onContinuationPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Are you sure you want to log out?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.dashboardBlack,
                      fontWeight: FontWeight.bold)),
            ),
            Gap(24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    this.onContinuationPressed();
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                spacer(w: 30),
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 100,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      "No",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
