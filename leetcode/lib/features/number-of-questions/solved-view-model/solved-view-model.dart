import 'package:http/http.dart' as http;
import 'dart:convert';
import '../questions-model.dart/questions-model.dart'; // Ensure this path is correct

void main() async {
  final url = Uri.parse('https://alfa-leetcode-api.onrender.com/neal_wu/solved');
  final response = await http.get(
    url,
    headers: {
      'api-key': 'postmanrulz',
    },
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    Solved solved = Solved.fromJson(jsonResponse); // Use 'Solved' instead of 'solved'
    print('Count: ${solved.count}');
    if (solved.submission != null) {
      for (var submission in solved.submission!) {
        print('Title: ${submission.title}, Status: ${submission.statusDisplay}');
      }
    }
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}
