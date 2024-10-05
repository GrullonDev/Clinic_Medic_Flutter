import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:proyecto_graduacion/widgets/app.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

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
