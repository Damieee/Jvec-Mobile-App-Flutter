import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.title, this.onPressed});

  final String? title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: (){

      Navigator.pop(context);
    },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
        child: Text('OK')

    );
  }


}