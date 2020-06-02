import 'package:ubisoft_club_app/models/user/user.dart';
import 'package:ubisoft_club_app/infrastructure/injector.dart';
import 'package:ubisoft_club_app/infrastructure/store_interactor.dart';

class UserService {
  final _storeInteractor = injector.get<StoreInteractor>();
  final _userFactory = injector.get<UserFactory>();

  User _currentUser;

  Future<User> getCurrentUser() async {
    if (_currentUser == null) {
      // TODO: add real auth data
      final authData = await _storeInteractor.getUser();
      _currentUser = await _userFactory.getUserById(authData.id);
    }

    return _currentUser;
  }
}
