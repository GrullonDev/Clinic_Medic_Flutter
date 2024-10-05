import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/widgets/utils/date/date_filter_form.dart';
import 'package:proyecto_graduacion/widgets/utils/date/date_range_input.dart';
import 'package:proyecto_graduacion/widgets/utils/text/custom_input_field.dart';

class FormPatientsCreate extends StatelessWidget {
  final TextEditingController nombreController;
  final TextEditingController apellidoController;
  final TextEditingController telefonoController;
  final TextEditingController correoController;
  final TextEditingController edadController;
  final DateFilterForm filterFormDate;
  final TextEditingController generoController;
  final TextEditingController direccionController;
  final TextEditingController ocupacionController;
  final TextEditingController motivoConsultaController;

  const FormPatientsCreate({
    super.key,
    required this.nombreController,
    required this.apellidoController,
    required this.telefonoController,
    required this.correoController,
    required this.edadController,
    required this.filterFormDate,
    required this.generoController,
    required this.direccionController,
    required this.ocupacionController,
    required this.motivoConsultaController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        children: <Widget>[
          CustomInputField(
            labelText: 'Nombre',
            controller: nombreController,
            validatorType: ValidatorType.none,
          ),
          CustomInputField(
            labelText: 'Apellido',
            controller: apellidoController,
            validatorType: ValidatorType.none,
          ),
          CustomInputField(
            labelText: 'Teléfono',
            controller: telefonoController,
            keyboardType: TextInputType.phone,
            validatorType: ValidatorType.none,
          ),
          CustomInputField(
            labelText: 'Correo Electrónico',
            controller: correoController,
            keyboardType: TextInputType.emailAddress,
            validatorType: ValidatorType.none,
          ),
          CustomInputField(
            labelText: 'Edad',
            controller: edadController,
            keyboardType: TextInputType.number,
            validatorType: ValidatorType.none,
          ),
          DateRangeInputs(
            titleInitDate: 'Fecha de Nacimiento',
            initDatecontroller: filterFormDate.initDateController,
            onTapInitDate: filterFormDate.selectInitialDate,
          ),
          //  const CustomInputField(
          //   labelText: 'Fecha de nacimiento',
          //   controller: SelectDate(),
          //   keyboardType: TextInputType.datetime,
          //   validatorType: ValidatorType.none,
          // ),
          CustomInputField(
            labelText: 'Género',
            controller: generoController,
            validatorType: ValidatorType.none,
          ),
          CustomInputField(
            labelText: 'Dirección de Residencia',
            controller: direccionController,
            validatorType: ValidatorType.none,
          ),
          CustomInputField(
            labelText: 'Ocupación',
            controller: ocupacionController,
            validatorType: ValidatorType.none,
          ),
          DateRangeInputs(
            titleInitDate: 'Fecha de ultima visita',
            initDatecontroller: filterFormDate.initDateController,
            onTapInitDate: filterFormDate.selectInitialDate,
          ),
          /* CustomInputField(
            labelText: 'Fecha de primera visita',
            controller: fechaPrimeraVisitaController,
            keyboardType: TextInputType.datetime,
            validatorType: ValidatorType.none,
          ), */
          CustomInputField(
            labelText: 'Motivo de consulta',
            controller: motivoConsultaController,
            validatorType: ValidatorType.none,
          ),
        ],
      ),
    );
  }
}
