class Sub {
  int? count;
  List<Submission>? submission;

  Sub({this.count, this.submission});

  // Factory constructor for creating a Sub instance from JSON
  factory Sub.fromJson(Map<String, dynamic> json) {
    return Sub(
      count: json['count'],
      submission: json['submission'] != null
          ? (json['submission'] as List)
              .map((i) => Submission.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['count'] = this.count;
    if (this.submission != null) {
      data['submission'] = this.submission!.map((v) => v.toJson()).toList();
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

  // Factory constructor for creating a Submission instance from JSON
  factory Submission.fromJson(Map<String, dynamic> json) {
    return Submission(
      title: json['title'],
      titleSlug: json['titleSlug'],
      timestamp: json['timestamp'],
      statusDisplay: json['statusDisplay'],
      lang: json['lang'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = this.title;
    data['titleSlug'] = this.titleSlug;
    data['timestamp'] = this.timestamp;
    data['statusDisplay'] = this.statusDisplay;
    data['lang'] = this.lang;
    return data;
  }
}