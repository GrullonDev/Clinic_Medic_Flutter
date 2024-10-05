import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_graduacion/festure/profile/bloc/profile_bloc.dart';
import 'package:proyecto_graduacion/festure/widgets/profile_text_field.dart';
import 'package:proyecto_graduacion/widgets/utils/appbar.dart';
import 'package:proyecto_graduacion/widgets/utils/drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Perfil',
        onTap: () {
          if (profileBloc.validarFormulario()) {
            profileBloc.guardarPerfil();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Perfil actualizado'),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error en los datos del perfil'),
              ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 80,
                        child: Icon(Icons.person, size: 100),
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
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Nombre',
                  initialValue: profileBloc.nombre,
                  onChanged: (value) => profileBloc.setNombre(value),
                ),
                TextFieldWidget(
                  label: 'Especialidad',
                  initialValue: profileBloc.especialidad,
                  onChanged: (value) => profileBloc.setEspecialidad(value),
                ),
                TextFieldWidget(
                  label: 'Email',
                  initialValue: profileBloc.email,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => profileBloc.setEmail(value),
                ),
                TextFieldWidget(
                  label: 'Teléfono',
                  initialValue: profileBloc.telefono,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => profileBloc.setTelefono(value),
                ),
                TextFieldWidget(
                  label: 'Número de Licencia',
                  initialValue: profileBloc.licencia,
                  onChanged: (value) => profileBloc.setLicencia(value),
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
}
