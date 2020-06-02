import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ubisoft_club_app/features/profile/profile_screen_presenter.dart';
import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/models/user/user.dart';

class ProfileScreen extends StatefulWidget {
  static const _routeName = '/games';

  static PageRoute<ProfileScreen> getPageRoute(User profile) {
    final routeSettings = RouteSettings(name: _routeName);

    return MaterialPageRoute(
      settings: routeSettings,
      builder: _builder(profile),
    );
  }

  static WidgetBuilder _builder(User profile) {
    return (context) => ChangeNotifierProvider(
          create: (context) => ProfileScreenPresenter(profile: profile),
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
      body: Center(
        child: _presenter.isLoading
            ? CircularProgressIndicator()
            : Text(_presenter.currentProfile.clubName),
      ),
    );
  }
}
