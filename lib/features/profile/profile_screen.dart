import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/models/user/user.dart';
import 'package:ubisoft_club_app/features/profile/profile_screen_presenter.dart';
import 'package:ubisoft_club_app/features/profile/widgets/widgets.dart';
import 'package:ubisoft_club_app/widgets/background_with_image.dart';
import 'package:ubisoft_club_app/widgets/club_scrollbard.dart';
import 'package:ubisoft_club_app/widgets/platform_title.dart';

class ProfileScreen extends StatefulWidget {
  static const _routeName = '/profile';

  static PageRoute<ProfileScreen> getPageRoute(User user) {
    final routeSettings = RouteSettings(name: _routeName);

    return MaterialPageRoute(
      settings: routeSettings,
      builder: _builder(user),
    );
  }

  static WidgetBuilder _builder(User user) {
    return (context) => ChangeNotifierProvider(
          create: (context) => ProfileScreenPresenter(user: user),
          child: ProfileScreen(),
        );
  }

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenPresenter get _presenter =>
      Provider.of<ProfileScreenPresenter>(context);

  @override
  Widget build(BuildContext context) {
    final localization = UbisoftClubLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(localization.profile),
      ),
      body: !_presenter.isLoading
          ? ClubScrollbar(
              child: ListView(
                children: <Widget>[
                  BackgroundWithImage(
                    image: _presenter.favoriteGameImg,
                    child: ProfileCard(
                      user: _presenter.fullUser,
                      isLoggedInUser: _presenter.isLoggedIn,
                    ),
                  ),
                  StatisticCard(user: _presenter.fullUser),
                  _buildGameInfo(),
                  _buildGamesList(),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget _buildGameInfo() {
    final localization = UbisoftClubLocalizations.of(context);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              localization.games,
              style: theme.textTheme.headline6.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.videogame_asset),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '  ${localization.purchasedGames}: ',
                        style: theme.textTheme.bodyText2,
                      ),
                      TextSpan(
                        text: '${_presenter.games.length}',
                        style: theme.textTheme.bodyText2.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.filter_list),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '  ${_presenter.platforms.length} ',
                      style: theme.textTheme.bodyText2.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: localization.platform(_presenter.platforms.length),
                      style: theme.textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              Wrap(
                children: _presenter.platforms.map((platform) {
                  return PlatformTitle(platform: platform);
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGamesList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _presenter.games.length,
      itemBuilder: (context, index) {
        final game = _presenter.games[index];
        final userGamesActivity = _presenter.userGamesActivity[index];
        return UserGameCard(
          game: game,
          userGamesActivity: userGamesActivity,
        );
      },
    );
  }
}
