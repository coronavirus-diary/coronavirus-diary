import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/blocs/checkup/checkup.dart';
import 'package:covidnearme/src/data/repositories/checkups.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
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
          return BlocProvider<CheckupBloc>(
            create: (context) => CheckupBloc(
              preferencesState: state,
              checkupsRepository: CheckupsRepository(),
            ),
            child: MaterialApp(
              title: 'CovidNearMe',
              theme: appTheme,
              routes: appRoutes,
              initialRoute: getInitialRoute(state),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            ),
          );
        },
      ),
    );
  }
}
