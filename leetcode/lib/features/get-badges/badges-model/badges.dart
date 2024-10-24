class badge {
  int? badgesCount;
  List<Badges>? badges;
  List<UpcomingBadges>? upcomingBadges;
  Null? activeBadge;

  badge({this.badgesCount, this.badges, this.upcomingBadges, this.activeBadge});

  badge.fromJson(Map<String, dynamic> json) {
    badgesCount = json['badgesCount'];
    if (json['badges'] != null) {
      badges = <Badges>[];
      json['badges'].forEach((v) {
        badges!.add(new Badges.fromJson(v));
      });
    }
    if (json['upcomingBadges'] != null) {
      upcomingBadges = <UpcomingBadges>[];
      json['upcomingBadges'].forEach((v) {
        upcomingBadges!.add(new UpcomingBadges.fromJson(v));
      });
    }
    activeBadge = json['activeBadge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['badgesCount'] = this.badgesCount;
    if (this.badges != null) {
      data['badges'] = this.badges!.map((v) => v.toJson()).toList();
    }
    if (this.upcomingBadges != null) {
      data['upcomingBadges'] =
          this.upcomingBadges!.map((v) => v.toJson()).toList();
    }
    data['activeBadge'] = this.activeBadge;
    return data;
  }
}

class Badges {
  String? id;
  String? displayName;
  String? icon;
  String? creationDate;

  Badges({this.id, this.displayName, this.icon, this.creationDate});

  Badges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    icon = json['icon'];
    creationDate = json['creationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['displayName'] = this.displayName;
    data['icon'] = this.icon;
    data['creationDate'] = this.creationDate;
    return data;
  }
}

class UpcomingBadges {
  String? name;
  String? icon;

  UpcomingBadges({this.name, this.icon});

  UpcomingBadges.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}