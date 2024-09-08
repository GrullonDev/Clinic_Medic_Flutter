import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:proyecto_graduacion/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Determinar el entorno y cargar el archivo .env correspondiente
  // const bool isProduction = bool.fromEnvironment('dart.vm.product');
  // await dotenv.load(fileName: isProduction ? ".env.prod" : ".env.dev");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MyApp(),
  );
}
