import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:covidnearme/src/blocs/local_statistics/local_statistics.dart';
import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/router.dart';
import 'package:covidnearme/src/ui/screens/local_statistics/daily_case_chart.dart';
import 'package:covidnearme/src/ui/screens/local_statistics/totals_area.dart';
import 'package:covidnearme/src/ui/widgets/loading_indicator.dart';

class LocalStatisticsScreen extends StatefulWidget {
  static const routeName = '/local-statistics';

  const LocalStatisticsScreen({Key key}) : super(key: key);

  @override
  _LocalStatisticsScreenState createState() => _LocalStatisticsScreenState();
}

class _LocalStatisticsScreenState extends State<LocalStatisticsScreen> {
  ValueNotifier<LocalStatisticsEntry> _selectedEntry;

  @override
  void initState() {
    super.initState();
    _selectedEntry = ValueNotifier(null);
  }

  Location _getSelectedLocation(PreferencesState preferencesState) {
    if (preferencesState
        .preferences.recentLocalStatisticsLocations.isNotEmpty) {
      return preferencesState
          .preferences.recentLocalStatisticsLocations[0].location;
    } else if (preferencesState.preferences.location != null) {
      return preferencesState.preferences.location;
    } else {
      return null;
    }
  }

  void _onDateSelected(
    charts.SelectionModel model,
    LocalStatisticsLoaded localStatisticsState,
  ) {
    final selectedDatum = model.selectedDatum;
    if (selectedDatum.isNotEmpty) {
      _selectedEntry.value = localStatisticsState
          .localStatisticsResponse.localStatisticsEntries
          .firstWhere((e) => e.date == selectedDatum.first.datum.date);
    }
  }

  List<Widget> _getBodyWidgets(
    LocalStatisticsState localStatisticsState,
    LocalStatisticsEntry selectedEntry,
  ) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    switch (localStatisticsState.runtimeType) {
      case LocalStatisticsNotLoaded:
        return [
          Expanded(
            child: Center(
              child: LoadingIndicator(),
            ),
          )
        ];
      case LocalStatisticsLoading:
        return [
          Expanded(
            child: Center(
              child: LoadingIndicator(),
            ),
          )
        ];
      case LocalStatisticsError:
        return [
          Expanded(
            child: Center(
              child: Text(localizations.localStatisticsNoDataAvailable),
            ),
          )
        ];
      case LocalStatisticsLoaded:
        return [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DailyCaseChart(
                localStatisticsEntries:
                    (localStatisticsState as LocalStatisticsLoaded)
                        .localStatisticsResponse
                        .localStatisticsEntries,
                onDateSelected: (charts.SelectionModel model) =>
                    _onDateSelected(model, localStatisticsState),
              ),
            ),
          ),
          TotalsArea(
            localStatisticsEntry: selectedEntry,
          ),
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (BuildContext context, PreferencesState state) {
        final PreferencesState preferencesState = state;

        return BlocBuilder<LocalStatisticsBloc, LocalStatisticsState>(
          builder: (BuildContext context, LocalStatisticsState state) {
            final Location selectedLocation =
                _getSelectedLocation(preferencesState);
            if (state is LocalStatisticsNotLoaded) {
              // Prompt user to enter location if it is not found
              if (selectedLocation != null) {
                context.bloc<LocalStatisticsBloc>().add(GetLocalStatistics(
                      location: selectedLocation,
                    ));
              }
            }
            if (state is LocalStatisticsLoaded) {
              _selectedEntry.value =
                  state.localStatisticsResponse.localStatisticsEntries[0];
            } else {
              _selectedEntry.value = null;
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
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.history),
                    onPressed: () => {},
                  ),
                ],
              ),
              body: ValueListenableBuilder<LocalStatisticsEntry>(
                valueListenable: _selectedEntry,
                builder: (context, selectedEntry, child) {
                  return Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).dividerColor,
                              width: 1,
                            ),
                          ),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          title: selectedEntry != null
                              ? Text(
                                  selectedEntry.name,
                                  style: Theme.of(context).textTheme.subhead,
                                )
                              : null,
                          subtitle: selectedEntry != null
                              ? Text(
                                  DateFormat.yMMMd().format(selectedEntry.date),
                                  style: Theme.of(context).textTheme.caption)
                              : null,
                          trailing: IconButton(
                            onPressed: () => Navigator.pushNamed(
                              context,
                              LocalStatisticsLocationScreen.routeName,
                            ),
                            icon: Icon(Icons.edit),
                          ),
                        ),
                      ),
                      ..._getBodyWidgets(state, selectedEntry),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
