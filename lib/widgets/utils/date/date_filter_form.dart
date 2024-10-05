import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/widgets/utils/format/date_format.dart';

class DateFilterForm {
  DateFilterForm({
    required BuildContext context,
    required VoidCallback onUpdate,
    this.initialFirstDate,
    this.initialLastDate,
    this.finalLastDate,
  })  : _context = context,
        _onUpdate = onUpdate;

  final BuildContext _context;

  bool isInitialDateSelected = false;
  DateTime? selectedInitialDate;
  DateTime? selectedFinalDate;

  final DateTime? initialFirstDate;
  final DateTime? initialLastDate;
  final DateTime? finalLastDate;

  final formKey = GlobalKey<FormState>();
  final initDateController = TextEditingController();
  final finalDateController = TextEditingController();

  final VoidCallback _onUpdate;

  Future<void> selectInitialDate() async {
    final currentDate = DateTime.now();

    final pickedDate = await showDatePicker(
      context: _context,
      initialDate: selectedInitialDate ?? currentDate,
      firstDate: initialFirstDate ?? DateTime(currentDate.year - 1),
      lastDate: initialLastDate ?? currentDate,
      helpText: 'Fecha de Nacimiento',
    );

    if (pickedDate != null) {
      selectedInitialDate = pickedDate;
      initDateController.text = pickedDate.display();
      isInitialDateSelected = true;

      _onUpdate();

      await Future.delayed(const Duration(milliseconds: 200));
    }
  }

  DateTime? get formatFinalDate =>
      selectedFinalDate?.add(const Duration(days: 1));
}
