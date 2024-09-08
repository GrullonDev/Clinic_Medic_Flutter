import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/domain/entities/patients/patients_entity.dart';
import 'package:proyecto_graduacion/widgets/utils/base_model.dart';

class PatientsBloc extends BaseModel {
  final formKey = GlobalKey<FormState>();

  final List<Patient> _pacientes = [
    Patient(
        id: '1',
        name: 'Ana García',
        age: 35,
        birthDate: '1988-05-15',
        lastVisit: '2023-05-15',
        address: 'Calle 1, Ciudad 1',
        status: 'Activo'),
    Patient(
        id: '2',
        name: 'Carlos López',
        age: 42,
        birthDate: '1988-05-15',
        lastVisit: '2023-05-15',
        address: 'Calle 1, Ciudad 1',
        status: 'En tratamiento'),
    Patient(
        id: '3',
        name: 'María Rodríguez',
        age: 28,
        birthDate: '1988-05-15',
        lastVisit: '2023-05-15',
        address: 'Calle 1, Ciudad 1',
        status: 'Nuevo'),
    Patient(
        id: '4',
        name: 'José Martínez',
        age: 55,
        birthDate: '1988-05-15',
        lastVisit: '2023-05-15',
        address: 'Calle 1, Ciudad 1',
        status: 'Seguimiento'),
    Patient(
        id: '5',
        name: 'Laura Sánchez',
        age: 31,
        birthDate: '1988-05-15',
        lastVisit: '2023-05-15',
        address: 'Calle 1, Ciudad 1',
        status: 'Activo'),
  ];

  List<Patient> _pacientesFiltrados = [];
  String _searchQuery = '';
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  PatientsBloc() {
    _pacientesFiltrados = List.from(_pacientes);
  }

  List<Patient> get pacientesFiltrados => _pacientesFiltrados;
  int get sortColumnIndex => _sortColumnIndex;
  bool get sortAscending => _sortAscending;

  void filterPatients(String query) {
    _searchQuery = query;
    _pacientesFiltrados = _pacientes
        .where((paciente) =>
            paciente.name.toLowerCase().contains(query.toLowerCase()) ||
            paciente.status.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Patient p) getField, int columnIndex,
      bool ascending) {
    _pacientesFiltrados.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    _sortColumnIndex = columnIndex;
    _sortAscending = ascending;
    notifyListeners();
  }

  void savePatientNew() {
    if (formKey.currentState!.validate()) {
      // Guardar paciente

      notifyListeners();
    }
  }
}
