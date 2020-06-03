import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/models/user/user.dart';
import 'package:ubisoft_club_app/features/profile/profile_screen_presenter.dart';
import 'package:ubisoft_club_app/features/profile/widgets/widgets.dart';
import 'package:ubisoft_club_app/widgets/background_with_image.dart';
import 'package:ubisoft_club_app/widgets/club_scrollbard.dart';

class ProfileScreen extends StatefulWidget {
  static const _routeName = '/games';

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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      BackgroundWithImage(
                        image: _presenter.fullUser.favoriteGame.image,
                        child: ProfileCard(user: _presenter.fullUser),
                      ),
                      StatisticCard(user: _presenter.fullUser),
                    ],
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
