class Badge {
  int? badgesCount;
  List<Badges>? badges;
  List<UpcomingBadges>? upcomingBadges;
  Null activeBadge;

  Badge({
    this.badgesCount,
    this.badges,
    this.upcomingBadges,
    this.activeBadge,
  });

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      badgesCount: json['badgesCount'],
      badges: (json['badges'] as List?)
          ?.map((v) => Badges.fromJson(v))
          .toList(),
      upcomingBadges: (json['upcomingBadges'] as List?)
          ?.map((v) => UpcomingBadges.fromJson(v))
          .toList(),
      activeBadge: json['activeBadge'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['badgesCount'] = badgesCount;
    if (badges != null) {
      data['badges'] = badges!.map((v) => v.toJson()).toList();
    }
    if (upcomingBadges != null) {
      data['upcomingBadges'] = upcomingBadges!.map((v) => v.toJson()).toList();
    }
    data['activeBadge'] = activeBadge;
    return data;
  }
}

class Badges {
  String? id;
  String? displayName;
  String? icon;
  String? creationDate;

  Badges({this.id, this.displayName, this.icon, this.creationDate});

  factory Badges.fromJson(Map<String, dynamic> json) {
    return Badges(
      id: json['id'],
      displayName: json['displayName'],
      icon: json['icon'],
      creationDate: json['creationDate'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['displayName'] = displayName;
    data['icon'] = icon;
    data['creationDate'] = creationDate;
    return data;
  }
}

class UpcomingBadges {
  String? name;
  String? icon;

  UpcomingBadges({this.name, this.icon});

  factory UpcomingBadges.fromJson(Map<String, dynamic> json) {
    return UpcomingBadges(
      name: json['name'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    return data;
  }
}