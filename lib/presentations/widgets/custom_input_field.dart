import 'package:flutter/material.dart';
import 'package:moneymind/styles/text_styles.dart';

class CustomInputField extends StatefulWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final Icon? icon;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
    required this.controller,
    this.icon,
  });

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 7.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword,
        style: AppTextStyles.inputText,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey.shade400), // Light gray text
          filled: true,
          fillColor: Color(0xFFF0EEE7), // Light background color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Color(0xFFEAE7DF),
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Color(0xFFEAE7DF), width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          prefixIcon: widget.icon ??
              Icon(
                widget.isPassword ? Icons.lock : Icons.mail,
                color: Colors.grey.shade500,
              ),
        ),
      ),
    );
  }
}
