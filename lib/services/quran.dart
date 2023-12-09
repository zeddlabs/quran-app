import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/models/imam.dart';
import 'package:quran_app/models/surah.dart';

class QuranService {
  static Future<List<Surah>> getSurahs() async {
    const url = 'https://quran-endpoint.vercel.app/quran';
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);

    List<Surah> result =
        jsonData['data'].map<Surah>((item) => Surah.fromJson(item)).toList();

    return result;
  }

  static Future<Surah> getSurah(int surahNumber, int imamId) async {
    final url =
        'https://quran-endpoint.vercel.app/quran/$surahNumber?imamId=$imamId';
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);

    Surah result = Surah.fromJson(jsonData['data']);

    return result;
  }

  static Future<List<Imam>> getImams() async {
    const url = 'https://quran-endpoint.vercel.app/imam';
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);

    List<Imam> result =
        jsonData['data'].map<Imam>((item) => Imam.fromJson(item)).toList();

    return result;
  }
}
