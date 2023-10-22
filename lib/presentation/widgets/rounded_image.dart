import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage(
    this.url, {
    Key? key,
    this.radius = 16,
    this.height = 62,
    this.width = 62,
  }) : super(key: key);

  final String url;
  final double radius;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius), // Image border
      child: Image.network(
        url,
        height: height,
        width: width,
        fit: BoxFit.cover,
        errorBuilder: (context, t, s) => Container(
          color: AppColors.outline,
          height: height,
          width: width,
          child: Text(
            "😢 \n Could't load",
            style: Get.textTheme.bodyMedium?.copyWith(
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class CustomRoundedImage extends StatelessWidget {
  const CustomRoundedImage(
    this.url, {
    Key? key,
    this.radius = 16,
    this.height = 100,
    this.width = 100,
  }) : super(key: key);

  final String url;
  final double radius;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ), // Image border
      child: Image.asset(
        url,
        height: height,
        width: width,
        fit: BoxFit.cover,
        errorBuilder: (context, t, s) => Container(
          color: AppColors.outline,
          height: height,
          width: width,
          child: Text(
            "😢 \n Could't load",
            style: Get.textTheme.bodyMedium?.copyWith(
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ImageAsset extends StatelessWidget {
  const ImageAsset(
    this.url, {
    Key? key,
    this.radius = 16,
    this.height = 50,
    this.width = 50,
  }) : super(key: key);

  final String url;
  final double radius;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius), // Image border
      child: Image.asset(
        url,
        height: height,
        width: width,
        fit: BoxFit.cover,
        errorBuilder: (context, t, s) => Container(
          color: AppColors.outline,
          height: height,
          width: width,
          child: Text(
            "😢 \n Could't load",
            style: Get.textTheme.bodyMedium?.copyWith(
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
