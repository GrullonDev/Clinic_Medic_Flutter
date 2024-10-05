import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/festure/login/widgets/login_form.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: LoginForm(),
    );
  }
}

/**
 * CustomImageWidget(
            imageUrl: '',
          ),
*/