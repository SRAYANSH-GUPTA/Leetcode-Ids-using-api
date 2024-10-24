import 'package:flutter/material.dart';
import '../badges-view-model/badges-view-model.dart';


class BadgesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Badges Count: ${badgeData.badgesCount}'));}

}