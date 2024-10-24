class Solved {
  int? count;
  List<Submission>? submission;

  Solved({this.count, this.submission});

  Solved.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['submission'] != null) {
      submission = <Submission>[];
      json['submission'].forEach((v) {
        submission!.add(Submission.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['count'] = count;
    if (submission != null) {
      data['submission'] = submission!.map((v) => v.toJson()).toList();
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

  Submission({this.title, this.titleSlug, this.timestamp, this.statusDisplay, this.lang});

  Submission.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleSlug = json['titleSlug'];
    timestamp = json['timestamp'];
    statusDisplay = json['statusDisplay'];
    lang = json['lang'];
  }

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
