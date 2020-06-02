import 'package:ubisoft_club_app/infrastructure/injector.dart';
import 'package:ubisoft_club_app/models/user/user.dart';

class GetProfileById {
  final _profileRepo = injector.get<UserRepo>();

  GetProfileById();

  Future<User> call(int id) async {
    return _profileRepo.getUserById(id);
  }
}
