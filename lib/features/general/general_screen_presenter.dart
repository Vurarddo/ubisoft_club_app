import 'package:flutter/foundation.dart';

import 'package:ubisoft_club_app/infrastructure/injector.dart';
import 'package:ubisoft_club_app/models/news/news.dart';
import 'package:ubisoft_club_app/models/user/user.dart';
import 'package:ubisoft_club_app/models/news/usecases/get_news.dart';
import 'package:ubisoft_club_app/models/user/user_service.dart';

class GeneralScreenPresenter with ChangeNotifier {
  final _getNews = GetNews();
  bool _isLoading = false;

  User _profile;
  List<News> _news;

  User get profile => _profile;
  List<News> get news => _news;

  bool get isLoading => _isLoading;

  GeneralScreenPresenter() {
    _init();
  }

  Future<void> _init() async {
    _getProfileInfo();
    _getNewsList();
  }

  Future<void> _getProfileInfo() async {
    _isLoading = true;
    notifyListeners();
    try {
      _profile = await injector.get<UserService>().getCurrentUser();
    } catch (e) {
      print('CelebrityScreenPresenter: _init error $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _getNewsList() async {
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
