import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/festure/patients/pages/patients_page.dart';
import 'package:proyecto_graduacion/festure/patients/widgets/patients_create.dart';
import 'package:proyecto_graduacion/festure/profile/pages/profile_page.dart';
import 'package:proyecto_graduacion/home.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String home = '/';
  static const String profile = '/profile';
  static const String patients = '/patients';
  static const String patientsCreate = '/patientsCreate';
  static const String setting = '/setting';

  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: home,
      routes: <RouteBase>[
        GoRoute(
          path: home,
          builder: (context, state) => const Home(),
        ),
        GoRoute(
          path: profile,
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: patients,
          builder: (context, state) => const PatientsPage(),
        ),
        GoRoute(
          path: patientsCreate,
          builder: (context, state) => const PatientsCreate(),
        ),
      ],
      redirect: (context, state) {
        final path = state.uri.path;
        if (path == '/') return home;
        return null;
      },
      errorPageBuilder: (context, state) => MaterialPage(
        child: Scaffold(
          body: Center(
            child: Text('Página no encontrada: ${state.uri.path}'),
          ),
        ),
      ),
    );
  }
}
