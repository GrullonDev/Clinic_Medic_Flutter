import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_graduacion/widgets/images/assets_image.dart';
import 'package:proyecto_graduacion/widgets/routes/app_routes.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomImageWidget(
            imageUrl: 'logo3',
            fit: BoxFit.cover,
            height: 300,
            width: 300,
            isNetwork: false,
          ),
          const Flexible(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 20),
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
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 16.0),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Aquí se manejará la lógica para recuperación de contraseña.
              },
              child: const Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              context.go(AppRoutes.home);
            },
            child: const Text(
              'Iniciar Sesión',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¿No tienes cuenta?',
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  // Aquí se manejará la lógica para registrarse.
                },
                child: const Text(
                  ' Regístrate',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
