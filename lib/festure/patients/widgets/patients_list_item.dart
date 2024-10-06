import 'package:flutter/material.dart';

class PatientsListItem extends StatelessWidget {
  const PatientsListItem({
    super.key,
    required this.name,
    required this.date,
    required this.status,
  });

  final String name;
  final String date;
  final String status;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Layout for larger screens
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(name, style: const TextStyle(fontSize: 18)),
                Text(date, style: const TextStyle(fontSize: 18)),
                Chip(
                  label: Text(status, style: const TextStyle(fontSize: 18)),
                  backgroundColor: Colors.blue.withOpacity(0.1),
                ),
              ],
            ),
          );
        } else {
          // Layout for smaller screens
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 4),
                Text(date, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 4),
                Chip(
                  label: Text(status, style: const TextStyle(fontSize: 16)),
                  backgroundColor: Colors.blue.withOpacity(0.1),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
