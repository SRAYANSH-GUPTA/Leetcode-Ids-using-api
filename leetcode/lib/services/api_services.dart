// lib/services/api_services.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../features/get-profile/model/model.dart';

class ApiService {
  final String _baseUrl = 'https://alfa-leetcode-api.onrender.com/neal_wu';
  final String _apiKey = 'postmanrulz';

  Future<Profile> fetchProfile() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {'api-key': _apiKey},
    );

    if (response.statusCode == 200) {
      return Profile.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
