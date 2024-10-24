import 'package:flutter/material.dart';
import '../badges-view-model/badgesviewmodel.dart'; // Update this path if necessary
import '../badges-model/badges.dart' as badge; // Update this path if necessary


class BadgesPage extends StatefulWidget {
  const BadgesPage({super.key});

  @override
  _BadgesPageState createState() => _BadgesPageState();
}

class _BadgesPageState extends State<BadgesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Badges')),
      body: FutureBuilder<badge.Badge>(
        future: fetchBadgeData(), // Fetch badge data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found.'));
          }

          final badgeData = snapshot.data!; // Unwrap the data

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Badges Count: ${badgeData.badgesCount}'),
                if (badgeData.badges != null) ...[
                  for (var badge in badgeData.badges!)
                    ListTile(
                      title: Text(badge.displayName ?? 'Unnamed Badge'),
                      leading: badge.icon != null
                          ? Image.network(badge.icon!)
                          : null,
                    ),
                ],
                if (badgeData.upcomingBadges != null) ...[
                  const Text('Upcoming Badges:'),
                  for (var upcomingBadge in badgeData.upcomingBadges!)
                    ListTile(
                      title: Text(upcomingBadge.name ?? 'Unnamed Upcoming Badge'),
                      leading: upcomingBadge.icon != null
                          ? Image.network(upcomingBadge.icon!)
                          : null,
                    ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
