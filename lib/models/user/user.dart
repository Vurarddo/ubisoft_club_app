import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:ubisoft_club_app/infrastructure/injector.dart';

abstract class UserRepo {
  Future<User> getUserById(int id);

  Future<User> getFullUser(User user);
}

enum UserType { profile, clubAndNews }

class UserFactory {
  final UserRepo _userRepo;

  Future<User> getUserById(int id) {
    return _userRepo.getUserById(id);
  }

  Future<User> getFullUser(User user) async {
    return _userRepo.getFullUser(user);
  }

  UserFactory() : _userRepo = injector.get<UserRepo>();
}

class User extends Equatable {
  final int id;
  final String clubName;
  final String platformName;
  final String image;
  final int lvl;
  final int clubUnits;
  final DateTime registerDate;
  final List<UserStatistic> statistic;
  final List<Game> games;
  final Game favoriteGame;
  final UserType accountType;

  User._({
    this.id,
    this.clubName,
    this.platformName,
    this.image,
    this.lvl,
    this.clubUnits,
    this.registerDate,
    this.statistic,
    this.games,
    this.favoriteGame,
    this.accountType,
  });

  factory User.mergeInfFull(User source, User user) {
    return User._(
      id: source.id ?? user.id,
      clubName: source.clubName ?? user.clubName,
      platformName: source.platformName ?? user.platformName,
      image: source.image ?? user.image,
      lvl: source.lvl ?? user.lvl,
      clubUnits: source.clubUnits ?? user.clubUnits,
      registerDate: source.registerDate ?? user.registerDate,
      statistic: source.statistic ?? user.statistic,
      games: source.games ?? user.games,
      favoriteGame: source.favoriteGame ?? user.favoriteGame,
      accountType: user.accountType,
    );
  }

  factory User.user({
    @required int id,
    @required String clubName,
    @required String platformName,
    @required String image,
    @required int lvl,
    @required int clubUnits,
    @required DateTime registerDate,
    @required List<UserStatistic> statistic,
    @required List<Game> games,
    @required Game favoriteGame,
  }) {
    return User._(
      id: id,
      clubName: clubName,
      platformName: platformName,
      image: image,
      lvl: lvl,
      clubUnits: clubUnits,
      registerDate: registerDate,
      statistic: statistic,
      games: games,
      favoriteGame: favoriteGame,
      accountType: UserType.profile,
    );
  }

  factory User.clubAndNews({
    @required int id,
    @required String name,
    @required String image,
  }) {
    return User._(
      id: id,
      clubName: name,
      image: image,
      accountType: UserType.clubAndNews,
    );
  }

  @override
  List<Object> get props => [
        id,
        clubName,
        platformName,
        image,
        lvl,
        clubUnits,
        registerDate,
        statistic,
        games,
        favoriteGame,
      ];
}

class UserStatistic extends Equatable {
  final int achievementAmount;
  final String achievementTitle;

  UserStatistic({
    @required this.achievementAmount,
    @required this.achievementTitle,
  })  : assert(achievementAmount != null),
        assert(achievementTitle != null);

  @override
  List<Object> get props => [achievementAmount, achievementTitle];
}

class Game extends Equatable {
  final int id;
  final String title;
  final String image;
  final String platform;

  Game({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.platform,
  })  : assert(id != null),
        assert(title != null),
        assert(image != null),
        assert(platform != null);

  @override
  List<Object> get props => [
        id,
        title,
        image,
        platform,
      ];
}
