import 'package:ubisoft_club_app/models/user/user.dart';
import 'package:ubisoft_club_app/infrastructure/injector.dart';
import 'package:ubisoft_club_app/infrastructure/store_interactor.dart';

class UserService {
  final _storeInteractor = injector.get<StoreInteractor>();
  User _currentUser;

  Future<User> getCurrentUser() async {
    if (_currentUser == null) {
      _currentUser = await _storeInteractor.getUser();
    }

    return _currentUser;
  }
}
