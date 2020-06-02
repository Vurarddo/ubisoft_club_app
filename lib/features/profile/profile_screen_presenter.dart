import 'package:flutter/foundation.dart';

import 'package:ubisoft_club_app/infrastructure/injector.dart';
import 'package:ubisoft_club_app/models/user/user.dart';

class ProfileScreenPresenter with ChangeNotifier {
  final User profile;

  final _userFactory = injector.get<UserFactory>();
  bool _isLoading = false;
  User _profile;

  bool get isLoading => _isLoading;

  User get currentProfile => _profile;

  ProfileScreenPresenter({@required this.profile}) : assert(profile != null) {
    _init();
  }

  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();
    try {
      _profile = await _userFactory.getUserById(profile.id);
    } catch (e) {
      print('CelebrityScreenPresenter: _init error $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
