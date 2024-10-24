// lib/profile_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view-model/profileViewModel.dart';
import '../../../globals.dart' as globals;
class ProfilePage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Enter username'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text.isNotEmpty) {

                  viewModel.fetchProfile(_usernameController.text);
                  globals.urls = _usernameController.text;
                }
              },
              child: const Text('Fetch Profile'),
            ),
            const SizedBox(height: 20),
            viewModel.isLoading
                ? const CircularProgressIndicator()
                : viewModel.error.isNotEmpty
                    ? Text('Error: ${viewModel.error}')
                    : viewModel.profile == null
                        ? const Text('No profile data')
                        : Padding(
                            padding: const EdgeInsets.only(top: 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(viewModel.profile!.avatar ?? ''),
                                    radius: 50,
                                  ),
                                ),
                                const SizedBox(height: 10),
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
