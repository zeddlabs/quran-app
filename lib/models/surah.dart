class Surah {
  int surahNumber;
  String surahName;
  String type;
  int ayahCount;
  String arabicName;
  String translation;
  List<Ayah>? ayahs;

  Surah({
    required this.surahNumber,
    required this.surahName,
    required this.type,
    required this.ayahCount,
    required this.arabicName,
    required this.translation,
    this.ayahs,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      surahNumber: json['number'],
      surahName: json['asma']['id']['short'],
      type: json['type']['id'],
      ayahCount: json['ayahCount'],
      arabicName: json['asma']['ar']['short'],
      translation: json['asma']['translation']['id'],
      ayahs: json['ayahs']?.map<Ayah>((ayah) => Ayah.fromJson(ayah)).toList(),
    );
  }
}

class Ayah {
  int ayahNumber;
  String text;
  String read;
  String translation;

  Ayah({
    required this.ayahNumber,
    required this.text,
    required this.read,
    required this.translation,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      ayahNumber: json['number']['insurah'],
      text: json['text']['ar'],
      read: json['text']['read'],
      translation: json['translation']['id'],
    );
  }
}
