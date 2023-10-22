import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jvec_app/presentation/modules/payment/offline_payment/offline_payment_controller.dart.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends GetView<OfflinePaymentController> {
  QrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make Payment'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Gap(50),
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: QrImageView(
              data: controller.offlineData,
              size: 230,
              // You can include embeddedImageStyle Property if you
              //wanna embed an image from your Asset folder
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: const Size(
                  100,
                  100,
                ),
              ),
            ),
          ),
          Gap(0),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text('Username'),
                    ),
                    Text(controller.user.value.username ?? '')
                  ],
                ),
                Gap(10),
                Row(
                  children: [
                    Expanded(
                      child: Text('Wallet ID:'),
                    ),
                  ],
                ),
                // Obx(() => Text(controller.user.value.wallet?.id ?? '')),
                Gap(70),
                Text(
                  'Hold up your smartphone\nfor a marchant to scan',
                  style: Get.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
