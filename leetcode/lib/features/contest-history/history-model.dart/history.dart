class History {
  int? count;
  List<ContestHistory>? contestHistory;

  History({this.count, this.contestHistory});

  History.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['contestHistory'] != null) {
      contestHistory = <ContestHistory>[];
      json['contestHistory'].forEach((v) {
        contestHistory!.add(ContestHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['count'] = count;
    if (contestHistory != null) {
      data['contestHistory'] =
          contestHistory!.map((v) => v.toJson()).toList();
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
        json['contest'] != null ? Contest.fromJson(json['contest']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['attended'] = attended;
    data['rating'] = rating;
    data['ranking'] = ranking;
    data['trendDirection'] = trendDirection;
    data['problemsSolved'] = problemsSolved;
    data['totalProblems'] = totalProblems;
    data['finishTimeInSeconds'] = finishTimeInSeconds;
    if (contest != null) {
      data['contest'] = contest!.toJson();
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
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['startTime'] = startTime;
    return data;
  }
}
