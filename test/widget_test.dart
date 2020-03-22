import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:covidnearme/src/app.dart';
import 'package:file/memory.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() {
  MemoryFileSystem fs;
  setUp(() async {
    // Use a hermetic file system that is cleaned up between tests.
    fs = MemoryFileSystem();

    BlocSupervisor.delegate = await HydratedBlocDelegate.build(
      storageDirectory: fs.systemTempDirectory.createTempSync(),
    );
  });

  testWidgets('App loads test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());
  });
}
