import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAvatar extends StatelessWidget {
  final String initials;
  final double radius;
  final String? imageUrl;
  final Color backgroundColor;

  const UserAvatar({
    this.initials = "",
    this.radius = 30,
    this.backgroundColor = Colors.blue,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // For some wierd error, they have to be seperated
    return imageUrl != null
        ? CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(imageUrl!),
          )
        : CircleAvatar(
            radius: radius,
            backgroundColor: backgroundColor,
            child: Text(
              initials.capitalizeFirst!,
              style: TextStyle(
                color: Colors.white,
                fontSize: radius * 0.8,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
