import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = 'https://fakestoreapi.com/';

  Future<dynamic> get({
    required String endPoint,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(
      Uri.parse(baseUrl + endPoint),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load products ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String endPoint,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    http.Response response = await http.post(
      Uri.parse(baseUrl + endPoint),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'Failed to post data ${response.statusCode} with body: ${response.body}',
      );
    }
  }

  Future<dynamic> put({
    required String endPoint,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    http.Response response = await http.put(
      Uri.parse(baseUrl + endPoint),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'Failed to put data ${response.statusCode} with body: ${response.body}',
      );
    }
  }
}
