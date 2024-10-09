import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_graduacion/festure/login/bloc/login_bloc.dart';
import 'package:proyecto_graduacion/widgets/images/assets_image.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();

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
          Flexible(
            child: TextField(
              controller: bloc.emailController,
              decoration: const InputDecoration(
                labelText: 'Correo Electrónico',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 16.0),
          Flexible(
            child: TextField(
              controller: bloc.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(fontSize: 20),
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
            onPressed: bloc.login,
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
                onPressed: bloc.navigateToRegister,
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
