import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/festure/login/bloc/login_bloc.dart';
import 'package:proyecto_graduacion/festure/login/pages/login_layout.dart';
import 'package:proyecto_graduacion/widgets/utils/base_model_scaffold.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseModelScaffold(
      model: LoginBloc(),
      builder: (context, _) {
        return const Scaffold(
          body: Center(
            child: LoginLayout(),
          ),
        );
      },
    );
  }
}
