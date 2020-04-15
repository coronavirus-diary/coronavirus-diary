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
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TotalsDisplay(
            number: localStatisticsEntry.cases,
            description: localizations.statisticsLabelCases,
            color: Colors.blue,
          ),
          TotalsDisplay(
            number: localStatisticsEntry.deaths,
            description: localizations.statisticsLabelDeaths,
            color: Colors.red,
          ),
          TotalsDisplay(
            number: localStatisticsEntry.recoveries,
            description: localizations.statisticsLabelRecoveries,
            color: Colors.green,
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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            number.toString(),
            style: Theme.of(context).textTheme.display1.copyWith(
                  color: color,
                ),
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.body1,
          ),
        ],
      ),
    );
  }
}
