// lib/profile_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view-model/profileViewModel.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Enter username'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text.isNotEmpty) {
                  viewModel.fetchProfile(_usernameController.text);
                }
              },
              child: Text('Fetch Profile'),
            ),
            SizedBox(height: 20),
            viewModel.isLoading
                ? CircularProgressIndicator()
                : viewModel.error.isNotEmpty
                    ? Text('Error: ${viewModel.error}')
                    : viewModel.profile == null
                        ? Text('No profile data')
                        : Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(viewModel.profile!.avatar ?? ''),
                                  radius: 50,
                                ),
                                SizedBox(height: 10),
                                Text('Username: ${viewModel.profile!.username ?? 'N/A'}'),
                                // Add other fields as necessary
                              ],
                            ),
                          ),
          ],
        ),
      ),
    );
  }
}
