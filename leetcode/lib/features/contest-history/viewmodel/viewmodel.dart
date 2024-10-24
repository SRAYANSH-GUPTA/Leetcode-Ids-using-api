
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../history-model.dart/history.dart';

late history historyData;
void main() async {
  const url = 'https://alfa-leetcode-api.onrender.com/neal_wu/contest/history';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Parse the JSON response
      historyData = history.fromJson(jsonDecode(response.body));
      print('Count: ${historyData.count}');
      print('Contest History: ${historyData.contestHistory}');
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}