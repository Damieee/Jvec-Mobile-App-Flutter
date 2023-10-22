/* import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItems extends StatelessWidget {
  final String title;
  final String description;

  const PageViewItems({
    Key? key,    @required this.title,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FractionallySizedBox(
          widthFactor: 0.7,
          child: SvgPicture.asset(
            assetImagePath,
            width: MediaQuery.of(context).size.width * 0.632,
            height: 150,
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32.0,
            color: Color(0xFF151522),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            color: Color(0xFF151522),
          ),
        ),
      ],
    );
  }
}
 */