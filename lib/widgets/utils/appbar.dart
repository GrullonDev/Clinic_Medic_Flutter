import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_graduacion/home.dart';
import 'package:proyecto_graduacion/widgets/utils/buttons/text_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? onBack;
  final VoidCallback? onSearchPressed;
  final VoidCallback onTap;
  final IconData icon;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onSearchPressed,
    required this.onTap,
    required this.icon,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: onBack,
      title: Center(child: Text(title)),
      actions: [
        if (onSearchPressed != null)
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: onSearchPressed,
          ),
        IconButton(
          icon: Icon(icon),
          onPressed: onTap,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
