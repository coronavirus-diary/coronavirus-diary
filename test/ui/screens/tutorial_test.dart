import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/blocs/utils.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
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

    expect(find.text('LEARN MORE'), findsOneWidget);
  });
}

Widget setUpTutorialScreen({
  PreferencesBloc preferences,
  double textScaleFactor = 1.0,
  @required Widget child,
}) {
  preferences ??= PreferencesBloc();
  return MaterialApp(
    home: Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => preferences,
        child: Builder(builder: (BuildContext context) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaleFactor: textScaleFactor),
            child: child,
          );
        }),
      ),
    ),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
  );
}
