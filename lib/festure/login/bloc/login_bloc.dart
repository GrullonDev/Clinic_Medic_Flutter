import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_graduacion/widgets/routes/app_routes.dart';
import 'package:proyecto_graduacion/widgets/utils/base_model.dart';
import 'package:proyecto_graduacion/widgets/utils/message_display.dart';

class LoginBloc extends BaseModel {
  LoginBloc({
    required BuildContext context,
  }) : _context = context;

  final BuildContext _context;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  String emailError = '';
  String passwordError = '';

  bool validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (email.isEmpty) {
      emailError = 'Ingrese tu correo electrónico';
      MessageDisplay.failure(_context, emailError);
      return false;
    } else if (!emailRegex.hasMatch(email)) {
      emailError = 'Ingresa un correo electrónico válido';
      MessageDisplay.failure(_context, emailError);
      return false;
    }
    emailError = '';
    return true;
  }

  bool validatePassword(String password) {
    if (password.isEmpty) {
      passwordError = 'Ingresa tu contraseña';
      MessageDisplay.failure(_context, passwordError);
      return false;
    }
    passwordError = '';
    return true;
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (!validateEmail(email) || !validatePassword(password)) {
      return;
    }

    if (_context.mounted) {}

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // Verificar si el widget sigue montado antes de intentar navegar
      if (_context.mounted) {
        GoRouter.of(_context).go(AppRoutes.home);
      }
      // Navegar a la siguiente pantalla o mostrar un mensaje de éxito
    } on FirebaseAuthException catch (e) {
      if (_context.mounted) {
        if (e.code == 'user-not-found') {
          MessageDisplay.failure(_context, 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          MessageDisplay.failure(_context, 'Wrong password provided.');
        } else {
          MessageDisplay.failure(
              _context, 'An error occurred. Please try again.');
        }
      }

      notifyListeners();
    }
  }

  void navigateToRegister() {
    GoRouter.of(_context).go(AppRoutes.register);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
