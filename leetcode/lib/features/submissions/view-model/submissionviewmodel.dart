import 'dart:convert';
import 'package:http/http.dart' as http;
import '../submissions-model/submissionsmodel.dart';
import '../../../globals.dart' as globals;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Sub> fetchSubmissionData() async {
  final url = Uri.parse(dotenv.env['URL']! + (globals.urls) +'/submission');
  final response = await http.get(url, headers: {
    'api-key': 'postmanrulz',
  });

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return Sub.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load submission data: ${response.statusCode}');
  }
}

void main() async {
  try {
    Sub submissionData = await fetchSubmissionData();
    print('Count: ${submissionData.count}');
    if (submissionData.submission != null) {
      for (var submission in submissionData.submission!) {
        print('Title: ${submission.title}, Status: ${submission.statusDisplay}');
      }
    }
  } catch (e) {
    print('Error: $e');
  }
}