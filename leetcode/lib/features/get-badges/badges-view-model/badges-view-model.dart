import 'package:http/http.dart' as http;
import 'dart:convert';
import '../badges-model/badges.dart';
late badge badgeData;

Future<badge> fetchBadgeData() async {
  final url = Uri.parse('https://alfa-leetcode-api.onrender.com/neal_wu/badges');
  final response = await http.get(url, headers: {'api-key': 'postmanrulz'});

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return badge.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load badge data');
  }
}

void main() async {
  try {
    badgeData = await fetchBadgeData();
    print('Badges Count: ${badgeData.badgesCount}');
    print("hello badgedata here");
    // Additional print statements can be added here to display more data.
  } catch (e) {
    print(e);
  }
}