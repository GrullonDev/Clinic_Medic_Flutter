import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_graduacion/festure/patients/bloc/patients_bloc.dart';
import 'package:proyecto_graduacion/festure/patients/widgets/forms_patients_create.dart';
import 'package:proyecto_graduacion/widgets/routes/app_routes.dart';
import 'package:proyecto_graduacion/widgets/utils/appbar.dart';
import 'package:proyecto_graduacion/widgets/utils/buttons/text_button.dart';

class PatientsCreate extends StatelessWidget {
  const PatientsCreate({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PatientsBloc>();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Crear Paciente',
        onTap: () {},
        onBack: AppTextButton(
          title: 'REGRESAR',
          onTap: () => context.go(AppRoutes.patients),
        ),
        icon: Icons.save,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.3, vertical: 16.5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FormPatientsCreate(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  AppTextButton(
                    title: 'GUARDAR',
                    onTap: () {
                      // Lógica para guardar el formulario
                      bloc.savePatientNew();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
