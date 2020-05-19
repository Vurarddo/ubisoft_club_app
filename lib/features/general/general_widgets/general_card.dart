import 'dart:math';

import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/theme/colors.dart';
import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/widgets/circular_progress_bar.dart';

class GeneralCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.cardColor,
      padding: EdgeInsets.only(top: 12.0),
      child: Column(
        children: <Widget>[
          _buildProfileListTile(context),
          _buildDivider(),
          GestureDetector(
            onTap: () {
              // TODO: add navigation
            },
            child: _buildGameCard(context),
          ),
          _buildAddToFavoriteTile(context),
        ],
      ),
    );
  }

  Widget _buildProfileListTile(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: () {
        // TODO: add navigation
      },
      leading: SizedBox.fromSize(
        size: Size.square(50),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset('assets/images/avatar.jpg'),
        ),
      ),
      title: Text(
        'VladOS',
        style: theme.textTheme.subhead.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '2 hours ago',
            style: theme.textTheme.caption,
          ),
          Text(
            'Tom Clancy\'s Rainbow Six Siege',
            style: theme.textTheme.caption,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      indent: 16,
      endIndent: 16,
      thickness: 1,
      height: 20,
    );
  }

  Widget _buildGameCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 10.0),
          child:
              Text('The Grand Larceny: 50% еженедельных испытаний завершено'),
        ),
        _buildImageWithProgressBar(context),
      ],
    );
  }

  Widget _buildImageWithProgressBar(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.unselectedWidgetColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.dstATop,
          ),
          image: AssetImage(
            'assets/images/game_image.jpg',
          ),
        ),
      ),
      child: SizedBox.fromSize(
        size: Size.square(120),
        child: CircleProgressBar(
          progressValue: 64,
          backgroundColor: theme.unselectedWidgetColor,
          gradient: SweepGradient(
            colors: [cyanColor, darkCyanColor],
            startAngle: 2.9 * pi / 2,
            endAngle: 7.1 * pi / 2,
            tileMode: TileMode.repeated,
          ),
          completeGradient: LinearGradient(
            colors: [Colors.green[300], Colors.green],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }

  Widget _buildAddToFavoriteTile(BuildContext context) {
    final localization = UbisoftClubLocalizations.of(context);
    final theme = Theme.of(context);

    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: theme.highlightColor,
          ),
          onPressed: () {
            // TODO: add action
          },
        ),
        Text(localization.like),
      ],
    );
  }
}
