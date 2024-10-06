import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/festure/dashboard/widgets/state_card.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 1;
        double childAspectRatio = 1;

        if (constraints.maxWidth > 1200) {
          crossAxisCount = 4;
          childAspectRatio = 3;
        } else if (constraints.maxWidth > 800) {
          crossAxisCount = 3;
          childAspectRatio = 1.4;
        } else if (constraints.maxWidth > 600) {
          crossAxisCount = 2;
        }

        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: childAspectRatio,
            ),
            children: const [
              StateCard(
                title: 'Total Pacientes',
                value: '1,234',
                icon: Icons.people,
                color: Colors.blue,
              ),
              StateCard(
                title: 'Citas Hoy',
                value: '23',
                icon: Icons.calendar_today,
                color: Colors.green,
              ),
              StateCard(
                title: 'Ingresos Mensuales',
                value: 'Q 45,231.00',
                icon: Icons.attach_money,
                color: Colors.orange,
              ),
              StateCard(
                title: 'Informes Pendientes',
                value: '7',
                icon: Icons.file_copy,
                color: Colors.red,
              ),
            ],
          ),
        );
      },
    );
  }
}
