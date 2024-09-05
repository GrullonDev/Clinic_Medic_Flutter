class Patient {
  final String id;
  final String name;
  final int age;
  final String lastVisit;
  final String status;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.lastVisit,
    required this.status,
  });

  List<dynamic> get contentForTable {
    return [
      name,
      age,
      lastVisit,
      status,
    ];
  }
}
