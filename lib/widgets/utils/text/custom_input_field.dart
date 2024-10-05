import 'package:flutter/material.dart';

enum ValidatorType { email, phone, none }

class CustomInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final int maxLines;
  final Color? backgroundColor;
  final Color? textColor;
  final ValidatorType validatorType;
  final VoidCallback? onTap;
  final bool? readOnly;
  final Icon? suffix;

  const CustomInputField({
    super.key,
    required this.labelText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
    this.backgroundColor,
    this.textColor,
    this.validatorType = ValidatorType.none,
    this.onTap,
    this.readOnly = false,
    this.suffix,
  });

  String? _validateInput(String? value) {
    switch (validatorType) {
      case ValidatorType.email:
        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
        if (value == null || !emailRegex.hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        break;
      case ValidatorType.phone:
        final phoneRegex = RegExp(r'^\+?[0-9]{10,13}$');
        if (value == null || !phoneRegex.hasMatch(value)) {
          return 'Please enter a valid phone number';
        }
        break;
      case ValidatorType.none:
      default:
        return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 12.0,
          ),
          filled: true,
          fillColor: backgroundColor,
          errorText: _validateInput(controller?.text),
        ),
        style: TextStyle(
          color: textColor ?? Colors.black87,
        ),
        onChanged: (value) {
          // Trigger validation on text change
          _validateInput(value);
        },
      ),
    );
  }
}
