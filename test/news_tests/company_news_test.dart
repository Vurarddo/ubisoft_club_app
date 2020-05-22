import 'package:test/test.dart';

import 'package:ubisoft_club_app/models/news.dart';

void main() {
  group('company news class test', () {
    News tNews;
    final int tId = 1;
    final int tLiked = 100;
    final String tNewsTitle = 'The Grand Larceny was stated';
    final String tImage = 'imageURL';
    final bool tIsLiked = false;

    setUp(() {
      tNews = News.company(
        id: tId,
        liked: tLiked,
        image: tImage,
        newsTitle: tNewsTitle,
        isLiked: tIsLiked,
      );
    });

    test('company news id test', () {
      final int _tId = 1;

      expect(tNews.id, _tId);
    });

    test('company news liked test', () {
      final int _tLiked = 100;

      expect(tNews.liked, _tLiked);
    });

    test('company news title test', () {
      final String _tNewsTitle = 'The Grand Larceny was stated';

      expect(tNews.newsTitle, _tNewsTitle);
    });

    test('company news image test', () {
      final String _tImage = 'imageURL';

      expect(tNews.image, _tImage);
    });

    test('comapny news is liked test', () {
      final bool _tIsLiked = false;

      expect(tNews.isLiked, _tIsLiked);
    });

    test('full company news test', () {
      final _tNews = News.company(
        id: tId,
        liked: tLiked,
        image: tImage,
        newsTitle: tNewsTitle,
        isLiked: tIsLiked,
      );

      expect(tNews, _tNews);
    });

    test('full company news is not null test', () {
      expect(tNews, isNotNull);
    });
  });
}
