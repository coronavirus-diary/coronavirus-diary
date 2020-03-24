import 'package:covidnearme/src/blocs/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:covidnearme/src/app.dart';
import 'package:file/memory.dart';

void main() {
  setUp(() async {
    BlocSupervisor.delegate = await AppHydratedBlocDelegate.build(
        storageDirectory: MemoryFileSystem.test().currentDirectory);
  });

  testWidgets('App loads test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());
  });
}
