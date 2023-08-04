// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticipantDTO _$ParticipantDTOFromJson(Map<String, dynamic> json) =>
    ParticipantDTO(
      assists: json['assists'] as int,
      baronKills: json['baronKills'] as int,
      bountyLevel: json['bountyLevel'] as int,
      champExperience: json['champExperience'] as int,
      champLevel: json['champLevel'] as int,
      championId: json['championId'] as int,
      championName: json['championName'] as String?,
      championTransform: json['championTransform'] as int,
      consumablesPurchased: json['consumablesPurchased'] as int,
      damageDealtToBuildings: json['damageDealtToBuildings'] as int,
      damageDealtToObjectives: json['damageDealtToObjectives'] as int,
      damageDealtToTurrets: json['damageDealtToTurrets'] as int,
      damageSelfMitigated: json['damageSelfMitigated'] as int,
      deaths: json['deaths'] as int,
      detectorWardsPlaced: json['detectorWardsPlaced'] as int,
      doubleKills: json['doubleKills'] as int,
      dragonKills: json['dragonKills'] as int,
      firstBloodAssist: json['firstBloodAssist'] as bool,
      firstBloodKill: json['firstBloodKill'] as bool,
      firstTowerAssist: json['firstTowerAssist'] as bool,
      firstTowerKill: json['firstTowerKill'] as bool,
      gameEndedInEarlySurrender: json['gameEndedInEarlySurrender'] as bool,
      gameEndedInSurrender: json['gameEndedInSurrender'] as bool,
      goldEarned: json['goldEarned'] as int,
      goldSpent: json['goldSpent'] as int,
      individualPosition: json['individualPosition'] as String?,
      inhibitorKills: json['inhibitorKills'] as int,
      inhibitorTakedowns: json['inhibitorTakedowns'] as int,
      inhibitorsLost: json['inhibitorsLost'] as int,
      item0: json['item0'] as int,
      item1: json['item1'] as int,
      item2: json['item2'] as int,
      item3: json['item3'] as int,
      item4: json['item4'] as int,
      item5: json['item5'] as int,
      item6: json['item6'] as int,
      itemsPurchased: json['itemsPurchased'] as int,
      killingSprees: json['killingSprees'] as int,
      kills: json['kills'] as int,
      lane: json['lane'] as String?,
      largestCriticalStrike: json['largestCriticalStrike'] as int,
      largestKillingSpree: json['largestKillingSpree'] as int,
      largestMultiKill: json['largestMultiKill'] as int,
      longestTimeSpentLiving: json['longestTimeSpentLiving'] as int,
      magicDamageDealt: json['magicDamageDealt'] as int,
      magicDamageDealtToChampions: json['magicDamageDealtToChampions'] as int,
      magicDamageTaken: json['magicDamageTaken'] as int,
      neutralMinionsKilled: json['neutralMinionsKilled'] as int,
      nexusKills: json['nexusKills'] as int,
      nexusTakedowns: json['nexusTakedowns'] as int,
      nexusLost: json['nexusLost'] as int,
      objectivesStolen: json['objectivesStolen'] as int,
      objectivesStolenAssists: json['objectivesStolenAssists'] as int,
      participantId: json['participantId'] as int,
      pentaKills: json['pentaKills'] as int,
      perks: PerksDTO.fromJson(json['perks'] as Map<String, dynamic>),
      physicalDamageDealt: json['physicalDamageDealt'] as int,
      physicalDamageDealtToChampions:
          json['physicalDamageDealtToChampions'] as int,
      physicalDamageTaken: json['physicalDamageTaken'] as int,
      profileIcon: json['profileIcon'] as int,
      puuid: json['puuid'] as String?,
      quadraKills: json['quadraKills'] as int,
      riotIdName: json['riotIdName'] as String?,
      riotIdTagline: json['riotIdTagline'] as String?,
      role: json['role'] as String?,
      sightWardsBoughtInGame: json['sightWardsBoughtInGame'] as int,
      spell1Casts: json['spell1Casts'] as int,
      spell2Casts: json['spell2Casts'] as int,
      spell3Casts: json['spell3Casts'] as int,
      spell4Casts: json['spell4Casts'] as int,
      summoner1Casts: json['summoner1Casts'] as int,
      summoner1Id: json['summoner1Id'] as int,
      summoner2Casts: json['summoner2Casts'] as int,
      summoner2Id: json['summoner2Id'] as int,
      summonerId: json['summonerId'] as String?,
      summonerLevel: json['summonerLevel'] as int,
      summonerName: json['summonerName'] as String?,
      teamEarlySurrendered: json['teamEarlySurrendered'] as bool,
      teamId: json['teamId'] as int,
      teamPosition: json['teamPosition'] as String?,
      timeCCingOthers: json['timeCCingOthers'] as int,
      timePlayed: json['timePlayed'] as int,
      totalDamageDealt: json['totalDamageDealt'] as int,
      totalDamageDealtToChampions: json['totalDamageDealtToChampions'] as int,
      totalDamageShieldedOnTeammates:
          json['totalDamageShieldedOnTeammates'] as int,
      totalDamageTaken: json['totalDamageTaken'] as int,
      totalHeal: json['totalHeal'] as int,
      totalHealsOnTeammates: json['totalHealsOnTeammates'] as int,
      totalMinionsKilled: json['totalMinionsKilled'] as int,
      totalTimeCCDealt: json['totalTimeCCDealt'] as int,
      totalTimeSpentDead: json['totalTimeSpentDead'] as int,
      totalUnitsHealed: json['totalUnitsHealed'] as int,
      tripleKills: json['tripleKills'] as int,
      trueDamageDealt: json['trueDamageDealt'] as int,
      trueDamageDealtToChampions: json['trueDamageDealtToChampions'] as int,
      trueDamageTaken: json['trueDamageTaken'] as int,
      turretKills: json['turretKills'] as int,
      turretTakedowns: json['turretTakedowns'] as int,
      turretsLost: json['turretsLost'] as int,
      unrealKills: json['unrealKills'] as int,
      visionScore: json['visionScore'] as int,
      visionWardsBoughtInGame: json['visionWardsBoughtInGame'] as int,
      wardsKilled: json['wardsKilled'] as int,
      wardsPlaced: json['wardsPlaced'] as int,
      win: json['win'] as bool,
    );
