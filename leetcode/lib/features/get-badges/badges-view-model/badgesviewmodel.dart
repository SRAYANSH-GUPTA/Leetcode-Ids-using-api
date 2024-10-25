import 'package:http/http.dart' as http;
import 'dart:convert';
import '../badges-model/badges.dart';
import '../../../globals.dart' as globals;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Badge> fetchBadgeData() async {

  final url = Uri.parse(dotenv.env['URL']! + (globals.urls) +'/badges');
  final response = await http.get(url, headers: {'api-key': 'postmanrulz'});

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return Badge.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load badge data: ${response.statusCode}');
  }
}

void main() async {
  await dotenv.load();

  try {
    Badge badgeData = await fetchBadgeData();
    print('Badges Count: ${badgeData.badgesCount}');
  } catch (e) {
    print('Error: HEllo');
  }
}
