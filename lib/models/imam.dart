class Imam {
  int id;
  String name;

  Imam({
    required this.id,
    required this.name,
  });

  factory Imam.fromJson(Map<String, dynamic> json) {
    return Imam(
      id: json['id'],
      name: json['name'],
    );
  }
}
