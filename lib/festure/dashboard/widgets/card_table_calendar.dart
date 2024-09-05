import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CardTableCalendar extends StatelessWidget {
  const CardTableCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Calendario de Citas',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2025, 12, 31),
              focusedDay: DateTime.now().isAfter(DateTime.utc(2024, 12, 31))
                  ? DateTime.utc(2024, 12, 31)
                  : DateTime.now(),
              calendarFormat: CalendarFormat.month,
            ),
          ],
        ),
      ),
    );
  }
}
