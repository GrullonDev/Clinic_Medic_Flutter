import 'package:proyecto_graduacion/widgets/utils/base_model.dart';

class ProfileBloc extends BaseModel {
  String _nombre = 'Dr. Juan Pérez';
  String _especialidad = 'Cardiología';
  String _email = 'juan.perez@clinica.com';
  String _telefono = '+502 5690 6791';
  String _licencia = 'MED-12345';

  String get nombre => _nombre;
  String get especialidad => _especialidad;
  String get email => _email;
  String get telefono => _telefono;
  String get licencia => _licencia;

  void setNombre(String value) {
    _nombre = value;
    notifyListeners();
  }

  void setEspecialidad(String value) {
    _especialidad = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setTelefono(String value) {
    _telefono = value;
    notifyListeners();
  }

  void setLicencia(String value) {
    _licencia = value;
    notifyListeners();
  }

  void guardarPerfil() {
    notifyListeners();
  }

  bool validarFormulario() {
    if (_nombre.isEmpty ||
        _especialidad.isEmpty ||
        _email.isEmpty ||
        _telefono.isEmpty ||
        _licencia.isEmpty) return false;

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

    if (!emailRegex.hasMatch(_email)) return false;

    return true;
  }
}
