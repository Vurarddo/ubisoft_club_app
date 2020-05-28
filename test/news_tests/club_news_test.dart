import 'package:test/test.dart';
import 'package:ubisoft_club_app/models/profile/profile.dart';

import 'package:ubisoft_club_app/models/news/news.dart';

void main() {
  group('club news class test', () {
    ClubNews tNews;
    final int tId = 1;
    final int tLiked = 100;
    final String tNewsTitle = 'The Grand Larceny was stated';
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
      tNews = ClubNews(
        id: tId,
        profile: tAccount,
        liked: tLiked,
        image: tImage,
        title: tNewsTitle,
        isLiked: tIsLiked,
        published: tPublished,
      );
    });

    test('club news id test', () {
      final int _tId = 1;

      expect(tNews.id, _tId);
    });

    test('club news account test', () {
      final Profile _tAccount = Profile.clubAndNews(
        id: 2,
        name: 'Tom Clancy\'s Rainbow Six® Siege',
        image:
        'https://3dnews.ru/assets/external/illustrations/2020/03/05/1005203/sm.1.750.jpeg',
      );

      expect(tNews.profile, _tAccount);
    });

    test('club news liked test', () {
      final int _tLiked = 100;

      expect(tNews.liked, _tLiked);
    });

    test('club news title test', () {
      final String _tNewsTitle = 'The Grand Larceny was stated';

      expect(tNews.title, _tNewsTitle);
    });

    test('club news image test', () {
      final String _tImage = 'imageURL';

      expect(tNews.image, _tImage);
    });

    test('club news is liked test', () {
      final bool _tIsLiked = false;

      expect(tNews.isLiked, _tIsLiked);
    });

    test('club news published test', () {
      final DateTime _tPublished = DateTime(2020, 26, 5, 13, 38);

      expect(tNews.published, _tPublished);
    });

    test('full club news test', () {
      final _tNews = ClubNews(
        id: tId,
        profile: tAccount,
        liked: tLiked,
        image: tImage,
        title: tNewsTitle,
        isLiked: tIsLiked,
        published: tPublished,
      );

      expect(tNews, _tNews);
    });

    test('full club is not null test', () {
      expect(tNews, isNotNull);
    });
  });
}
