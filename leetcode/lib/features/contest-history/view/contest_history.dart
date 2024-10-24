import 'package:flutter/material.dart';
import '../viewmodel/viewmodel.dart';
import '../history-model.dart/history.dart'; // Ensure the correct path

class ContestHistoryPage extends StatelessWidget {
  const ContestHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contest History')),
      body: FutureBuilder<History?>(
        future: fetchHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No data found.'));
          }

          final historyData = snapshot.data!; // Unwrap the data
          return Center(
            child: Text('Count: ${historyData.count}'),
          );
        },
      ),
    );
  }
}
