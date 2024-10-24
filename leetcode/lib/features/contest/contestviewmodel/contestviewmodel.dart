import 'dart:convert';
import 'package:http/http.dart' as http;
import '../contestmodel/contestmodel.dart';

Future<Contest?> fetchContest() async {
  final url = Uri.parse('https://alfa-leetcode-api.onrender.com/neal_wu/contest');
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
