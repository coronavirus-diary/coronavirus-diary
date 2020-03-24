import 'dart:io';
import 'dart:typed_data';

import 'package:covidnearme/src/app.dart';
import 'package:covidnearme/src/blocs/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:file/memory.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    BlocSupervisor.delegate = await AppHydratedBlocDelegate.build(
        storageDirectory: MemoryFileSystem.test().currentDirectory);
    await _loadRobotoFont();

    binding.window.physicalSizeTestValue = Size(500, 800);
    binding.window.devicePixelRatioTestValue = 1.2;
  });

  testWidgets('tutorial step matches golden file', (WidgetTester tester) async {
    final key = UniqueKey();
    await tester.pumpWidget(App(key: key));

    await expectLater(
      find.byKey(key),
      matchesGoldenFile('goldens/tutorial.png'),
    );
    expect(tester, meetsGuideline(textContrastGuideline));
  });

  testWidgets('terms page matches golden vile', (WidgetTester tester) async {
    final key = UniqueKey();
    await tester.pumpWidget(App(key: key));

    await tester.tap(find.byType(RaisedButton));
    await tester.pumpAndSettle();

    await expectLater(
      find.byKey(key),
      matchesGoldenFile('goldens/terms.png'),
    );
    expect(tester, meetsGuideline(textContrastGuideline));
  });
}

void _loadRobotoFont() async {
  final fontFileDirectory = Directory('testing/fonts/Roboto/');
  final fontLoader = FontLoader('Roboto');

  for (var file in fontFileDirectory.listSync()) {
    if (file.path.endsWith('.ttf')) {
      final fontData = File(file.path)
          .readAsBytes()
          .then((bytes) => ByteData.view(Uint8List.fromList(bytes).buffer));
      fontLoader.addFont(fontData);
    }
  }

  await fontLoader.load();
}
