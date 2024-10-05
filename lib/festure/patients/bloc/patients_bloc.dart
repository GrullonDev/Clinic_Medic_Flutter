import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/domain/entities/patients/patients_entity.dart';
import 'package:proyecto_graduacion/domain/repository/patients/patients_repository.dart';
import 'package:proyecto_graduacion/widgets/utils/base_model.dart';
import 'package:proyecto_graduacion/widgets/utils/date/date_filter_form.dart';
import 'package:proyecto_graduacion/widgets/utils/message_display.dart';

class PatientsBloc extends BaseModel {
  PatientsBloc({
    required PatientsRepository patientsRepository,
    required BuildContext context,
  })  : _context = context,
        _patientsRepository = patientsRepository {
    _pacientesFiltrados = List.from(_pacientes);
    filterFormDate = DateFilterForm(
      context: context,
      initialFirstDate: DateTime.now(),
      initialLastDate: DateTime(
        DateTime.now().year + 1,
        DateTime.now().month,
        DateTime.now().day,
      ),
      finalLastDate: DateTime(
        DateTime.now().year + 1,
        DateTime.now().month,
        DateTime.now().day + 30,
      ),
      onUpdate: () {},
    );
  }

  final PatientsRepository _patientsRepository;
  final BuildContext _context;
  final formKey = GlobalKey<FormState>();

  late DateFilterForm filterFormDate;
  Patient? patient;

  List<Patient> _pacientes =
      []; // Inicialmente vacío ya que se llenará desde Firestore
  List<Patient> _pacientesFiltrados = [];
  String _searchQuery = '';
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  List<Patient> get pacientesFiltrados => _pacientesFiltrados;
  int get sortColumnIndex => _sortColumnIndex;
  bool get sortAscending => _sortAscending;

  /// Función para cargar los pacientes desde Firestore
  Future<void> loadPatients() async {
    try {
      _pacientes = await _patientsRepository
          .getPatients(); // Obtener los pacientes del repo
      _pacientesFiltrados =
          List.from(_pacientes); // Inicializar la lista filtrada
      notifyListeners(); // Notificar que los datos han sido cargados
    } catch (e) {
      MessageDisplay.failure(_context, 'Error al cargar pacientes');
    }
  }

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

  Future<void> savePatientNew(Patient patient) async {
    if (formKey.currentState!.validate()) {
      try {
        await _patientsRepository
            .addPatient(patient); // Guardar paciente en Firestore
        _pacientes.add(patient); // Agregar a la lista local
        _pacientesFiltrados =
            List.from(_pacientes); // Actualizar la lista filtrada
        MessageDisplay.success(_context, 'Paciente guardado');
        notifyListeners();
      } catch (e) {
        MessageDisplay.failure(_context, 'Error al guardar paciente');
      }
    } else {
      MessageDisplay.failure(_context, 'Formulario no válido');
    }
  }
}
