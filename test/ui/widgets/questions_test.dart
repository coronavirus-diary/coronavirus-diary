import 'package:covidnearme/src/blocs/questions/questions.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/simple_slider.dart';
import 'package:covidnearme/src/ui/widgets/questions/question_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('QuestionItem displays question values for non-SliderQuestion',
      (tester) async {
    await tester.pumpWidget(
      Directionality(
        child: QuestionItem(
          question: FakeQuestion(),
        ),
        textDirection: TextDirection.ltr,
      ),
    );

    expect(find.text('subtitle'), findsOneWidget);
    expect(find.text('title'), findsOneWidget);

    // Does not display slider for non-Slider questions.
    expect(find.byType(SimpleSlider), findsNothing);
  });

  testWidgets('QuestionItem displays question values for SliderQuestion',
      (tester) async {
    await tester.pumpWidget(
      setUpConfiguration(
        QuestionItem(
          question: SliderQuestion(
            title: 'title',
            subtitle: 'subtitle',
            max: 100,
            min: 0,
            initialValue: 49,
          ),
        ),
      ),
    );

    expect(find.text('subtitle'), findsOneWidget);
    expect(find.text('title'), findsOneWidget);

    // Includes a SimpleSlider
    expect(find.byType(SimpleSlider), findsOneWidget);

    // Current slider value + 1
    expect(find.text('50'), findsOneWidget);
  });
}

Widget setUpConfiguration(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

class FakeQuestion implements Question {
  @override
  String get id => '1';

  @override
  String get subtitle => 'subtitle';

  @override
  String get title => 'title';

  @override
  Map<String, Object> toJson() {
    return <String, Object>{};
  }
}
