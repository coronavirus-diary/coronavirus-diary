import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/blocs/utils.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/screens/tutorial/steps/consent.dart';
import 'package:covidnearme/src/ui/screens/tutorial/steps/get_started.dart';
import 'package:covidnearme/src/ui/screens/tutorial/steps/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:file/memory.dart';

void main() {
  setUp(() async {
    BlocSupervisor.delegate = await AppHydratedBlocDelegate.build(
        storageDirectory: MemoryFileSystem.test().currentDirectory);
  });

  testWidgets('Tutorial intro step displays learn more button',
      (WidgetTester tester) async {
    await tester.pumpWidget(setUpTutorialScreen(child: IntroStep()));

    expect(find.text('Click here to learn more'), findsOneWidget);
  });

  testWidgets('Tutorial consent step displays yes and no button',
      (WidgetTester tester) async {
    await tester.pumpWidget(setUpTutorialScreen(child: ConsentStep()));

    // Loading screen.
    expect(find.text('Loading...'), findsOneWidget);

    // Finish loading transition.
    await tester.pumpAndSettle();

    expect(find.text('No'), findsOneWidget);
    expect(find.text('I agree'), findsOneWidget);
  });

  testWidgets('Tutorial get_started step displays get started button',
      (WidgetTester tester) async {
    await tester.pumpWidget(setUpTutorialScreen(child: GetStartedStep()));

    expect(find.text('Click here to get started'), findsOneWidget);
  });
}

Widget setUpTutorialScreen({
  PreferencesBloc preferences,
  @required Widget child,
}) {
  preferences ??= PreferencesBloc();
  return MaterialApp(
    home: Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => preferences,
        child: child,
      ),
    ),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
  );
}
