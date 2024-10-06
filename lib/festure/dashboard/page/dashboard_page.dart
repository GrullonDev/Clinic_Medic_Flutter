import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_graduacion/festure/dashboard/page/dashboard_layout.dart';
import 'package:proyecto_graduacion/widgets/utils/appbar.dart';
import 'package:proyecto_graduacion/widgets/utils/drawer.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
      body: const Padding(
        padding: EdgeInsets.all(45.0),
        child: DashboardLayout(),
      ),
    );
  }
}
