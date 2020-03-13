// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:coronavirus_diary/src/app.dart';

void main() {
  testWidgets('App loads test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(DiaryApp());
  });
}
