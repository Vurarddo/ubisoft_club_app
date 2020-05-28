import 'package:ubisoft_club_app/infrastructure/injector.dart';
import 'package:ubisoft_club_app/infrastructure/store_interactor.dart';
import 'package:ubisoft_club_app/models/profile/profile.dart';

class UserService {
  final _storeInteractor = injector.get<StoreInteractor>();

  Profile _currentProfile;

  Future<Profile> getCurrentUser() async {
    if (_currentProfile == null) {
      _currentProfile = await _storeInteractor.getProfile();
    }
    return _currentProfile;
  }
}
