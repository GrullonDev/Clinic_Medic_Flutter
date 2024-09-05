import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/festure/dashboard/widgets/dashboard_grid.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: DashboardGrid(),
      ),
    );
  }
}
