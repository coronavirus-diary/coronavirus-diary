import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/blocs/utils.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/screens/tutorial/steps/consent.dart';
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

  testWidgets('Tutorial consent step displays correctly',
      (WidgetTester tester) async {
    // Displays Yes/No buttons.
    await tester.pumpWidget(Container());
    await tester.pumpWidget(setUpTutorialScreen(child: ConsentStep()));

    // Loading screen.
    expect(find.text('Loading...'), findsOneWidget);

    // Finish loading transition.
    await tester.pumpAndSettle();

    expect(find.text('NO'), findsOneWidget);
    expect(find.text('I AGREE'), findsOneWidget);

    // Doesn't have large text at a text scale factor of 1.0.
    await tester.pumpWidget(
      setUpTutorialScreen(
        child: ConsentStep(),
        textScaleFactor: 1.0,
      ),
    );

    // Finish loading transition.
    await tester.pumpAndSettle();

    // 200 is relatively arbitrary limit, but works with the current text.
    expect(find.byElementPredicate((Element element) {
      return (element.widget.runtimeType == RichText &&
          (element.widget as RichText)
              .text
              .toPlainText()
              .contains('COVID-19') &&
          element.size.height < 200);
    }), findsWidgets);

    // Does have large text at a text scale factor of 3.0.
    await tester.pumpWidget(
      setUpTutorialScreen(
        child: ConsentStep(),
        textScaleFactor: 3.0,
      ),
    );

    // Finish loading transition.
    await tester.pumpAndSettle();

    expect(find.byElementPredicate((Element element) {
      return (element.widget.runtimeType == RichText &&
          (element.widget as RichText)
              .text
              .toPlainText()
              .contains('COVID-19') &&
          element.size.height > 200);
    }), findsWidgets);
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
