import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ubisoft_club_app/features/general/general_screen_presenter.dart';
import 'package:ubisoft_club_app/features/general/widgets/widgets.dart';
import 'package:ubisoft_club_app/features/settings/settings_screen.dart';
import 'package:ubisoft_club_app/models/news/news.dart';
import 'package:ubisoft_club_app/widgets/background_with_image.dart';

class GeneralScreen extends StatefulWidget {
  static const _routeName = '/general';

  static PageRoute<GeneralScreen> getPageRoute() {
    final routeSettings = RouteSettings(name: _routeName);

    if (Platform.isIOS) {
      CupertinoPageRoute(
        settings: routeSettings,
        builder: _builder,
      );
    }

    return MaterialPageRoute(
      settings: routeSettings,
      builder: _builder,
    );
  }

  static Widget _builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GeneralScreenPresenter(),
      child: GeneralScreen(),
    );
  }

  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen>
    with WidgetsBindingObserver {
  GeneralScreenPresenter get _presenter =>
      Provider.of<GeneralScreenPresenter>(context);
  ThemeData get _theme => Theme.of(context);
  String logo = _getLogo();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {
      logo = _getLogo();
    });
    super.didChangePlatformBrightness();
  }

  static String _getLogo() {
    return window.platformBrightness == Brightness.light
        ? 'assets/images/ubisoft_club_white.png'
        : 'assets/images/ubisoft_club_orange.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _theme.dividerColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
          height: 40,
          child: Image.asset(
            logo,
            fit: BoxFit.fitHeight,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 30.0,
            ),
            onPressed: () {
              // TODO: add navigation
              Navigator.of(context).push(SettingsScreen.getPageRoute());
            },
          )
        ],
      ),
      body: !_presenter.isLoading
          ? ListView.builder(
              itemCount: _presenter.news.length,
              itemBuilder: (context, index) {
                final profile = _presenter.profile;
                final news = _presenter.news[index];
                final isFirst = _presenter.news.first == news;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (isFirst) ...{
                      BackgroundWithImage(
                        image: profile.favoriteGame.image,
                        child: GeneralProfileCard(profile: profile),
                      ),
                    },
                    _buildNewsCard(news),
                  ],
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget _buildNewsCard(News news) {
    if (news is GameProgressNews) {
      return GameProgressNewsCard(news: news);
    } else if (news is RewardNews) {
      return RewardNewsCard(news: news);
    } else if (news is ClubNews) {
      return ClubNewsCard(news: news);
    }
    return CongratulatoryNewsCard(news: news);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
