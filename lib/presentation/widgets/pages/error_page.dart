import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/values.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    this.title,
    this.desc,
    this.onTryAgain,
    this.assetName,
    this.shrink = false,
  });

  final String? assetName;
  final String? title;
  final String? desc;
  final bool shrink;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: shrink ? const EdgeInsets.all(AppPadding.p48) : EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (assetName != null)
            Expanded(
              flex: 2,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    assetName!,
                  )),
            ),
          spacer(h: AppSize.s40),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  title ?? '',
                  textAlign: TextAlign.center,
                  style: Get.theme.appBarTheme.titleTextStyle,
                ),
                spacer(h: AppSize.s24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    desc ?? '',
                    textAlign: TextAlign.center,
                    style: Get.textTheme.bodySmall!,
                  ),
                ),
                spacer(h: AppSize.s24),
                if (onTryAgain != null)
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/refresh.png'),
                        ),
                        TextButton(
                          child: Text('Tap to refresh'),
                          onPressed: onTryAgain,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
