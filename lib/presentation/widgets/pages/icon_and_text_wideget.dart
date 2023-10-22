import 'package:jvec_app/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon1;
  final String text;
  final IconData icon2;
  //final Color iconColor;

  const IconAndTextWidget({
    super.key,
    required this.icon1,
    required this.text,
    required this.icon2,

    //  required this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon1,
              size: 20,
            ),
            SizedBox(width: 10),
            Text(text),
          ],
        ),
        Icon(
          icon2,
          size: 20,
        ),
      ],
    );
  }
}
