class Submissions {
  int? count;
  List<Submission>? submissions;

  // Correct constructor name
  Submissions({this.count, this.submissions});

  // Named constructor to parse from JSON
  Submissions.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['submissions'] != null) {
      submissions = <Submission>[];
      json['submissions'].forEach((v) {
        submissions!.add(Submission.fromJson(v));
      });
    }
  }

  // Method to convert object to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['count'] = count;
    if (submissions != null) {
      data['submissions'] =
          submissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Submission {
  String? title;
  String? titleSlug;
  String? timestamp;
  String? statusDisplay;
  String? lang;

  // Constructor
  Submission(
      {this.title,
      this.titleSlug,
      this.timestamp,
      this.statusDisplay,
      this.lang});

  // Named constructor to parse from JSON
  Submission.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleSlug = json['titleSlug'];
    timestamp = json['timestamp'];
    statusDisplay = json['statusDisplay'];
    lang = json['lang'];
  }

  // Method to convert object to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['titleSlug'] = titleSlug;
    data['timestamp'] = timestamp;
    data['statusDisplay'] = statusDisplay;
    data['lang'] = lang;
    return data;
  }
}
