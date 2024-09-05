import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/festure/dashboard/widgets/dashboard_card.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          DashboardCard(
            title: 'Patient Management',
            icon: Icons.people,
            onTap: () {},
          ),
          DashboardCard(
            title: 'Scheduled Appointments',
            icon: Icons.calendar_today,
            onTap: () {},
          ),
          DashboardCard(
            title: 'Contacts',
            icon: Icons.contacts,
            onTap: () {},
          ),
          // Agrega más elementos según el diseño
        ],
      ),
    );
  }
}
