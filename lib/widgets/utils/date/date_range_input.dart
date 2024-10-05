import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/widgets/utils/text/custom_input_field.dart';

class DateRangeInputs extends StatelessWidget {
  const DateRangeInputs({
    required this.initDatecontroller,
    // required this.finalDatecontroller,
    required this.onTapInitDate,
    // required this.onTapFinalDate,
    this.titleInitDate = 'Fecha Inicial',
    // this.titleFinalDate = 'Fecha Final',
    super.key,
  });

  final TextEditingController initDatecontroller;
  // final TextEditingController finalDatecontroller;
  final VoidCallback onTapInitDate;
  // final VoidCallback onTapFinalDate;
  final String titleInitDate;
  // final String titleFinalDate;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: titleInitDate,
      suffix: const Icon(
        Icons.calendar_today_outlined,
        color: Colors.blue,
      ),
      readOnly: true,
      controller: initDatecontroller,
      onTap: onTapInitDate,
    );
  }
}


/**
 * Row(
      children: [
        
        CustomInputField(
      labelText: titleFinalDate,
      suffix: const Icon(
        Icons.calendar_today_outlined,
        color: Colors.blue,
      ),
      readOnly: true,
      controller: finalDatecontroller,
      onTap: onTapFinalDate,
    )
      ],
    )
*/