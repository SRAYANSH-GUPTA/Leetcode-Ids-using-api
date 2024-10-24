import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../view-model/submissionviewmodel.dart';
import '../submissions-model/submissionsmodel.dart';


// Your existing Sub and Submission classes go here

class LastSubmissionsPage extends StatelessWidget {
  Future<Sub> fetchSubmissionData() async {
    final url = Uri.parse('https://alfa-leetcode-api.onrender.com/neal_wu/submission');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submission Details'),
      ),
      body: FutureBuilder<Sub>(
        future: fetchSubmissionData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.submission == null) {
            return Center(child: Text('No submissions found.'));
          }

          final submissionData = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Count: ${submissionData.count}', style: TextStyle(fontSize: 20)),
                SizedBox(height: 16),
                Text('Submissions:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: submissionData.submission!.length,
                    itemBuilder: (context, index) {
                      final submission = submissionData.submission![index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          title: Text(submission.title ?? 'No Title'),
                          subtitle: Text('Status: ${submission.statusDisplay ?? 'Unknown'}'),
                          trailing: Text(submission.timestamp ?? 'No Timestamp'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
