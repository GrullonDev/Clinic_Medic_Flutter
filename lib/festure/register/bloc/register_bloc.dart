import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_graduacion/widgets/routes/app_routes.dart';
import 'package:proyecto_graduacion/widgets/utils/base_model.dart';
import 'package:proyecto_graduacion/widgets/utils/message_display.dart';

class RegisterBloc extends BaseModel {
  RegisterBloc({
    required BuildContext context,
  }) : _context = context;

  final BuildContext _context;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordSecundaryController =
      TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser() async {
    if (passwordController.text != confirmPasswordController.text) {
      throw Exception("Las contraseñas no coinciden");
    }

    if (passwordController.text.length < 8) {
      return MessageDisplay.failure(
          _context, "La contraseña debe tener al menos 8 caracteres.");
    }

    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set(
        {
          'name': nameController.text,
          'email': emailController.text,
          'passwordSecundary': passwordSecundaryController.text,
        },
      );

      if (_context.mounted) {
        MessageDisplay.success(_context, "Usuario registrado con éxito ");
        GoRouter.of(_context).go(AppRoutes.home);
      }
    } catch (e) {
      if (_context.mounted) {
        return MessageDisplay.failure(
            _context, "Error al registrar el usuario $e");
      }
    }
  }
}
