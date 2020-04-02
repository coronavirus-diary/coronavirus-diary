import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/blocs/questions/questions_bloc.dart';
import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/blocs/utils.dart';
import 'package:covidnearme/src/data/repositories/questions.dart';
import 'package:covidnearme/src/data/repositories/symptom_reports.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/l10n/app_localizations_en.dart';
import 'package:covidnearme/src/l10n/country_localizations.dart';
import 'package:covidnearme/src/ui/screens/symptom_report/symptom_report.dart';

void main() {
  setUp(() async {
    BlocSupervisor.delegate = await AppHydratedBlocDelegate.build(
        storageDirectory: MemoryFileSystem.test().currentDirectory);
  });

  testWidgets(
      'symptomReportScreen transitions from loading to health symptomReport',
      (tester) async {
    await tester.pumpWidget(setUpSymptomReportScreen());

    // Loading screen
    expect(find.text('Loading your health symptomReport'), findsOneWidget);

    // Finish loading transition.
    await tester.pumpAndSettle();

    expect(find.text("It's time for your symptomReport."), findsOneWidget);
  });

  testWidgets('Cannot advance to the next screen by scrolling', (tester) async {
    const String page1 = "It's time for your symptomReport.";
    const String page2 = "Step 1 of 2";

    await tester.pumpWidget(setUpSymptomReportScreen());
    await tester.pumpAndSettle();

    expect(find.text(page1), findsOneWidget);
    await tester.drag(find.text(page1), Offset(-400, 0));
    await tester.pumpAndSettle();
    expect(find.text(page1), findsOneWidget);
    expect(find.text(page2), findsNothing);
  });

  testWidgets('Can advance to the next screen by clicking button',
      (tester) async {
    const String page1 = "It's time for your symptom report.";
    const String page2 = "Step 1 of 2";

    await tester.pumpWidget(setUpSymptomReportScreen());
    await tester.pumpAndSettle();

    await tester.tap(find.text('START symptomReport'));
    await tester.pumpAndSettle();
    expect(find.text(page1), findsNothing);
    expect(find.text(page2), findsOneWidget);
  });
}

Widget setUpSymptomReportScreen({
  QuestionsBloc questions,
  SymptomReportBloc symptomReport,
  PreferencesBloc preferences,
}) {
  questions ??= QuestionsBloc(
    questionsRepository: QuestionsRepository(),
    localizations: AppLocalizationsEn(),
  );
  symptomReport ??= SymptomReportBloc(
    preferencesState: PreferencesState(preferences: Preferences()),
    symptomReportsRepository: SymptomReportsRepository(),
  );
  preferences ??= PreferencesBloc();
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates
        .followedBy([CountryLocalizations.delegate]),
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => questions,
        child: BlocProvider(
          create: (BuildContext context) => symptomReport,
          child: BlocProvider(
            create: (BuildContext context) => preferences,
            child: SymptomReportScreenBody(),
          ),
        ),
      ),
    ),
  );
}
