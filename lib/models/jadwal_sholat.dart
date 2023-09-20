class JadwalSholat {
  String date;
  String subuh;
  String dzuhur;
  String ashar;
  String maghrib;
  String isya;

  JadwalSholat({
    required this.date,
    required this.subuh,
    required this.dzuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
  });

  factory JadwalSholat.fromJson(Map<String, dynamic> json) {
    return JadwalSholat(
      date: json['tanggal'],
      subuh: json['subuh'],
      dzuhur: json['dzuhur'],
      ashar: json['ashar'],
      maghrib: json['maghrib'],
      isya: json['isya'],
    );
  }
}
