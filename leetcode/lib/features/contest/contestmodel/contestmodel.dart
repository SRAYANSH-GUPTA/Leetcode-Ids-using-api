
class Contest {
  int? contestAttend;
  double? contestRating;
  int? contestGlobalRanking;
  int? totalParticipants;
  double? contestTopPercentage;
  ContestBadges? contestBadges;
  List<ContestParticipation>? contestParticipation;

  Contest({
    this.contestAttend,
    this.contestRating,
    this.contestGlobalRanking,
    this.totalParticipants,
    this.contestTopPercentage,
    this.contestBadges,
    this.contestParticipation,
  });

  factory Contest.fromJson(Map<String, dynamic> json) {
    return Contest(
      contestAttend: json['contestAttend'],
      contestRating: json['contestRating'],
      contestGlobalRanking: json['contestGlobalRanking'],
      totalParticipants: json['totalParticipants'],
      contestTopPercentage: json['contestTopPercentage'],
      contestBadges: json['contestBadges'] != null
          ? ContestBadges.fromJson(json['contestBadges'])
          : null,
      contestParticipation: json['contestParticipation'] != null
          ? (json['contestParticipation'] as List)
              .map((i) => ContestParticipation.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['contestAttend'] = contestAttend;
    data['contestRating'] = contestRating;
    data['contestGlobalRanking'] = contestGlobalRanking;
    data['totalParticipants'] = totalParticipants;
    data['contestTopPercentage'] = contestTopPercentage;
    if (contestBadges != null) {
      data['contestBadges'] = contestBadges!.toJson();
    }
    if (contestParticipation != null) {
      data['contestParticipation'] =
          contestParticipation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContestBadges {
  String? name;

  ContestBadges({this.name});

  factory ContestBadges.fromJson(Map<String, dynamic> json) {
    return ContestBadges(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
    };
  }
}

class ContestParticipation {
  bool? attended;
  double? rating;
  int? ranking;
  String? trendDirection;
  int? problemsSolved;
  int? totalProblems;
  int? finishTimeInSeconds;
  Contest? contest;

  ContestParticipation({
    this.attended,
    this.rating,
    this.ranking,
    this.trendDirection,
    this.problemsSolved,
    this.totalProblems,
    this.finishTimeInSeconds,
    this.contest,
  });

  factory ContestParticipation.fromJson(Map<String, dynamic> json) {
    return ContestParticipation(
      attended: json['attended'],
      rating: json['rating'],
      ranking: json['ranking'],
      trendDirection: json['trendDirection'],
      problemsSolved: json['problemsSolved'],
      totalProblems: json['totalProblems'],
      finishTimeInSeconds: json['finishTimeInSeconds'],
      contest: json['contest'] != null
          ? Contest.fromJson(json['contest'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
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