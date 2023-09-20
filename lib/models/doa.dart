class Doa {
  String id;
  String name;
  String verse;
  String latin;
  String translation;

  Doa({
    required this.id,
    required this.name,
    required this.verse,
    required this.latin,
    required this.translation,
  });

  factory Doa.fromJson(Map<String, dynamic> json) {
    return Doa(
      id: json['id'],
      name: json['doa'],
      verse: json['ayat'],
      latin: json['latin'],
      translation: json['artinya'],
    );
  }
}
