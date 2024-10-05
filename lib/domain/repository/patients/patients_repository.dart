import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_graduacion/domain/entities/patients/patients_entity.dart';

abstract class PatientsRepository {
  Future<List<Patient>> getPatients();
  Future<void> addPatient(Patient patient);
  Future<void> updatePatient(Patient patient);
  Future<void> deletePatient(Patient patient);
}

class PatientsRepositoryImpl implements PatientsRepository {
  PatientsRepositoryImpl({
    required this.firestore,
  });

  final FirebaseFirestore firestore;

  @override
  Future<List<Patient>> getPatients() async {
    final snapshot = await firestore.collection('patients').get();
    return snapshot.docs
        .map(
          (doc) => Patient(
            id: doc.id,
            name: doc['name'],
            lastName: doc['lastName'],
            age: doc['age'],
            birthDate: doc['birthDate'].toDate(),
            address: doc['address'],
            lastVisit: doc['lastVisit'].toDate(),
            status: doc['status'],
          ),
        )
        .toList();
  }

  @override
  Future<void> addPatient(Patient patient) async {
    await firestore.collection('patients').add(
      {
        'name': patient.name,
        'lastName': patient.lastName,
        'age': patient.age,
        'birthDate': patient.birthDate,
        'address': patient.address,
        'lastVisit': patient.lastVisit,
        'status': patient.status,
      },
    );
  }

  @override
  Future<void> updatePatient(Patient patient) async {
    await firestore.collection('patients').doc(patient.id).update(
      {
        'name': patient.name,
        'lastName': patient.lastName,
        'age': patient.age,
        'birthDate': patient.birthDate,
        'address': patient.address,
        'lastVisit': patient.lastVisit,
        'status': patient.status,
      },
    );
  }

  @override
  Future<void> deletePatient(Patient patient) async {
    await firestore.collection('patients').doc(patient.id).delete();
  }
}
