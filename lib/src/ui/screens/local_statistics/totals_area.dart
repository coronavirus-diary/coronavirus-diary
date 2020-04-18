import 'package:flutter/material.dart';

import 'package:covidnearme/src/data/models/local_statistics.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';

class TotalsArea extends StatelessWidget {
  final LocalStatisticsEntry localStatisticsEntry;

  const TotalsArea({this.localStatisticsEntry});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
        ),
      ),
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TotalsDisplay(
            number: localStatisticsEntry.cases,
            description: localizations.statisticsLabelCases,
            color: Theme.of(context).colorScheme.primary,
          ),
          TotalsDisplay(
            number: localStatisticsEntry.deaths,
            description: localizations.statisticsLabelDeaths,
            color: Theme.of(context).colorScheme.error,
          ),
          TotalsDisplay(
            number: localStatisticsEntry.recoveries,
            description: localizations.statisticsLabelRecoveries,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}

class TotalsDisplay extends StatelessWidget {
  final int number;
  final String description;
  final Color color;

  const TotalsDisplay({
    this.number,
    this.description,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            description,
            style: Theme.of(context).textTheme.overline.copyWith(
                  color: color,
                ),
          ),
          Text(
            number.toString(),
            style: Theme.of(context).textTheme.body2,
          ),
        ],
      ),
    );
  }
}
