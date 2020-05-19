import 'package:flutter/material.dart';

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
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 10.0),
          child:
              Text('The Grand Larceny: 50% еженедельных испытаний завершено'),
        ),
        Stack(
          children: <Widget>[
            Image.asset('assets/images/game_image.jpg'),
            Positioned(
              top: 35,
              right: MediaQuery.of(context).size.width / 3,
              child: SizedBox.fromSize(
                size: Size.square(120),
                child: CircleProgressBar(
                  progressValue: .6,
                  foregroundColor: Colors.red,
                  backgroundColor: theme.unselectedWidgetColor,
                ),
              ),
            ),
          ],
        ),
      ],
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
