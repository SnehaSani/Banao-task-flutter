import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteService {

  static Future<List?> fetchData(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map;
      final Data = jsonData['items'] as List;
      return Data;
    }
    else {
      return null;
    }
  }
}