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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Enter username'),
              ),
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
                            padding: const EdgeInsets.only(top: 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(viewModel.profile!.avatar ?? ''),
                                    radius: 50,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text('Username: ${viewModel.profile!.username ?? 'N/A'}'),
                                Text('Name: ${viewModel.profile!.name ?? 'N/A'}'),
                                Text('Birthday: ${viewModel.profile!.birthday ?? 'N/A'}'),
                                Text('Ranking: ${viewModel.profile!.ranking ?? 'N/A'}'),
                                Text('Country: ${viewModel.profile!.country ?? 'N/A'}'),


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
