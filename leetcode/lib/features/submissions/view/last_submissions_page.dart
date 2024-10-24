import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../submissions-model/submissions-model.dart';
import 'dart:convert';

class LastSubmissionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Last Submissions')),
      body: FutureBuilder<Submissions?>(
        future: fetchSubmissions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            if (data == null || data.submissions == null || data.submissions!.isEmpty) {
              return Center(child: Text('No submissions found.'));
            }
            return ListView.builder(
              itemCount: data.submissions!.length,
              itemBuilder: (context, index) {
                final submission = data.submissions![index];
                return ListTile(
                  title: Text('${submission.title}'),
                  subtitle: Text('Lang: ${submission.lang}'),
                );
              },
            );
          } else {
            return Center(child: Text('No submissions found.'));
          }
        },
      ),
    );
  }

  Future<Submissions?> fetchSubmissions() async {
    var url = Uri.parse('https://alfa-leetcode-api.onrender.com/neal_wu/submission');
  
    var response = await http.get(
      url,
      headers: {
        'api-key': 'postmanrulz',
      },
    );
    
    if (response.statusCode == 200) {
      // Decode the response body as JSON
      var jsonResponse = json.decode(response.body);
      
      // Map the JSON response to the submissions model
      return Submissions.fromJson(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  }
}

void main() {
  runApp(MaterialApp(home: LastSubmissionsPage()));
}
