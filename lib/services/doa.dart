import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/models/doa.dart';

class DoaService {
  static Future<List<Doa>> getDoa() async {
    const url = 'https://doa-doa-api-ahmadramadhan.fly.dev/api';
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);

    List<Doa> result = jsonData.map<Doa>((item) => Doa.fromJson(item)).toList();

    return result;
  }
}
