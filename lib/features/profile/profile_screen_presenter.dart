import 'package:flutter/foundation.dart';

import 'package:ubisoft_club_app/models/user/user.dart';
import 'package:ubisoft_club_app/models/user/usecases/get_user_by_id.dart';

class ProfileScreenPresenter with ChangeNotifier {
  final User profile;
  final _getProfile = GetProfileById();
  User _profile;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  User get currentProfile => _profile;

  ProfileScreenPresenter({@required this.profile}) : assert(profile != null) {
    _init();
  }

  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();
    try {
      _profile = await _getProfile(profile.id);
    } catch (e) {
      print('CelebrityScreenPresenter: _init error $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
