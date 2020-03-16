import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/preferences/preferences.dart';
import 'ui/router.dart';

class DiaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PreferencesBloc>(
          create: (context) {
            return PreferencesBloc();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Coronavirus Diary',
        routes: appRoutes,
        initialRoute: initialRoute,
      ),
    );
  }
}
