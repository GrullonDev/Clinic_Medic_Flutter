import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_graduacion/widgets/routes/app_routes.dart';
import 'package:proyecto_graduacion/widgets/utils/appbar.dart';
import 'package:proyecto_graduacion/widgets/utils/drawer.dart';
import 'package:proyecto_graduacion/widgets/utils/back_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String _nombre = 'Dr. Juan Pérez';
  String _especialidad = 'Cardiología';
  String _email = 'juan.perez@clinica.com';
  String _telefono = '+502 5690 6791';
  String _licencia = 'MED-12345';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBack: AppBackButton(
          onPressed: () => context.go(AppRoutes.home),
        ),
        title: 'Perfil',
        onTap: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            // Aquí iría la lógica para guardar los cambios
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Perfil actualizado')),
            );
          }
        },
        icon: Icons.save_alt_outlined,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            AssetImage('assets/doctor_placeholder.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt,
                                color: Colors.white),
                            onPressed: () {
                              // Lógica para cambiar la foto de perfil
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _buildTextField(
                  label: 'Nombre',
                  initialValue: _nombre,
                  onSaved: (value) => _nombre = value!,
                ),
                _buildTextField(
                  label: 'Especialidad',
                  initialValue: _especialidad,
                  onSaved: (value) => _especialidad = value!,
                ),
                _buildTextField(
                  label: 'Email',
                  initialValue: _email,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) => _email = value!,
                ),
                _buildTextField(
                  label: 'Teléfono',
                  initialValue: _telefono,
                  keyboardType: TextInputType.phone,
                  onSaved: (value) => _telefono = value!,
                ),
                _buildTextField(
                  label: 'Número de Licencia',
                  initialValue: _licencia,
                  onSaved: (value) => _licencia = value!,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Navegar a la pantalla de cambio de contraseña
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Cambiar Contraseña'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String initialValue,
    required Function(String?) onSaved,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        initialValue: initialValue,
        keyboardType: keyboardType,
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingrese $label';
          }
          return null;
        },
      ),
    );
  }
}
