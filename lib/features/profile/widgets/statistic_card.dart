import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/localization.dart';
import 'package:ubisoft_club_app/models/user/user.dart';
import 'package:ubisoft_club_app/features/profile/widgets/statistic_hexagon.dart';

class StatisticCard extends StatelessWidget {
  final User user;

  const StatisticCard({
    Key key,
    @required this.user,
  })  : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle(context),
            _buildStatisticList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final theme = Theme.of(context);
    final localization = UbisoftClubLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 7.0, 0.0, 5.0),
      child: Text(
        localization.clubStatistic,
        style: theme.textTheme.headline6.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildStatisticList() {
    return ListView.builder(
      itemCount: user.statistics.length <= 4 ? user.statistics.length : 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final statistic = user.statistics[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: StatisticHexagon(
              number: statistic.achievementAmount,
            ),
            title: Text(statistic.achievementTitle),
          ),
        );
      },
    );
  }
}
