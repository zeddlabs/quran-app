class AsmaulHusna {
  int order;
  String latin;
  String arabic;
  String translation;

  AsmaulHusna({
    required this.order,
    required this.latin,
    required this.arabic,
    required this.translation,
  });

  factory AsmaulHusna.fromJson(Map<String, dynamic> json) {
    return AsmaulHusna(
      order: json['urutan'],
      latin: json['latin'],
      arabic: json['arab'],
      translation: json['arti'],
    );
  }
}
