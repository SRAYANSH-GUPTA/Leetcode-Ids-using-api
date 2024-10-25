import 'dart:convert';
import 'package:http/http.dart' as http;
import '../contestmodel/contestmodel.dart';
import '../../get-profile/view/profile_page.dart';
import '../../../globals.dart' as globals;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Contest?> fetchContest() async {
  // Check if the URL is null
  final baseUrl = dotenv.env['URL'];
  if (baseUrl == null) {
    print('URL not set in .env file');
    return null; // Or throw an exception
  }

  // Create the full URL
  final url = Uri.parse(baseUrl + globals.urls + '/contest');
  final response = await http.get(url, headers: {
    'api-key': 'postmanrulz',
  });

  if (response.statusCode == 200) {
    return Contest.fromJson(json.decode(response.body));
  } else {
    print('Request failed with status: ${response.statusCode}');
    return null;
  }
}
