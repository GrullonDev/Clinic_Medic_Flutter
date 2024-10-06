import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_graduacion/festure/patients/widgets/patients_list_item.dart';
import 'package:proyecto_graduacion/widgets/routes/app_routes.dart';

class RecentPatients extends StatelessWidget {
  const RecentPatients({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      borderOnForeground: true,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Pacientes Recientes',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () => context.go(AppRoutes.patients),
                    child: const Text('Ver todos'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const PatientsListItem(
                name: 'María García',
                date: '10/05/2023',
                status: 'Seguimiento',
              ),
              const PatientsListItem(
                name: 'Juan Pérez',
                date: '12/05/2023',
                status: 'Alta',
              ),
              const PatientsListItem(
                name: 'Ana Martínez',
                date: '15/05/2023',
                status: 'En tratamiento',
              ),
              const PatientsListItem(
                name: 'Juan Pérez',
                date: '12/05/2023',
                status: 'Alta',
              ),
              const PatientsListItem(
                name: 'Ana Martínez',
                date: '15/05/2023',
                status: 'En tratamiento',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
