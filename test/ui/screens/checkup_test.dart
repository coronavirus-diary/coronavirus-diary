import 'package:covidnearme/src/blocs/checkup/checkup.dart';
import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/blocs/questions/questions_bloc.dart';
import 'package:covidnearme/src/blocs/utils.dart';
import 'package:covidnearme/src/data/repositories/checkups.dart';
import 'package:covidnearme/src/data/repositories/questions.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/screens/checkup/checkup.dart';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    BlocSupervisor.delegate = await AppHydratedBlocDelegate.build(
        storageDirectory: MemoryFileSystem.test().currentDirectory);
  });

  testWidgets('CheckupScreen transitions from loading to health checkup',
      (tester) async {
    await tester.pumpWidget(setUpCheckupScreen());

    // Loading screen
    expect(find.text('Loading your health checkup'), findsOneWidget);

    // Finish loading transition.
    await tester.pumpAndSettle();

    expect(find.text("It's time for your checkup."), findsOneWidget);
  });

  testWidgets('Cannot advance to the next screen by scrolling', (tester) async {
    const String page1 = "It's time for your checkup.";
    const String page2 = "Step 1 of 2";

    await tester.pumpWidget(setUpCheckupScreen());
    await tester.pumpAndSettle();

    expect(find.text(page1), findsOneWidget);
    await tester.drag(find.text(page1), Offset(-400, 0));
    await tester.pumpAndSettle();
    expect(find.text(page1), findsOneWidget);
    expect(find.text(page2), findsNothing);

    await tester.tap(find.text('START CHECKUP'));
    await tester.pumpAndSettle();
    expect(find.text(page1), findsNothing);
    expect(find.text(page2), findsOneWidget);
  });
}

Widget setUpCheckupScreen({
  QuestionsBloc questions,
  CheckupBloc checkup,
  PreferencesBloc preferences,
}) {
  questions ??= QuestionsBloc(questionsRepository: QuestionsRepository());
  checkup ??= CheckupBloc(
    preferencesState: PreferencesState(preferences: Preferences()),
    checkupsRepository: CheckupsRepository(),
  );
  preferences ??= PreferencesBloc();
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => questions,
        child: BlocProvider(
          create: (BuildContext context) => checkup,
          child: BlocProvider(
            create: (BuildContext context) => preferences,
            child: CheckupScreen(),
          ),
        ),
      ),
    ),
  );
}
