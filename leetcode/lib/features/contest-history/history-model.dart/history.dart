class history {
  int? count;
  List<ContestHistory>? contestHistory;

  history({this.count, this.contestHistory});

  history.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['contestHistory'] != null) {
      contestHistory = <ContestHistory>[];
      json['contestHistory'].forEach((v) {
        contestHistory!.add(new ContestHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.contestHistory != null) {
      data['contestHistory'] =
          this.contestHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContestHistory {
  bool? attended;
  double? rating;
  int? ranking;
  String? trendDirection;
  int? problemsSolved;
  int? totalProblems;
  int? finishTimeInSeconds;
  Contest? contest;

  ContestHistory(
      {this.attended,
      this.rating,
      this.ranking,
      this.trendDirection,
      this.problemsSolved,
      this.totalProblems,
      this.finishTimeInSeconds,
      this.contest});

  ContestHistory.fromJson(Map<String, dynamic> json) {
    attended = json['attended'];
    rating = json['rating'];
    ranking = json['ranking'];
    trendDirection = json['trendDirection'];
    problemsSolved = json['problemsSolved'];
    totalProblems = json['totalProblems'];
    finishTimeInSeconds = json['finishTimeInSeconds'];
    contest =
        json['contest'] != null ? new Contest.fromJson(json['contest']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attended'] = this.attended;
    data['rating'] = this.rating;
    data['ranking'] = this.ranking;
    data['trendDirection'] = this.trendDirection;
    data['problemsSolved'] = this.problemsSolved;
    data['totalProblems'] = this.totalProblems;
    data['finishTimeInSeconds'] = this.finishTimeInSeconds;
    if (this.contest != null) {
      data['contest'] = this.contest!.toJson();
    }
    return data;
  }
}

class Contest {
  String? title;
  int? startTime;

  Contest({this.title, this.startTime});

  Contest.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    startTime = json['startTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['startTime'] = this.startTime;
    return data;
  }
}