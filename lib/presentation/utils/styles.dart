import 'package:jvec_app/presentation/utils/strings.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color,
    {double letterSpacing = .75, double? height}) {
  return TextStyle(
      fontFamily: kPoppins,
      fontSize: fontSize,
      color: color,
      height: height,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing);
}

// Title
TextStyle getTitleLargeStyle({required Color color}) {
  return _getTextStyle(20, FontWeight.w700, color);
}

// TextInputStyle
TextStyle getTitleMediumStyle({required Color color}) {
  return _getTextStyle(14, FontWeight.w500, color);
}

TextStyle getTitleSmallStyle({required Color color}) {
  return _getTextStyle(13, FontWeight.w600, color, letterSpacing: 1);
}

// Body
TextStyle getBodyLargeStyle({required Color color}) {
  return _getTextStyle(20, FontWeight.w400, color,
      height: kLineHeight(32, fontSize: 20));
}

TextStyle getBodyMediumStyle({required Color color}) {
  return _getTextStyle(14, FontWeight.w500, color);
}

TextStyle getBodySmallStyle({required Color color}) {
  return _getTextStyle(13, FontWeight.w400, color);
}

// Label
TextStyle getLabelSmallStyle({required Color color}) {
  return _getTextStyle(13, FontWeight.w500, color);
}

TextStyle getAppBarTitleStyle({required Color color}) {
  return _getTextStyle(16, FontWeight.w600, color,
      letterSpacing: 1, height: kLineHeight(30, fontSize: 16));
}
// light text style

// TextStyle getLightStyle(
//     {double fontSize = FontSize.s12, required Color color}) {
//   return _getTextStyle(
//       fontSize, FontConstants.fontFamily, FontWeightManager.light, color);
// }
// // bold text style

// TextStyle getBoldStyle(
//     {double fontSize = FontSize.s12, required Color color}) {
//   return _getTextStyle(
//       fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
// }

// // semi bold text style

// TextStyle getSemiBoldStyle(
//     {double fontSize = FontSize.s12, required Color color}) {
//   return _getTextStyle(
//       fontSize, FontConstants.fontFamily, FontWeightManager.semiBold, color);
// }


// // medium text style

// TextStyle getMediumStyle(
//     {double fontSize = FontSize.s12, required Color color}) {
//   return _getTextStyle(
//       fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
// }










