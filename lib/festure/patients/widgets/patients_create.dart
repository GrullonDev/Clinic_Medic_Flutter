import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_graduacion/festure/patients/bloc/patients_bloc.dart';
import 'package:proyecto_graduacion/festure/patients/widgets/forms_patients_create.dart';
import 'package:proyecto_graduacion/widgets/routes/app_routes.dart';
import 'package:proyecto_graduacion/widgets/utils/appbar.dart';
import 'package:proyecto_graduacion/widgets/utils/back_button.dart';

class PatientsCreate extends StatelessWidget {
  const PatientsCreate({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PatientsBloc>();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Crear Paciente',
        onTap: bloc.savePatientNew,
        icon: Icons.save,
        onBack: AppBackButton(
          onPressed: () => context.go(AppRoutes.patients),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.3, vertical: 16.5),
        child: SingleChildScrollView(
          child: FormPatientsCreate(),
        ),
      ),
    );
  }
}
