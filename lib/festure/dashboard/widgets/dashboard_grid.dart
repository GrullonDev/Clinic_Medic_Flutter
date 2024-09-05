import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/festure/dashboard/widgets/dashboard_tile.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // Cambia este valor según tus necesidades
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        DashboardTile(
          title: 'Patient Management',
          icon: Icons.people,
          onTap: () {
            // Navegar a la página correspondiente
          },
        ),
        DashboardTile(
          title: 'Scheduled Appointments',
          icon: Icons.schedule,
          onTap: () {
            // Navegar a la página correspondiente
          },
        ),
        DashboardTile(
          title: 'Contacts',
          icon: Icons.contacts,
          onTap: () {
            // Navegar a la página correspondiente
          },
        ),
        DashboardTile(
          title: 'Services',
          icon: Icons.medical_services,
          onTap: () {
            // Navegar a la página correspondiente
          },
        ),
        // Agrega más tiles según sea necesario
      ],
    );
  }
}
