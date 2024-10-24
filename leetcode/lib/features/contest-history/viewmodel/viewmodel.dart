import 'dart:convert';
import 'package:http/http.dart' as http;
import '../history-model.dart/history.dart'; // Ensure the correct path
import '../../../globals.dart' as globals;
Future<History?> fetchHistory() async {
  final url = 'https://alfa-leetcode-api.onrender.com/${globals.urls}/contest/history';

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
