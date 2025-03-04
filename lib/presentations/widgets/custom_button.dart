import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final VoidCallback onPressed;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final String? imagePath;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor = const Color(0XFF2ECC71),
      this.textColor = Colors.black,
      this.fontSize = 16,
      this.padding = const EdgeInsets.all(16.0),
      this.imagePath});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // Aquí ajustas el borderRadius
            )),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (imagePath != null)
            Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  imagePath!,
                  width: 30,
                  height: 30,
                )),
          Text(text,
              style: TextStyle(
                  fontSize: fontSize,
                  color: textColor,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600)),
        ]));
  }
}
