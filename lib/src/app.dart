import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/local_statistics/local_statistics.dart';
import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/l10n/country_localizations.dart';
import 'package:covidnearme/src/ui/assets/theme.dart';
import 'package:covidnearme/src/ui/router.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PreferencesBloc>(
      create: (context) {
        return PreferencesBloc();
      },
      child: BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<SymptomReportBloc>(
                create: (BuildContext context) => SymptomReportBloc(
                  preferencesState: state,
                  symptomReportsRepository: SymptomReportsRepository(),
                ),
              ),
              BlocProvider<LocalStatisticsBloc>(
                create: (BuildContext context) => LocalStatisticsBloc(
                  preferencesState: state,
                  localStatisticsRepository: LocalStatisticsRepository(),
                  context: context,
                ),
              ),
            ],
            child: MaterialApp(
              title: 'CovidNearMe',
              theme: appTheme,
              routes: appRoutes,
              initialRoute: getInitialRoute(state),
              localizationsDelegates: AppLocalizations.localizationsDelegates
                  .followedBy([CountryLocalizations.delegate]),
              supportedLocales: AppLocalizations.supportedLocales,
            ),
          );
        },
      ),
    );
  }
}
