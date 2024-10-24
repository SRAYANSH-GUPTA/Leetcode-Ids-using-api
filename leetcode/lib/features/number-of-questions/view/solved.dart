import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../questions-model.dart/questions-model.dart'; // Ensure this path is correct

class SolvedPage extends StatelessWidget {
  Future<Solved> fetchSolvedData() async {
    final url = Uri.parse('https://alfa-leetcode-api.onrender.com/neal_wu/solved');
    final response = await http.get(url, headers: {'api-key': 'postmanrulz'});

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print('API Response: $jsonResponse'); // Debugging line
      return Solved.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solved Submissions'),
      ),
      body: FutureBuilder<Solved>(
        future: fetchSolvedData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final solved = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Count: ${solved.count}', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: solved.submission?.length ?? 0,
                      itemBuilder: (context, index) {
                        final submission = solved.submission![index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(submission.title ?? 'No Title'),
                            subtitle: Text('Status: ${submission.statusDisplay ?? 'Unknown'}'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(child: Text('No data available'));
        },
      ),
    );
  }
}
