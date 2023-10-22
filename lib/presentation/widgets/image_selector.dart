import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../utils/colors.dart';
import 'app_card.dart';

class ImageUploadPlaceHolder extends StatelessWidget {
  const ImageUploadPlaceHolder({
    Key? key,
    this.height,
    this.width,
    this.label,
    this.onTap,
    this.shape = BoxShape.rectangle,
    required this.uri,
  }) : super(key: key);

  final double? height;
  final double? width;
  final String? label;

  /// URI is a super set of URL
  /// It can be used to descibe the link to a resource or the location of a resource on the device
  final String uri;
  final VoidCallback? onTap;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return AppMaterial(
      height: height ?? 108,
      width: width,
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      color: AppColors.scaffold_bg,
      decoration: BoxDecoration(
          shape: shape,
          image: uri.isURL
              ? null
              : DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(
                    File(uri),
                  ),
                )),
      child: (uri.isNotEmpty && uri.isURL)
          ? Image.network(
              uri,
              fit: BoxFit.cover,
            )
          : uri.isNotEmpty
              ? SizedBox.shrink()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/add_cover_photo.svg'),
                    SizedBox(height: 4),
                    Text(
                      label ?? 'Add photo',
                      style: Get.textTheme.bodySmall,
                    )
                  ],
                ),
      onTap: onTap,
    );
  }
}
