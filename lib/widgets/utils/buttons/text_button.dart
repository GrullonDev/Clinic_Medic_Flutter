import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/widgets/utils/ui/button_theme.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.title,
    this.child,
    required this.onTap,
    this.style,
  }) : assert(
          title != null || child != null,
          'Title or child, should be null',
        );

  final String? title;
  final Widget? child;
  final VoidCallback? onTap;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: style ?? UIButtonStyle.textButtonStyle(),
        onPressed: onTap,
        child: FittedBox(
          child: child ?? Text(title!),
        ),
      ),
    );
  }
}
