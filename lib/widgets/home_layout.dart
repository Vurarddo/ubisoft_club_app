import 'dart:async';

import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/features/general/general_screen.dart';
import 'package:ubisoft_club_app/features/games/games_screen.dart';
import 'package:ubisoft_club_app/features/sam_bot/sam_screen.dart';
import 'package:ubisoft_club_app/widgets/custom_bottom_app_bar.dart';
import 'package:ubisoft_club_app/widgets/waves.dart';

enum NavigatorType {
  general,
  games,
}

class HomeLayout extends StatefulWidget {
  static const routeName = '/';
  static PageRoute<HomeLayout> getRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) {
        return HomeLayout();
      },
    );
  }

  HomeLayout({
    Key key,
  }) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final navigators = Map<NavigatorType, GlobalKey<NavigatorState>>();
  final routeGenerators = Map<NavigatorType, RouteFactory>();
  final observers = Map<NavigatorType, List<NavigatorObserver>>();

  NavigatorType currentTab = NavigatorType.general;

  @override
  void initState() {
    NavigatorType.values.forEach(
      (type) {
        navigators[type] = GlobalKey<NavigatorState>();
        observers[type] = [HeroController()];
      },
    );

    routeGenerators[NavigatorType.general] = generalOnGenerate;
    routeGenerators[NavigatorType.games] = gamesOnGenerate;

    super.initState();
  }

  Route<dynamic> generalOnGenerate(RouteSettings settings) {
    return GeneralScreen.getPageRoute();
  }

  Route<dynamic> gamesOnGenerate(RouteSettings settings) {
    return GamesScreen.getPageRoute();
  }

  void onChangeTab(int index) {
    setState(() {
      currentTab = NavigatorType.values[index];
    });
  }

  Future<bool> onWillPop() async {
    final result = await navigators[currentTab].currentState.maybePop();
    return !result;
  }

  @override
  Widget build(BuildContext context) {
    final localizations = UbisoftClubLocalizations.of(context);
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
//        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: [
            Offstage(
              offstage: currentTab != NavigatorType.general,
              child: Navigator(
                key: navigators[NavigatorType.general],
                onGenerateRoute: routeGenerators[NavigatorType.general],
                observers: observers[NavigatorType.general],
              ),
            ),
            Offstage(
              offstage: currentTab != NavigatorType.games,
              child: Navigator(
                key: navigators[NavigatorType.games],
                onGenerateRoute: routeGenerators[NavigatorType.games],
                observers: observers[NavigatorType.games],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 83),
              child: Waves(
                color: theme.secondaryHeaderColor,
                height: 15.0,
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          heroTag: 'sam_bot',
          child: Icon(Icons.android, size: 30.0),
          onPressed: () {
            Navigator.of(context).push(SamScreen.getPageRoute());
          },
        ),

        bottomNavigationBar: CustomBottomAppBar(
          shape: CircularNotchedRectangle(),
          onTabSelected: onChangeTab,
          currentIndex: NavigatorType.values.indexOf(currentTab),
          selectedColor: theme.accentColor,
          color: theme.disabledColor,
          items: [
            CustomBottomAppBarItem(
              icon: Icons.home,
              title: localizations.general,
            ),
            CustomBottomAppBarItem(
              icon: Icons.videogame_asset,
              title: localizations.games,
            ),
          ],
        ),
      ),
    );
  }
}
