import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'blocs/activity/activity.dart';
import 'blocs/preferences/preferences.dart';
import 'data/database/database.dart';
import 'ui/router.dart';
import 'utils/geofencing.dart';

class DiaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AppDatabase>(
      create: (context) => AppDatabase(),
      dispose: (context, db) => db.close(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PreferencesBloc>(
            create: (context) {
              return PreferencesBloc();
            },
          ),
          BlocProvider<ActivityBloc>(
            create: (context) {
              return ActivityBloc(
                database: Provider.of<AppDatabase>(
                  context,
                  listen: false,
                ),
              );
            },
          ),
        ],
        child: BlocBuilder<PreferencesBloc, PreferencesState>(
          builder: (context, state) {
            initGeofencing(state, context.bloc<ActivityBloc>());
            return MaterialApp(
              title: 'Coronavirus Diary',
              routes: appRoutes,
              initialRoute: initialRoute,
            );
          },
        ),
      ),
    );
  }
}
