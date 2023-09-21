import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final VoidCallback? onPressed;

  const ColorButton({
    Key? key,
    required this.buttonName,
    required this.buttonColor,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return  TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0)
        ),
        fixedSize: Size(size.width/3, size.height/16),
      ),
      icon: SizedBox(
        width: size.width/8,
        height: size.height/16,
        child: Card(
          color: buttonColor,
        ),
      ),
      label: Text(
        buttonName,
        style: TextStyle(color: buttonColor)
      ),
    );
  }
}
