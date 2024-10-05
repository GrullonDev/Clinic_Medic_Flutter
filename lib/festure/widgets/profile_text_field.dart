import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String initialValue;
  final Function(String) onChanged;
  final TextInputType keyboardType;

  const TextFieldWidget({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        initialValue: initialValue,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    );
  }
}
