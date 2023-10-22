import 'package:flutter/material.dart';
import '../utils/colors.dart';

class RoundedBottomSheet extends StatelessWidget {
  const RoundedBottomSheet({
    Key? key,
    required this.child,
    this.height,
  }) : super(key: key);

  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.maxFinite,

      child: child,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(16, 0),
            blurRadius: 50,
            color: AppColors.outline,
          )
        ],
      ),
      //padding: EdgeInsets.fromLTRB(30, 24, 30, 50),
    );
  }
}
