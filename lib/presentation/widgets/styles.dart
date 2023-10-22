import 'package:flutter/material.dart';
import '../utils/colors.dart';

TextStyle kLabelStyle(BuildContext context) =>
    Theme.of(context).textTheme.labelLarge!.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.label,
        );

TextStyle kHintStyle(BuildContext context) =>
    Theme.of(context).textTheme.labelLarge!.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.hint,
          fontSize: 13,
        );
