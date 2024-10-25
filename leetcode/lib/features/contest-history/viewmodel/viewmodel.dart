import 'dart:convert';
import 'package:http/http.dart' as http;
import '../history-model.dart/history.dart'; // Ensure the correct path
import '../../../globals.dart' as globals;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<History?> fetchHistory() async {
  // Retrieve the base URL and check if it's null
  final baseUrl = dotenv.env['URL'];
  if (baseUrl == null) {
    throw Exception('URL not set in .env file');
  }

  final url = '$baseUrl${globals.urls}/contest/history'; // Use string interpolation

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return History.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
