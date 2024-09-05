import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_graduacion/festure/patients/bloc/patients_bloc.dart';
import 'package:proyecto_graduacion/widgets/utils/text/custom_input_field.dart';

class FormPatientsCreate extends StatelessWidget {
  const FormPatientsCreate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PatientsBloc>();

    return Form(
      key: bloc.formKey,
      child: const Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        children: <Widget>[
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Nombre',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Apellido',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Teléfono',
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Correo Electrónico',
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Edad',
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Fecha de nacimiento',
              keyboardType: TextInputType.datetime,
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Género',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Dirección de Residencia',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Ocupación',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Fecha de primera visita',
              keyboardType: TextInputType.datetime,
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Motivo de consulta',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Antecedentes médicos',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Medicamentos recetados',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Alergias',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Enfermedades crónicas',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Hábitos alimenticios',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Hábitos de sueño',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Hábitos de ejercicio',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Hábitos de consumo de alcohol',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Hábitos de consumo de tabaco',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Hábitos de consumo de drogas',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Hábitos de consumo de cafeína',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Hábitos de consumo de azúcar',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Hábitos de consumo de sal',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Hábitos de consumo de grasas',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Hábitos de consumo de carbohidratos',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Hábitos de consumo de proteínas',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Hábitos de consumo de fibra',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Estado',
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Fecha de última visita',
              keyboardType: TextInputType.datetime,
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Próxima cita',
              keyboardType: TextInputType.datetime,
            ),
          ),
          SizedBox(
            width: 800,
            child: CustomInputField(
              labelText: 'Observaciones',
              maxLines: 3,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
