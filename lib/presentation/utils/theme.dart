import 'package:jvec_app/presentation/utils/strings.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'constants.dart';
import 'styles.dart';

kGetInputBorder(Color color) => OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
      borderSide: BorderSide(color: color),
    );

ThemeData getLightTheme() {
  return ThemeData(
    // colorScheme: ColorScheme.fromSwatch(
    //   primarySwatch: AppColors.primary,
    //   accentColor: AppColors.primary,
    //   errorColor: AppColors.red,
    // ),
    fontFamily: kPoppins,
    brightness: Brightness.light,
    // useMaterial3: useMaterial3,

    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    ),
    //splashColor: Colors.black.withOpacity(0.2),
    scaffoldBackgroundColor: AppColors.scaffold_bg,
    drawerTheme: DrawerThemeData(scrimColor: AppColors.scrim),
    // textTheme: GoogleFonts.poppinsTextTheme(),
    // textTheme: textTheme.copyWith(
    //   titleLarge: getTitleLargeStyle(color: Colors.black),
    //   titleMedium: getTitleMediumStyle(color: Colors.black),
    //   titleSmall: getTitleSmallStyle(color: AppColors.text),
    //   //labelLarge: getBodyLargeStyle(color: AppColors.otpText),
    //   labelSmall: getLabelSmallStyle(color: AppColors.label),
    //   bodyLarge: getBodyLargeStyle(color: AppColors.text),
    //   bodyMedium: getBodyMediumStyle(color: AppColors.text),
    //   bodySmall: getBodySmallStyle(color: AppColors.label),
    // ),
    dialogTheme: DialogTheme(
      shape: kRoundedRectangularBorder(),
    ),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      titleTextStyle: getAppBarTitleStyle(color: Colors.black),
    ),
    iconTheme: IconThemeData(size: 20),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        minimumSize: Size(239, 48),
        backgroundColor: AppColors.primary,
        elevation: 2,
        textStyle: TextStyle(
          fontFamily: kPoppins,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
        shape: kRoundedRectangularBorder(),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      minimumSize: Size(0, 48),
      textStyle: TextStyle(
          fontFamily: kPoppins,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
          height: kLineHeight(28, fontSize: 16)),
      shape: kRoundedRectangularBorder(),
      //onPrimary: Colors.white,
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(0, 48),
        textStyle: TextStyle(
          fontFamily: kPoppins,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
        side: BorderSide(color: AppColors.outline, width: 1),
        shape: kRoundedRectangularBorder(),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      helperMaxLines: 2,
      errorMaxLines: 2,
      isDense: true,
      focusedBorder: kGetInputBorder(AppColors.primary),
      enabledBorder: kGetInputBorder(AppColors.outline),
      errorBorder: kGetInputBorder(AppColors.red),
      focusedErrorBorder: kGetInputBorder(AppColors.red),
      hintStyle: getLabelSmallStyle(
        color: AppColors.hint,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: AppColors.primary.shade100,
      //backgroundColor: Colors.white,
      elevation: 10,
      surfaceTintColor: Colors.white,
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return IconThemeData(size: 20, color: AppColors.primary);
        }
        return IconThemeData(size: 20, color: AppColors.buttonText);
      }),
      labelTextStyle: MaterialStateProperty.all(
          getBodyMediumStyle(color: AppColors.buttonText)),
    ),
  );
}

ThemeData getDarkTheme() {
  final theme = ThemeData(brightness: Brightness.dark);

  return ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.primary,
      accentColor: AppColors.primary,
      errorColor: AppColors.red,
    ),
    scaffoldBackgroundColor: AppColors.scaffold_bg,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      titleTextStyle: getAppBarTitleStyle(color: Colors.black),
    ),
    iconTheme: IconThemeData(size: 20, color: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      minimumSize: Size(0, 48),
      textStyle: TextStyle(
        fontFamily: kPoppins,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
      shape: kRoundedRectangularBorder(),
    )),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      minimumSize: Size(0, 48),
      textStyle: TextStyle(
        fontFamily: kPoppins,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
      shape: kRoundedRectangularBorder(),
      //onPrimary: Colors.white,
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.buttonText,
        minimumSize: Size(0, 48),
        textStyle: TextStyle(
          fontFamily: kPoppins,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
        shape: kRoundedRectangularBorder(),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      focusedBorder: kGetInputBorder(AppColors.primary),
      enabledBorder: kGetInputBorder(AppColors.outline),
    ),
  );
}
