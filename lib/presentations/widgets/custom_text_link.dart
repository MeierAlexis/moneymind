import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomTextLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final TextStyle? style;

  const CustomTextLink({
    super.key,
    required this.text,
    required this.onTap,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: style ??
            const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        recognizer: TapGestureRecognizer()..onTap = onTap,
      ),
    );
  }
}
