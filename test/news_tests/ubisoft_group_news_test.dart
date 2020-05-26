import 'package:test/test.dart';

import 'package:ubisoft_club_app/models/news/news.dart';

void main() {
  group('ubisoft group news class test', () {
    UbisoftGroupNews tNews;
    final int tId = 1;
    final int tLiked = 100;
    final String tNewsTitle = 'The Grand Larceny was stated';
    final String tImage = 'imageURL';
    final bool tIsLiked = false;
    final DateTime tPublished = DateTime(2020, 26, 5, 13, 38);

    setUp(() {
      tNews = UbisoftGroupNews(
        id: tId,
        liked: tLiked,
        image: tImage,
        title: tNewsTitle,
        isLiked: tIsLiked,
        published: tPublished,
      );
    });

    test('ubisoft group news id test', () {
      final int _tId = 1;

      expect(tNews.id, _tId);
    });

    test('ubisoft group news liked test', () {
      final int _tLiked = 100;

      expect(tNews.liked, _tLiked);
    });

    test('ubisoft group news title test', () {
      final String _tNewsTitle = 'The Grand Larceny was stated';

      expect(tNews.title, _tNewsTitle);
    });

    test('ubisoft group news image test', () {
      final String _tImage = 'imageURL';

      expect(tNews.image, _tImage);
    });

    test('ubisoft group news is liked test', () {
      final bool _tIsLiked = false;

      expect(tNews.isLiked, _tIsLiked);
    });

    test('ubisoft group news published test', () {
      final DateTime _tPublished = DateTime(2020, 26, 5, 13, 38);

      expect(tNews.published, _tPublished);
    });

    test('full ubisoft group news test', () {
      final _tNews = UbisoftGroupNews(
        id: tId,
        liked: tLiked,
        image: tImage,
        title: tNewsTitle,
        isLiked: tIsLiked,
        published: tPublished,
      );

      expect(tNews, _tNews);
    });

    test('full company news is not null test', () {
      expect(tNews, isNotNull);
    });
  });
}
