import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AppBackButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 16,
        ),
        IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          iconSize: 24,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
