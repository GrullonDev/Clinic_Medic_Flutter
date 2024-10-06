import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/festure/dashboard/widgets/card_table_calendar.dart';
import 'package:proyecto_graduacion/festure/dashboard/widgets/dashboard_grid.dart';
import 'package:proyecto_graduacion/festure/dashboard/widgets/recent_patients.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 2,
          child: DashboardGrid(),
        ),
        const Flexible(
          flex: 5,
          fit: FlexFit.loose,
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: RecentPatients(),
              ),
              SizedBox(width: 8),
              Expanded(
                flex: 5,
                child: CardTableCalendar(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        'Gráfico de estadísticas',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        'Noticias recientes',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
