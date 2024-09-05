import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_graduacion/festure/patients/bloc/patients_bloc.dart';
import 'package:proyecto_graduacion/widgets/routes/app_routes.dart';
import 'package:proyecto_graduacion/widgets/utils/appbar.dart';
import 'package:proyecto_graduacion/widgets/utils/base_model_scaffold.dart';
import 'package:proyecto_graduacion/widgets/utils/buttons/text_button.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PatientsBloc>();

    return BaseModelScaffold(
      model: PatientsBloc(),
      builder: (context, value) => Scaffold(
        appBar: CustomAppBar(
          title: 'Lista de Pacientes',
          onBack: AppTextButton(
            title: 'REGRESAR',
            onTap: () => context.go(AppRoutes.home),
          ),
          icon: Icons.refresh,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Actualizando lista de pacientes...')),
            );
          },
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Buscar pacientes',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: bloc.filterPatients,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  sortColumnIndex: bloc.sortColumnIndex,
                  sortAscending: bloc.sortAscending,
                  columns: [
                    DataColumn(
                      label: const Text('Nombre'),
                      onSort: (columnIndex, ascending) =>
                          bloc.sort((p) => p.name, columnIndex, ascending),
                    ),
                    DataColumn(
                      label: const Text('Edad'),
                      numeric: true,
                      onSort: (columnIndex, ascending) =>
                          bloc.sort((p) => p.age, columnIndex, ascending),
                    ),
                    DataColumn(
                      label: const Text('Última Visita'),
                      onSort: (columnIndex, ascending) =>
                          bloc.sort((p) => p.lastVisit, columnIndex, ascending),
                    ),
                    DataColumn(
                      label: const Text('Estado'),
                      onSort: (columnIndex, ascending) =>
                          bloc.sort((p) => p.status, columnIndex, ascending),
                    ),
                    const DataColumn(
                      label: Text('Acciones'),
                    ),
                  ],
                  rows: bloc.pacientesFiltrados
                      .map((paciente) => DataRow(
                            cells: [
                              DataCell(Text(paciente.name)),
                              DataCell(Text(paciente.age.toString())),
                              DataCell(Text(paciente.lastVisit)),
                              DataCell(Text(paciente.status)),
                              DataCell(Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.visibility),
                                    onPressed: () {
                                      // Ver detalles del paciente
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      // Editar paciente
                                    },
                                  ),
                                ],
                              )),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => context.go(AppRoutes.patientsCreate),
        ),
      ),
    );
  }
}
