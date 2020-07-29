import 'package:flutter/foundation.dart';

import 'package:ubisoft_club_app/infrastructure/injector/injector.dart';
import 'package:ubisoft_club_app/models/news.dart';
import 'package:ubisoft_club_app/models/user/user.dart';
import 'package:ubisoft_club_app/models/user/user_service.dart';

class GeneralScreenPresenter with ChangeNotifier {
  final _newsFactory = getIt<NewsFactory>();
  bool _isLoading = false;
  User _user;
  List<News> _news;
  String _gameImage;

  bool get isLoading => _isLoading;
  User get user => _user;
  List<News> get news => _news;
  String get gameImage => _gameImage;

  GeneralScreenPresenter() {
    _init();
  }

  Future<void> _init() async {
    _getUserInfo();
    _getNewsList();
  }

  Future<void> _getUserInfo() async {
    _isLoading = true;
    notifyListeners();
    try {
      _user = await getIt<UserService>().getCurrentUser();
      _gameImage = await _user.getFavoriteGameImg();
    } catch (e) {
      print('GeneralScreenPresenter: _init error $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _getNewsList() async {
    _isLoading = true;
    notifyListeners();
    try {
      _news = await _newsFactory.getNews();
    } catch (e) {
      print('GeneralScreenPresenter: _getNewsList error $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
