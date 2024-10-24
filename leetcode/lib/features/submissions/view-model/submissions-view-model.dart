
import 'package:http/http.dart' as http;
import '../submissions-model/submissions-model.dart';
import 'dart:convert';

Future<Submissions?> fetchSubmissions() async {
  var url = Uri.parse('https://alfa-leetcode-api.onrender.com/neal_wu/submission');
  var response = await http.get(
    url,
    headers: {
      'api-key': 'postmanrulz',
    },
  );
  print(response);
  if (response.statusCode == 200) {
    // Decode the response body as JSON
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);
    // Map the JSON response to the submissions model
    return Submissions.fromJson(jsonResponse);
  } else {
    print('Request failed with status: ${response.statusCode}');
    return null;
  }
}

void main() async {
  Submissions? data = await fetchSubmissions();
  print(data);

  if (data != null) {
    print('Total count: ${data.count}');
    for (var submission in data.submissions!) {
      print('Title: ${submission.title}, Lang: ${submission.lang}');
    }
  }
}