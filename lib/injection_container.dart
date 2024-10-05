import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_graduacion/domain/repository/patients/patients_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register Firestore instance
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Register FirestoreRepository
  sl.registerLazySingleton<PatientsRepository>(
    () => PatientsRepositoryImpl(firestore: sl()),
  );
}
