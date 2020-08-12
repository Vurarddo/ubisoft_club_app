// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/get_it_helper.dart';

import '../../models/models.dart';
import '../../models/news.dart';
import '../../models/user/user.dart';
import '../../models/user/user_service.dart';
import '../../repos/news_repo/http_news_repo.dart';
import '../../repos/user_repo/http_user_repo.dart';
import '../store_interactor.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

void $initGetIt(GetIt g, {String environment}) {
  final gh = GetItHelper(g, environment);

  // Eager singletons must be registered in the right order
  gh.singleton<NewsRepo>(HttpNewsRepo());
  gh.singleton<StoreInteractor>(StoreInteractor());
  gh.singleton<UserRepo>(HttpUserRepo());
  gh.singleton<UserService>(UserService());
  gh.singleton<NewsFactory>(NewsFactory(g<NewsRepo>()));
  gh.singleton<UserFactory>(UserFactory(g<UserRepo>()));
}
