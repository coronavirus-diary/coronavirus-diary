import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coronavirus_diary/src/blocs/preferences/preferences.dart';
import 'package:coronavirus_diary/src/blocs/checkup/checkup.dart';
import 'package:coronavirus_diary/src/blocs/questions/questions.dart';
import 'package:coronavirus_diary/src/data/repositories/checkups.dart';
import 'package:coronavirus_diary/src/data/repositories/questions.dart';
import 'package:coronavirus_diary/src/ui/assets/theme.dart';
import 'package:coronavirus_diary/src/ui/router.dart';

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
        BlocProvider<QuestionsBloc>(
          create: (context) {
            return QuestionsBloc(
              questionsRepository: QuestionsRepository(),
            );
          },
        ),
      ],
      child: BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (context, state) {
          return BlocProvider<CheckupBloc>(
            create: (context) => CheckupBloc(
              preferencesState: state,
              checkupsRepository: CheckupsRepository(),
            ),
            child: MaterialApp(
              title: 'Coronavirus Diary',
              theme: appTheme,
              routes: appRoutes,
              initialRoute: initialRoute,
            ),
          );
        },
      ),
    );
  }
}
