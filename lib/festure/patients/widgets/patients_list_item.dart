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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(name),
          Text(date),
          Chip(
            label: Text(status),
            backgroundColor: Colors.blue.withOpacity(0.1),
          ),
        ],
      ),
    );
  }
}
