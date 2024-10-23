import 'package:flutter/material.dart';
import '../features/get-profile/view/profile_page.dart';
import '../features/get-badges/view/badge.dart';
import '../features/number-of-questions/view/solved.dart';
import '../features/contest/view/contest.dart';
import '../features/contest-history/view/contest_history.dart';
import '../features/submissions/view/last_submissions_page.dart';
import 'package:provider/provider.dart';
import 'features/get-profile/view-model/profileViewModel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeetCode Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ProfilePage(),
    BadgesPage(),
    SolvedPage(),
    ContestPage(),
    ContestHistoryPage(),
    LastSubmissionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.blueGrey,
        leading: Padding(
        padding: EdgeInsets.all(9),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/icon.jpg'),
        ),
      ) 
      ,title:Text('LeetCode')),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Badges'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Solved'),
          BottomNavigationBarItem(icon: Icon(Icons.textsms), label: 'Contest'),
          BottomNavigationBarItem(icon: Icon(Icons.pages), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.fork_right), label: 'Submissions'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        
      ),
    );
  }
}
