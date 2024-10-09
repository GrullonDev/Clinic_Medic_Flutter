import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/festure/register/bloc/register_bloc.dart';
import 'package:proyecto_graduacion/festure/register/pages/register_layout.dart';
import 'package:proyecto_graduacion/widgets/utils/base_model_scaffold.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseModelScaffold(
      model: RegisterBloc(context: context),
      builder: (_, __) => const Scaffold(
        backgroundColor: Colors.white60,
        body: RegisterLayout(),
      ),
    );
  }
}
