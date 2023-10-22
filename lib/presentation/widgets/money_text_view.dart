import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jvec_app/core/extentions.dart';

class MoneyText extends StatelessWidget {
  const MoneyText(
    this.value, {
    Key? key,
    this.fontsize,
    this.color,
    this.fontWeight,
    this.style,
  }) : super(key: key);

  final double? fontsize;
  final double value;
  final Color? color;
  final FontWeight? fontWeight;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    // Copied from TextView
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    TextStyle? effectiveTextStyle = style;
    if (style == null || style!.inherit)
      effectiveTextStyle = defaultTextStyle.style.merge(style);
    if (MediaQuery.boldTextOf(context))
      effectiveTextStyle = effectiveTextStyle!
          .merge(const TextStyle(fontWeight: FontWeight.bold));

// Back words Compartible
    effectiveTextStyle = effectiveTextStyle?.copyWith(
      fontWeight: fontWeight,
      color: color,
      fontSize: fontsize,
    );

    return RichText(
      text: TextSpan(
        style: effectiveTextStyle,
        children: [
          TextSpan(
              text: '₦ ',
              style: effectiveTextStyle!.copyWith(
                fontFamily: '.SF UI Display',
              )),
          TextSpan(
            text: value.moneyFomart(),
            style: effectiveTextStyle,
          ),
        ],
      ),
    );
  }
}
