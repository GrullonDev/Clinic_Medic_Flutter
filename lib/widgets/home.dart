import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_graduacion/festure/dashboard/widgets/card_table_calendar.dart';
import 'package:proyecto_graduacion/festure/dashboard/widgets/state_card.dart';
import 'package:proyecto_graduacion/festure/patients/widgets/patients_list_item.dart';
import 'package:proyecto_graduacion/widgets/routes/app_routes.dart';
import 'package:proyecto_graduacion/widgets/utils/appbar.dart';
import 'package:proyecto_graduacion/widgets/utils/drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Clínica Médica',
        onSearchPressed: () {},
        onTap: () => GoRouter.of(context).go('/'),
        icon: Icons.exit_to_app_outlined,
      ),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const StateCard(
            title: 'Total Pacientes',
            value: '1,234',
            icon: Icons.people,
            color: Colors.blue,
          ),
          const StateCard(
            title: 'Citas Hoy',
            value: '23',
            icon: Icons.calendar_today,
            color: Colors.green,
          ),
          const StateCard(
            title: 'Ingresos Mensuales',
            value: 'Q 45,231.00',
            icon: Icons.attach_money,
            color: Colors.orange,
          ),
          const StateCard(
            title: 'Informes Pendientes',
            value: '7',
            icon: Icons.file_copy,
            color: Colors.red,
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const CardTableCalendar(),
        ],
      ),
    );
  }
}
