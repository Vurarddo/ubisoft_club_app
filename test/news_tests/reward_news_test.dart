import 'package:test/test.dart';

import 'package:ubisoft_club_app/models/news/news.dart';

void main() {
  group('reward news class test', () {
    RewardNews tNews;
    final int tId = 1;
    final int tLiked = 100;
    final String tGameName = 'Tom Clancy\'s Rainbow Six® Siege';
    final String tPlatform = 'XONE';
    final RewardQuality tRewardQuality = RewardQuality.Legendary;
    final String tImage = 'imageURL';
    final bool tIsLiked = false;
    final DateTime tPublished = DateTime(2020, 26, 5, 13, 38);

    setUp(() {
      tNews = RewardNews(
        id: tId,
        liked: tLiked,
        gameName: tGameName,
        platform: tPlatform,
        image: tImage,
        rewardQuality: tRewardQuality,
        isLiked: tIsLiked,
        published: tPublished,
      );
    });

    test('reward news id test', () {
      final int _tId = 1;

      expect(tNews.id, _tId);
    });

    test('reward news liked test', () {
      final int _tLiked = 100;

      expect(tNews.liked, _tLiked);
    });

    test('reward news game name test', () {
      final String _tGameName = 'Tom Clancy\'s Rainbow Six® Siege';

      expect(tNews.gameName, _tGameName);
    });

    test('reward news platform test', () {
      final String _tPlatform = 'XONE';

      expect(tNews.platform, _tPlatform);
    });

    test('reward news image test', () {
      final String _tImage = 'imageURL';

      expect(tNews.image, _tImage);
    });

    test('reward news reward test', () {
      final RewardQuality _tRewardType = RewardQuality.Legendary;

      expect(tNews.rewardQuality, _tRewardType);
    });

    test('reward news is liked test', () {
      final bool _tIsLiked = false;

      expect(tNews.isLiked, _tIsLiked);
    });

    test('reward news published test', () {
      final DateTime _tPublished = DateTime(2020, 26, 5, 13, 38);

      expect(tNews.published, _tPublished);
    });

    test('full reward news test', () {
      final _tNews = RewardNews(
        id: tId,
        liked: tLiked,
        gameName: tGameName,
        platform: tPlatform,
        image: tImage,
        rewardQuality: tRewardQuality,
        isLiked: tIsLiked,
        published: tPublished,
      );

      expect(tNews, _tNews);
    });

    test('full reward news is not null test', () {
      expect(tNews, isNotNull);
    });
  });
}
