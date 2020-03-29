class Team {
  String idTeam;
  String strTeamBadge;
  String strTeam;
  String intFormedYear;
  String strStadium;
  String strDescriptionEN;

  Team({this.idTeam, this.strTeamBadge, this.strTeam, this.intFormedYear,
      this.strStadium, this.strDescriptionEN});

  Map<String, dynamic> toMap() {
    return {
      'idTeam': idTeam,
      'strTeamBadge': strTeamBadge,
      'strTeam': strTeam,
      'intFormedYear': intFormedYear,
      'strStadium': strStadium,
      'strDescriptionEN': strDescriptionEN
    };
  }
}