import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_graduacion/domain/repository/patients/patients_repository.dart';
import 'package:proyecto_graduacion/festure/dashboard/bloc/dashboard_bloc.dart';
import 'package:proyecto_graduacion/festure/login/bloc/login_bloc.dart';
import 'package:proyecto_graduacion/festure/patients/bloc/patients_bloc.dart';
import 'package:proyecto_graduacion/festure/profile/bloc/profile_bloc.dart';
import 'package:proyecto_graduacion/festure/register/bloc/register_bloc.dart';
import 'package:proyecto_graduacion/injection_container.dart';
import 'package:proyecto_graduacion/widgets/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginBloc(
            context: context,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => RegisterBloc(context: context),
        ),
        ChangeNotifierProvider(
          create: (_) => DashboardViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PatientsBloc(
            context: context,
            patientsRepository: sl.get<PatientsRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Medical Clinic',
        color: Colors.lightBlue,
        routerConfig: AppRoutes.createRouter(),
      ),
    );
  }
}
