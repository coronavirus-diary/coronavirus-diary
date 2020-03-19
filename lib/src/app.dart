import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coronavirus_diary/src/blocs/preferences/preferences.dart';
import 'package:coronavirus_diary/src/blocs/questions/questions.dart';
import 'package:coronavirus_diary/src/data/repositories/questions.dart';
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
          return MaterialApp(
            title: 'Coronavirus Diary',
            routes: appRoutes,
            initialRoute: initialRoute,
          );
        },
      ),
    );
  }
}
