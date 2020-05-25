import 'package:flutter/foundation.dart';

import 'package:ubisoft_club_app/models/news/news.dart';
import 'package:ubisoft_club_app/models/news/usecases/get_news.dart';

class GeneralScreenPresenter with ChangeNotifier {
  final _getNews = GetNews();
  bool _isLoading = false;

  List<News> _news;

  List<News> get news => _news;

  bool get isLoading => _isLoading;

  GeneralScreenPresenter() {
    _init();
  }

  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();
    try {
      _news = await _getNews();
    } catch (e) {
      print('CelebrityScreenPresenter: _init error $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
