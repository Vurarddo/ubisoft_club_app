import 'package:test/test.dart';
import 'package:ubisoft_club_app/models/user/user.dart';

import 'package:ubisoft_club_app/models/news.dart';

void main() {
  group('game progress news class test', () {
    GameProgressNews tNews;
    final int tId = 1;
    final int tLiked = 100;
    final String tGameName = 'Tom Clancy\'s Rainbow Six® Siege';
    final String tPlatform = 'XONE';
    final ChallengeType tChallengeType = ChallengeType.classic;
    final String tImage = 'imageURL';
    final double tProgress = 50.0;
    final String tGameMode = 'The Grand Larceny';
    final bool tIsLiked = false;
    final DateTime tPublished = DateTime(2020, 26, 5, 13, 38);
    final User tAccount = User.clubAndNews(
      id: 2,
      name: 'Tom Clancy\'s Rainbow Six® Siege',
      image:
      'https://3dnews.ru/assets/external/illustrations/2020/03/05/1005203/sm.1.750.jpeg',
    );

    setUp(() {
      tNews = GameProgressNews(
        id: tId,
        user: tAccount,
        liked: tLiked,
        gameName: tGameName,
        platform: tPlatform,
        challengeType: tChallengeType,
        image: tImage,
        progress: tProgress,
        gameMode: tGameMode,
        isLiked: tIsLiked,
        published: tPublished,
      );
    });

    test('game progress news id test', () {
      final int _tId = 1;

      expect(tNews.id, _tId);
    });

    test('game progress account test', () {
      final User _tAccount = User.clubAndNews(
        id: 2,
        name: 'Tom Clancy\'s Rainbow Six® Siege',
        image:
        'https://3dnews.ru/assets/external/illustrations/2020/03/05/1005203/sm.1.750.jpeg',
      );

      expect(tNews.user, _tAccount);
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
      final ChallengeType _tChallengeType = ChallengeType.classic;

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

    test('game progress news published test', () {
      final DateTime _tPublished = DateTime(2020, 26, 5, 13, 38);

      expect(tNews.published, _tPublished);
    });

    test('full game progress news test', () {
      final _tNews = GameProgressNews(
        id: tId,
        user: tAccount,
        liked: tLiked,
        gameName: tGameName,
        platform: tPlatform,
        challengeType: tChallengeType,
        image: tImage,
        progress: tProgress,
        gameMode: tGameMode,
        isLiked: tIsLiked,
        published: tPublished,
      );

      expect(tNews, _tNews);
    });

    test('full game progress news is not null test', () {
      expect(tNews, isNotNull);
    });
  });
}
