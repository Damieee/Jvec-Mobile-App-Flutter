import 'package:flutter/material.dart';
import '../utils/colors.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;

  PageIndicator({this.count = 0, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List<Widget>.generate(
        count,
        (index) => Circle(
            color: (index == currentIndex) ? Colors.white : AppColors.primary),
      ),
    );
  }
}

class Circle extends StatelessWidget {
  final Color? color;

  const Circle({this.color = AppColors.primary});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        height: 6,
        width: 6,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
