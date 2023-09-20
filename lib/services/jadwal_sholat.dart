import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/models/city.dart';
import 'package:quran_app/models/jadwal_sholat.dart';

class JadwalSholatService {
  static Future<List<City>> getCities() async {
    const url = 'https://api.myquran.com/v1/sholat/kota/semua';
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);

    List<City> result =
        jsonData.map<City>((item) => City.fromJson(item)).toList();

    return result;
  }

  static Future<JadwalSholat> getJadwalSholat(
    String cityId,
    int year,
    int month,
    int day,
  ) async {
    final url =
        'https://api.myquran.com/v1/sholat/jadwal/$cityId/$year/$month/$day';
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);

    JadwalSholat result = JadwalSholat.fromJson(jsonData['data']['jadwal']);

    return result;
  }
}
