import 'package:test/test.dart';
import 'package:ubisoft_club_app/models/profile/profile.dart';

import 'package:ubisoft_club_app/models/news/news.dart';

void main() {
  group('congratulatory news class test', () {
    CongratulatoryNews tNews;
    final int tId = 1;
    final int tLiked = 100;
    final int tProgressValue = 200;
    final ChallengeType tChallengeType = ChallengeType.classic;
    final String tImage = 'imageURL';
    final bool tIsLiked = false;
    final DateTime tPublished = DateTime(2020, 26, 5, 13, 38);
    final Profile tAccount = Profile.clubAndNews(
      id: 2,
      name: 'Tom Clancy\'s Rainbow Six® Siege',
      image:
          'https://3dnews.ru/assets/external/illustrations/2020/03/05/1005203/sm.1.750.jpeg',
    );

    setUp(() {
      tNews = CongratulatoryNews(
        id: tId,
        profile: tAccount,
        liked: tLiked,
        progressValue: tProgressValue,
        challengeType: tChallengeType,
        image: tImage,
        isLiked: tIsLiked,
        published: tPublished,
      );
    });

    test('congratulatory news id test', () {
      final int _tId = 1;

      expect(tNews.id, _tId);
    });

    test('congratulatory news account test', () {
      final Profile _tAccount = Profile.clubAndNews(
        id: 2,
        name: 'Tom Clancy\'s Rainbow Six® Siege',
        image:
            'https://3dnews.ru/assets/external/illustrations/2020/03/05/1005203/sm.1.750.jpeg',
      );

      expect(tNews.profile, _tAccount);
    });

    test('congratulatory news liked test', () {
      final int _tLiked = 100;

      expect(tNews.liked, _tLiked);
    });

    test('congratulatory news game name test', () {
      final int _tProgressValue = 200;

      expect(tNews.progressValue, _tProgressValue);
    });

    test('congratulatory news challenge type test', () {
      final ChallengeType _tChallengeType = ChallengeType.classic;

      expect(tNews.challengeType, _tChallengeType);
    });

    test('congratulatory news image test', () {
      final String _tImage = 'imageURL';

      expect(tNews.image, _tImage);
    });

    test('congratulatory news is liked test', () {
      final bool _tIsLiked = false;

      expect(tNews.isLiked, _tIsLiked);
    });

    test('congratulatory news published test', () {
      final DateTime _tPublished = DateTime(2020, 26, 5, 13, 38);

      expect(tNews.published, _tPublished);
    });

    test('full congratulatory news test', () {
      final _tNews = CongratulatoryNews(
        id: tId,
        profile: tAccount,
        liked: tLiked,
        progressValue: tProgressValue,
        challengeType: tChallengeType,
        image: tImage,
        isLiked: tIsLiked,
        published: tPublished,
      );

      expect(tNews, _tNews);
    });

    test('full congratulatory news is not null test', () {
      expect(tNews, isNotNull);
    });
  });
}
