import 'package:flutter/material.dart';
import '../contestviewmodel/contestviewmodel.dart'; // Make sure the path is correct
import '../contestmodel/contestmodel.dart'; // Import your model

class ContestPage extends StatefulWidget {
  const ContestPage({super.key});

  @override
  _ContestPageState createState() => _ContestPageState();
}

class _ContestPageState extends State<ContestPage> {
  Contest? contest;

  @override
  void initState() {
    super.initState();
    fetchContestData();
  }

  Future<void> fetchContestData() async {
    Contest? fetchedContest = await fetchContest();
    setState(() {
      contest = fetchedContest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: contest != null
          ? Text('Contest attended: ${contest!.contestAttend}')
          : const CircularProgressIndicator(),
    );
  }
}
