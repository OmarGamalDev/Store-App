import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = 'https://fakestoreapi.com/';

  Future<dynamic> get({required String endPoint}) async {
    http.Response response = await http.get(Uri.parse(baseUrl + endPoint));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load products ${response.statusCode}');
    }
  }
}
