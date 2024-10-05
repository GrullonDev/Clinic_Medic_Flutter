import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_graduacion/widgets/routes/app_routes.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Flexible(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Correo Electrónico',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        const Flexible(
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              // Aquí se manejará la lógica para recuperación de contraseña.
            },
            child: const Text('¿Olvidaste tu contraseña?'),
          ),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.home);
              },
              child: const Text('Iniciar Sesión'),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                // Aquí se manejará la lógica para registrarse.
              },
              child: const Text('¿No tienes cuenta? Regístrate'),
            ),
          ],
        ),
      ],
    );
  }
}
