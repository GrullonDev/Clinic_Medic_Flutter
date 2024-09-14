import 'package:cloud_firestore/cloud_firestore.dart';

class Patient {
  final String id;
  final String name;
  final int age;
  final String birthDate;
  final String address;
  final String lastVisit;
  final String status;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.birthDate,
    required this.address,
    required this.lastVisit,
    required this.status,
  });

  // Método para convertir un Patient a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'birthDate': birthDate,
      'address': address,
      'lastVisit': lastVisit,
      'status': status,
    };
  }

  // Método para crear un Patient desde un Map
  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      birthDate: map['birthDate'] ?? '',
      address: map['address'] ?? '',
      lastVisit: map['lastVisit'] ?? '',
      status: map['status'] ?? '',
    );
  }

  // Método para guardar el paciente en Firestore
  Future<void> saveToFirestore() async {
    final firestore = FirebaseFirestore.instance;
    await firestore.collection('patients').doc(id).set(toMap());
  }

  List<dynamic> get contentForTable {
    return [
      name,
      age,
      lastVisit,
      status,
    ];
  }
}
