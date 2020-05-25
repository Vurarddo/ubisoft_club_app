import 'package:test/test.dart';

import 'package:ubisoft_club_app/models/news/news.dart';

void main() {
  group('game progress news class test', () {
    News tNews;
    final int tId = 1;
    final int tLiked = 100;
    final String tGameName = 'Tom Clancy\'s Rainbow Six® Siege';
    final String tPlatform = 'XONE';
    final String tChallengeType = 'Weekly';
    final String tImage = 'imageURL';
    final double tProgress = 50.0;
    final String tGameMode = 'The Grand Larceny';
    final bool tIsLiked = false;

    setUp(() {
      tNews = News.gameProgress(
        id: tId,
        liked: tLiked,
        gameName: tGameName,
        platform: tPlatform,
        challengeType: tChallengeType,
        image: tImage,
        progress: tProgress,
        gameMode: tGameMode,
        isLiked: tIsLiked,
      );
    });

    test('game progress news id test', () {
      final int _tId = 1;

      expect(tNews.id, _tId);
    });

    test('game progress news liked test', () {
      final int _tLiked = 100;

      expect(tNews.liked, _tLiked);
    });

    test('game progress news game name test', () {
      final String _tGameName = 'Tom Clancy\'s Rainbow Six® Siege';

      expect(tNews.gameName, _tGameName);
    });

    test('game progress news platform test', () {
      final String _tPlatform = 'XONE';

      expect(tNews.platform, _tPlatform);
    });

    test('game progress news challenge type test', () {
      final String _tChallengeType = 'Weekly';

      expect(tNews.challengeType, _tChallengeType);
    });

    test('game progress news image test', () {
      final String _tImage = 'imageURL';

      expect(tNews.image, _tImage);
    });

    test('game progress news progress test', () {
      final double _tProgress = 50.0;

      expect(tNews.progress, _tProgress);
    });

    test('game progress news progress test', () {
      final String _tGameMode = 'The Grand Larceny';

      expect(tNews.gameMode, _tGameMode);
    });

    test('game progress news is liked test', () {
      final bool _tIsLiked = false;

      expect(tNews.isLiked, _tIsLiked);
    });

    test('full game progress news test', () {
      final _tNews = News.gameProgress(
        id: tId,
        liked: tLiked,
        gameName: tGameName,
        platform: tPlatform,
        challengeType: tChallengeType,
        image: tImage,
        progress: tProgress,
        gameMode: tGameMode,
        isLiked: tIsLiked,
      );

      expect(tNews, _tNews);
    });

    test('full game progress news is not null test', () {
      expect(tNews, isNotNull);
    });
  });
}
