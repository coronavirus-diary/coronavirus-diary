import 'package:covidnearme/src/ui/screens/tutorial/steps/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:file/memory.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() {
  MemoryFileSystem fs;
  setUp(() async {
    // Use a hermetic file system that is cleaned up between tests.
    fs = MemoryFileSystem.test();

    BlocSupervisor.delegate = await HydratedBlocDelegate.build(
      storageDirectory: fs.systemTempDirectory.createTempSync(),
    );
  });

  testWidgets('Tutorial intro step displays learn more button',
      (WidgetTester tester) async {
    await tester.pumpWidget(setUpConfiguration(IntroStep()));

    expect(find.text('Click here to learn more'), findsOneWidget);
  });
}

Widget setUpConfiguration(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}
