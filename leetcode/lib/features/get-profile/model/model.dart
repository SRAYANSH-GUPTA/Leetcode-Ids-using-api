// lib/profile.dart
class Profile {
  String? username;
  String? name;
  String? birthday; // Change Null? to String?
  String? avatar;
  int? ranking;
  int? reputation;
  String? gitHub; // Change Null? to String?
  String? twitter;
  String? linkedIN; // Change Null? to String?
  List<String>? website;
  String? country;
  String? company; // Change Null? to String?
  String? school; // Change Null? to String?
  List<String>? skillTags; // Change List<Null>? to List<String>?
  String? about;

  Profile({
    this.username,
    this.name,
    this.birthday,
    this.avatar,
    this.ranking,
    this.reputation,
    this.gitHub,
    this.twitter,
    this.linkedIN,
    this.website,
    this.country,
    this.company,
    this.school,
    this.skillTags,
    this.about,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    birthday = json['birthday'];
    avatar = json['avatar'];
    ranking = json['ranking'];
    reputation = json['reputation'];
    gitHub = json['gitHub'];
    twitter = json['twitter'];
    linkedIN = json['linkedIN'];
    website = List<String>.from(json['website'] ?? []); // Use List<String>.from
    country = json['country'];
    company = json['company'];
    school = json['school'];
    skillTags = List<String>.from(json['skillTags'] ?? []); // Use List<String>.from
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['username'] = username;
    data['name'] = name;
    data['birthday'] = birthday;
    data['avatar'] = avatar;
    data['ranking'] = ranking;
    data['reputation'] = reputation;
    data['gitHub'] = gitHub;
    data['twitter'] = twitter;
    data['linkedIN'] = linkedIN;
    data['website'] = website;
    data['country'] = country;
    data['company'] = company;
    data['school'] = school;
    data['skillTags'] = skillTags; // Directly assign, as it's already a List<String>?
    data['about'] = about;
    return data;
  }
}
