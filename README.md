# Administración de Clinica Medica

## Descripción

Este proyecto es un sistema de gestión clinica desarrollado utilizando Flutter, que permite
la administración eficiente de una clinica medica, facilitando la gestión de pacientes, citas,
inventario de insumos medicos y más. El sistema está diseñado para ser multiplataforma,
funcionando tanto en dispositivos moviles como web.

### Características Príncipales

- Gestión de Pacientes: Permite registrar, actualizar, y visualizar la información de los pacientes, incluyendo su historial médico.
- Gestión de Citas: Los usuarios pueden agendar, modificar, y cancelar citas médicas de manera sencilla.
- Inventario de Insumos Médicos: Administración eficiente de insumos médicos, con notificaciones de reabastecimiento.
- Roles de Usuario: Gestión de roles y permisos para asegurar que cada usuario tenga acceso a la información que necesita.
- Notificaciones: Envío de recordatorios automáticos para citas, y alertas sobre el inventario.
- Interfaz de Usuario Intuitiva: Diseño moderno y accesible, adaptado para dispositivos móviles y web.

### Tecnoligías Utilizadas

- Flutter: Framework principal para el desarrollo de la aplicación.
- Dart: Lenguaje de programación utilizado en Flutter.
- Firebase: Utilizado para autenticación, base de datos en tiempo real y almacenamiento.
- SQLite: Base de datos local para almacenamiento offline.
- Provider: Gestión del estado de la aplicación.
- RESTful API: Integración con servicios externos para funcionalidades adicionales.

## Requisitos Previos

- Flutter SDK: Instalar Flutter
- Dart SDK: Incluido en la instalación de Flutter.
- Editor de Código: Se recomienda Visual Studio Code con la extensión de Flutter instalada.
- Firebase CLI: Para la configuración de Firebase en la aplicación.

## Instalación y Configuración

### 1. Clonar Repositorio

```
git clone https://github.com/GrullonDev/Clinic_Medic_Flutter.git
cd proyecto
```

### 2. Instalar la versión de Flutter Especifica

Asegurate de que FVM este instalado y configura la versión de Flutter especificada en el proyecto.

```
fvm install
```

```
fvm use 3.24.1
```

### 3. Instalar Dependencias

```
flutter packages get
```

### 4. Configuración de Firebase

- Sigue las instrucciones en la [documentación oficial de Firebase](https://firebase.flutter.dev/docs/overview/) para configurar Firebase en tu proyecto Flutter.

* Asegúrate de añadir los archivos google-services.json (Android) y GoogleService-Info.plist (IOS) en los directorios correspondientes.

### 5. Ejecución del Proyecto

- Para la web

```
fvm flutter run -d chrome
```

## Estructura del Proyecto

```
lib/
│
├── models/ # Modelos de datos
├── screens/ # Pantallas principales de la aplicación
├── widgets/ # Widgets reutilizables
├── providers/ # Gestión de estado con Provider
├── services/ # Servicios de integración con API y Firebase
├── utils/ # Utilidades y funciones auxiliares
└── main.dart # Archivo principal de la aplicación
```

## Flujo de Trabajo

1. Desarrollo
   - Asegurate de que todas las nuevas caracteristicas y correcciones de errores se desarrollen en ramas separadas. Usa git flow para gestionar las ramas.
   - Crea un pull request y solicita revisiones de código antes de fusionar las ramas.
2. Pruebas
   - Ejecuta pruebas unitarias utilizando:
   - Asegúrate de que todas las funcionalidades críticas estén cubiertas por pruebas automatizadas

```
fvm flutter test
```

3. Despliegue

- Utiliza Firebase Hosting para despliegue web u otra herramienta para realizar un despliegue
- Asegúrate de configurar las variables de entorno adecuadas para cada entorno (producción y desarrollo)

## Contribución

- Fork este repositorio
- Crea una nueva rama para tu característica o correción de errores (`git checkout -b feature/mi-nueva-funcionalidad`)
- Commit tus cambios (`git commit -m "Comentario de la funcionalidad a agregar"`)
- Push a la rama (`git push origin feature/mi-nueva-funcionalidad`)
- Crea un Pull Request

# Licencia

Este proyecto está bajo la Licencia @MIT. Consulta el archivo LICENSE para más detalles.

# Contacto

Para cualquier consulta o sugerencia, puedes contactarme en:

- Correo Electrónico: prosystem155@gmail.com
- LinkedIn: Jorge Grullón
- Github: [GrullonDev](https://github.com/GrullonDev)
