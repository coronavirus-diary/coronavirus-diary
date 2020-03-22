import 'package:flutter_test/flutter_test.dart';

import 'package:covidnearme/src/app.dart';

void main() {
  testWidgets('App loads test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());
  });
}
