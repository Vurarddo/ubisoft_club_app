import 'package:injectable/injectable.dart';

import 'package:ubisoft_club_app/models/user/user.dart';
import 'package:ubisoft_club_app/infrastructure/injector/injector.dart';
import 'package:ubisoft_club_app/infrastructure/store_interactor.dart';

@singleton
class UserService {
  final _storeInteractor = getIt<StoreInteractor>();
  final _userFactory = getIt<UserFactory>();

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
