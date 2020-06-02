import 'package:ubisoft_club_app/infrastructure/injector.dart';
import 'package:ubisoft_club_app/models/news/news.dart';

class GetNews {
  final _newsRepo = injector.get<NewsRepo>();

  GetNews();

  Future<List<News>> call() async {
    return await _newsRepo.getNews();
  }
}