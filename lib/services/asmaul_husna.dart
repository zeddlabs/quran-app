import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/models/asmaul_husna.dart';

class AsmaulHusnaService {
  static Future<List<AsmaulHusna>> getAsmaulHusna() async {
    const url = 'https://asmaul-husna-api.vercel.app/api/all';
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);

    List<AsmaulHusna> result = jsonData['data']
        .map<AsmaulHusna>((item) => AsmaulHusna.fromJson(item))
        .toList();

    return result;
  }
}
