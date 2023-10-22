import 'package:flutter/material.dart';

class AppColors {
  static const Color scrim = Colors.black26;

  static const Color blue = Color(0xFF003D5B);

  static const Color green = Color(0xFF4DAD83);

  static const Color dashboardBlack = Color(0xFF1D1D1D);

  static const Color backgroundColor = Color(0xFFF6F6FB);

  static const Color whiteColor = Color(0xFFFFFFFF);

  static const Color dashboardOrange = Color(0xBFFF7500);

  static const Color red = Color(0xFFDA100B);
  static const Color scaffold_bg = Color(0xFFF7F7FC);

  static const Color label = Color(0xFF6E7191);
  static const Color outline = Color(0xFFD9DBE9);
  static const Color outline_btn = Color(0xFF263238);
  static const Color hint = Color(0xFFA0A3BD);
  static const Color input_bg = Color(0xFFEFF0F6);

  static const Color off_white = Color(0xFFFCFCFC);

  static const Color buttonText = Color(0xFF4E4B66);

  static const Color text = Color(0xFF14142B);

  static const Color offset = Color(0x14323247);

  // static const MaterialColor primary = Color(0xFFE0371D);

  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFfff7f1),
      100: Color(0xFFFFf0e3),
      200: Color(0xFFFFd1aa),
      300: Color(0xFFFFb271),
      400: Color(0xFFFF9439),
      500: Color(_primaryValue),
      600: Color(0xFFc65b00),
      700: Color(0xFF8e4100),
      800: Color(0xFF552700),
      900: Color(0xFF1c0d00),
    },
  );
  static const int _primaryValue = 0xFFE0371D;
}
