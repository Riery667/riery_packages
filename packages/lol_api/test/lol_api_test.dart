import 'package:lol_api/src/league-v4/league_v4.dart';
import 'package:lol_api/src/lol-challenges-v1/lol_challenges_v1.dart';
import 'package:lol_api/src/lol-status-v4/lol_status_v4.dart';
import 'package:lol_api/src/champion-mastery-v4/champion_mastery_v4.dart';
import 'package:lol_api/src/league-exp-v4/league_exp_v4.dart';
import 'package:lol_api/src/match-v5/match_v5.dart';
import 'package:lol_api/src/spectator-v4/spectator_v4.dart';
import 'package:lol_api/src/summoner-v4/summoner_v4.dart';
import 'package:lol_api/src/clash-v1/clash_v1.dart';
import 'package:lol_api/src/model.dart';
import 'package:test/test.dart';
import 'package:riot_api/riot_api.dart';

void main() async {
  setUp(() {
    RiotApi.init(apiKey: 'RGAPI-731bbcc9-ce69-4763-8921-ce31d06c1cad');
  });

  // Test with your info
  const puuid =
      "aMcGXpCOY_3DTuJ-c4dmPEXsrQJc_oDhmeMIXOV202m4R9-yvv5458saKkjc-SG2M6GW81iPJ3wDNw";
  const id = "11XDoEQkdGCA6BPPUK3qZG38K-0Q2puGB81p7-gOousqzg";
  const accountId = "jHYeOXAGIP4c2Tn5lWVWQbFWZ9f_8jPu_2G47s2j2AusQmk";
  const summonerName = "yuka kitamura";
  const leagueId = "d0b1b942-48e9-4e31-8f18-99d16d754a3d";

  group('Match-V5', () {
    test('Get a match by match id.', () async {
      try {
        final matchIds = await MatchV5.getMatchIdsByPuuid(
            PlatformValues.asia, puuid,
            count: 3);
        final match =
            await MatchV5.getMatchByMatchId(PlatformValues.asia, matchIds[0]);
        expect(match, isA<MatchDTO>());
      } catch (e) {
        expect(e, isA<AssertionError>());
      }
    });
    test('Get a list of match ids by puuid.', () async {
      try {
        final matchIds = await MatchV5.getMatchIdsByPuuid(
          PlatformValues.asia,
          puuid,
          count: 0,
          type: MatchType.normal,
        );
        expect(matchIds, isA<List<String>>());
        expect(matchIds, hasLength(0));
      } catch (e) {
        expect(e, isA<AssertionError>());
      }
    });
    test(
        'Get a list of match ids by puuid with startTime greater than endTime.',
        () async {
      try {
        await MatchV5.getMatchIdsByPuuid(
          PlatformValues.asia,
          puuid,
          startTime: 1000,
          endTime: 100,
          type: MatchType.normal,
        );
      } catch (e) {
        expect(e, isA<AssertionError>());
      }
    });
    test('Get a list of match ids by puuid with exceeded count.', () async {
      try {
        await MatchV5.getMatchIdsByPuuid(
          PlatformValues.asia,
          puuid,
          count: 101,
          type: MatchType.normal,
        );
      } catch (e) {
        expect(e, isA<AssertionError>());
      }
    });
  });
  group('League-V4', () {
    test('Get the master league for given queue.', () async {
      final league = await LeagueV4.getMasterLeagueForGivenQueue(
          RegionValues.br1, QueueType.rankedFlexSR);
      expect(league, isA<LeagueListDTO>());
    });
    test('Get league with given Id, including inactive entries.', () async {
      final league =
          await LeagueV4.getLeagueByLeagueId(RegionValues.br1, leagueId);
      expect(league, isA<LeagueListDTO>());
    });
    test('Get all the league entries.', () async {
      final config = await LeagueV4.getGrandmasterSpecificQueue(
          RegionValues.br1, QueueType.rankedFlexSR);
      expect(config, isA<LeagueListDTO>());
    });
    test('Get all the league entries.', () async {
      final config = await LeagueV4.getAllLeageueEntries(RegionValues.br1,
          division: Division.one,
          tier: Tier.bronze,
          queue: QueueType.rankedFlexSR,
          page: 3);
      expect(config, isA<List<LeagueEntryDTO>>());
    });
    test('Get the challenger league for given queue.', () async {
      final config = await LeagueV4.getAllLeageueEntriesForSummonerId(
          RegionValues.br1, id);
      expect(config, isA<List<LeagueEntryDTO>>());
    });
    test('Get the challenger league for given queue.', () async {
      final config = await LeagueV4.getChallengerLeagueForQueue(
          RegionValues.br1, QueueType.rankedSolo_5x5);
      expect(config, isA<LeagueListDTO>());
    });
  });
  group("LOL-CHALLENGES-V1", () {
    test('Get player\'s info with progressed challenge.', () async {
      final config = await LOLChallengesV1.getPlayerInfoWithChallenge(
          RegionValues.br1, puuid);
      expect(config, isA<PlayerInfoDTO>());
    });
    test('Get map of level to percentile of players who have achieved it',
        () async {
      final config =
          await LOLChallengesV1.getMapOfLevelToPercentile(RegionValues.br1, 0);
      expect(config, isA<LevelToPercentile>());
    });
    test('Return top players for each level.', () async {
      final config = await LOLChallengesV1.getTopPlayersOfLevel(
          RegionValues.br1, 0, Level.challenger,
          limit: 1);
      expect(config, isA<List<ApexPlayerInfoDTO>>());
    });
    test('Get challenge configuration', () async {
      final config =
          await LOLChallengesV1.getSingleChallengeConfig(RegionValues.br1, 0);
      expect(config, isA<ChallengeConfigInfoDTO>());
    });
    test(
        'List of all basic challenge configuration information (includes all translations for names and descriptions',
        () async {
      final config =
          await LOLChallengesV1.getAllChallengeConfig(RegionValues.br1);
      expect(config, isA<List<ChallengeConfigInfoDTO>>());
    });
    test('Get percentile', () async {
      final config =
          await LOLChallengesV1.getMapOfLevelToPercentiles(RegionValues.br1);
      expect(config, isA<SerializableMapOfPercentile>());
    });
  });
  group("LOL-STATUS-V4", () {
    test('Get League of Legends status for the given platform', () async {
      final status = await LoLStatusV4.getLOLStatus(RegionValues.br1);
      expect(status, isA<PlatformDataDTO>());
    });
  });
  group("Champion-Mastery-V4", () {
    test(
        'Get all champion mastery entries sorted by number of champion points descending.',
        () async {
      final mastery =
          await ChampionMasteryV4.getAllChampionMastery(RegionValues.br1, id);
      expect(mastery, isA<List<ChampionMasteryDTO>>());
    });

    test('Get a champion mastery by player Id and champion Id.', () async {
      final mastery =
          await ChampionMasteryV4.getChampionMasteryByPlayerIdAndChampionId(
              RegionValues.br1, id, 7);
      expect(mastery, isA<ChampionMasteryDTO>());
    });

    test(
        'Get specified number of top champion mastery entries sorted by number of champion points descending.',
        () async {
      final mastery = await ChampionMasteryV4.getAllChampionMasteryDesc(
          RegionValues.br1, id,
          count: 2);
      expect(mastery, isA<List<ChampionMasteryDTO>>());
    });
    test(
        'Get a player\'s total champion mastery score, which is the sum of individual champion mastery levels.',
        () async {
      final mastery =
          await ChampionMasteryV4.getTotalMasteryScore(RegionValues.br1, id);
      expect(mastery, isA<int>());
    });
  });
  group("Summoner-V4", () {
    test('Summoner-V4 query test - Get a summoner by account Id.', () async {
      final summoner =
          await SummonerV4.getSummonerByAccountId(RegionValues.br1, accountId);
      expect(summoner, isA<SummonerDTO>());
    });
    test('Summoner-V4 query test - Get a summoner by name.', () async {
      final summoner = await SummonerV4.getSummonerBySummonerName(
          RegionValues.br1, summonerName);
      expect(summoner, isA<SummonerDTO>());
    });
    test('Summoner-V4 query test - Get a summoner by puuid.', () async {
      final summoner =
          await SummonerV4.getSummonerByPUUId(RegionValues.br1, puuid);
      expect(summoner, isA<SummonerDTO>());
    });
    test('Summoner-V4 query test - Get a summoner by summoner id.', () async {
      final summoner = await SummonerV4.getSummonerBySummonerName(
          RegionValues.br1, summonerName);
      final user = await SummonerV4.getSummonerBySummonerId(
          RegionValues.br1, summoner.id);
      expect(user, isA<SummonerDTO>());
    });
  });
  group("Spectator-V4", () {
    test(
        'Spectator-V4 query test - Get current game information for the given summoner Id.',
        () async {
      try {
        final user =
            await SummonerV4.getSummonerBySummonerName(RegionValues.br1, "아스읖");
        final featuredGameInfo =
            await SpectatorV4.getCurrentGameInfoBySummonerId(
                RegionValues.br1, user.id);
        expect(featuredGameInfo, isA<CurrentGameInfo>());
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
    test('Spectator-V4 query test - Get list of featured games.', () async {
      final featuredGameInfo =
          await SpectatorV4.getFeaturedGames(RegionValues.br1);
      expect(featuredGameInfo, isA<FeaturedGameInfo>());
    });
  });
  group("Crash-V1", () {
    test('Get all active or upcoming tournaments.', () async {
      final tournaments =
          await ClashV1.getActiveOrUpcomingTournaments(RegionValues.br1);
      expect(tournaments, isA<List<TournamentDTO?>>());
    });
  });
  group("League-Exp-V4", () {
    test('Get all active or upcoming tournaments.', () async {
      final tournaments = await LeagueExpV4.getLeagueEntry(RegionValues.br1,
          queue: QueueType.rankedSolo_5x5,
          tier: Tier.diamond,
          division: Division.one,
          page: 3);
      expect(tournaments, isA<List<LeagueEntryDTO>>());
    });
  });
}
