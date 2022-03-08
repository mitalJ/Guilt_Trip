import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;

  const ElevatedButtonWidget({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
    this.textColor = Colors.white,
    required this.onPressed ,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: 320,
      margin: EdgeInsets.symmetric(vertical: 3),
      child: ElevatedButton(
        child: Text(buttonText),
        onPressed: onPressed,
      ),
    );
  }
}
