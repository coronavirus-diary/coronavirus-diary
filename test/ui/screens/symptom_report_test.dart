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

  testWidgets('Symptom Report screen transitions from loading to first screen',
      (tester) async {
    await tester.pumpWidget(setUpSymptomReportScreen());

    // Loading screen
    expect(find.byKey(ValueKey("symptomReportIntroStepContinueButton")),
        findsNothing);

    // Finish loading transition.
    await tester.pumpAndSettle();

    expect(find.byKey(ValueKey("symptomReportIntroStepContinueButton")),
        findsOneWidget);
  });

  testWidgets('Cannot advance to the next screen by scrolling', (tester) async {
    const Key page1 = ValueKey("symptomReportIntroStep");
    const Key page2 = ValueKey("symptomReportConsentStep");

    await tester.pumpWidget(setUpSymptomReportScreen());
    await tester.pumpAndSettle();

    expect(find.byKey(page1), findsOneWidget);
    await tester.drag(find.byKey(page1), Offset(-400, 0));
    await tester.pumpAndSettle();
    expect(find.byKey(page1), findsOneWidget);
    expect(find.byKey(page2), findsNothing);
  });

  testWidgets('Can advance to the next screen by clicking button',
      (tester) async {
    const Key page1 = ValueKey("symptomReportIntroStep");
    const Key page2 = ValueKey("symptomReportConsentStep");

    await tester.pumpWidget(setUpSymptomReportScreen());
    await tester.pumpAndSettle();

    await tester
        .tap(find.byKey(ValueKey("symptomReportIntroStepContinueButton")));
    await tester.pumpAndSettle();
    expect(find.byKey(page1), findsNothing);
    expect(find.byKey(page2), findsOneWidget);
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
