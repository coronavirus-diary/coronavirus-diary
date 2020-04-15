import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/local_statistics/local_statistics.dart';
import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'daily_cases_chart.dart';

class LocalStatisticsScreen extends StatefulWidget {
  static const routeName = '/local-statistics';

  const LocalStatisticsScreen({Key key}) : super(key: key);

  @override
  _LocalStatisticsScreenState createState() => _LocalStatisticsScreenState();
}

class _LocalStatisticsScreenState extends State<LocalStatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (BuildContext context, PreferencesState state) {
        final PreferencesState preferencesState = state;

        return BlocBuilder<LocalStatisticsBloc, LocalStatisticsState>(
          builder: (BuildContext context, LocalStatisticsState state) {
            Widget body;
            if (state is LocalStatisticsNotLoaded ||
                state is LocalStatisticsLoading) {
              if (state is LocalStatisticsNotLoaded) {
                context.bloc<LocalStatisticsBloc>().add(GetLocalStatistics(
                      country: preferencesState.preferences.location.country,
                      zip: preferencesState.preferences.location.postalCode,
                    ));
              }
            } else if (state is LocalStatisticsLoaded) {
              print(state.localStatisticsEntries);
              body = Column(
                children: <Widget>[
                  // TODO: Add totals.
                  DailyCasesChart(
                    localStatisticsEntries: state.localStatisticsEntries,
                  ),
                  // TODO: Add cases/day bar chart.
                ],
              );
            }

            return Scaffold(
              key: ValueKey('localStatisticsScreen'),
              appBar: AppBar(
                title: Text(AppLocalizations.of(context).localStatisticsTitle),
                leading: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                  tooltip: localizations.systemReportBackToHomePage,
                ),
              ),
              body: body,
            );
          },
        );
      },
    );
  }
}
