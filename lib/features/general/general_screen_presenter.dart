import 'package:flutter/foundation.dart';

import 'package:ubisoft_club_app/infrastructure/injector.dart';
import 'package:ubisoft_club_app/models/news.dart';
import 'package:ubisoft_club_app/models/user/user.dart';
import 'package:ubisoft_club_app/models/user/user_service.dart';

class GeneralScreenPresenter with ChangeNotifier {
  final _newsFactory = injector.get<NewsFactory>();
  bool _isLoading = false;
  User _user;
  List<News> _news;

  User get profile => _user;
  List<News> get news => _news;

  bool get isLoading => _isLoading;

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
      _user = await injector.get<UserService>().getCurrentUser();
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
      _news = await _newsFactory.getNews();
    } catch (e) {
      print('CelebrityScreenPresenter: _init error $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
