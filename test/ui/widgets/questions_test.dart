import 'package:covidnearme/src/blocs/questions/questions.dart';
import 'package:covidnearme/src/blocs/utils.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/radio_button_scale.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/simple_slider.dart';
import 'package:covidnearme/src/ui/widgets/questions/question_item.dart';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    BlocSupervisor.delegate = await AppHydratedBlocDelegate.build(
        storageDirectory: MemoryFileSystem.test().currentDirectory);
  });

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
          onChanged: (int value) {},
          question: ScaleQuestion(
            title: 'title',
            subtitle: 'subtitle',
            initialValue: 0,
            labels: ['one', 'two', 'three'],
            semanticLabels: ['one', 'two', 'three'],
          ),
        ),
      ),
    );

    expect(find.text('subtitle'), findsOneWidget);
    expect(find.text('title'), findsOneWidget);
    expect(find.byType(RadioButtonScale), findsOneWidget);

    expect(
      tester.getSemantics(find.bySemanticsLabel('one')),
      matchesSemantics(
        value: '1',
        isChecked: true,
        isEnabled: true,
        hasCheckedState: true,
        hasEnabledState: true,
        isInMutuallyExclusiveGroup: true,
        hasTapAction: true,
        isFocusable: true,
      ),
    );

    expect(
      tester.getSemantics(find.bySemanticsLabel('two')),
      matchesSemantics(
        value: '2',
        isChecked: false,
        isEnabled: true,
        hasCheckedState: true,
        hasEnabledState: true,
        isInMutuallyExclusiveGroup: true,
        hasTapAction: true,
        isFocusable: true,
      ),
    );

    expect(
      tester.getSemantics(find.bySemanticsLabel('three')),
      matchesSemantics(
        value: '3',
        isChecked: false,
        isEnabled: true,
        hasCheckedState: true,
        hasEnabledState: true,
        isInMutuallyExclusiveGroup: true,
        hasTapAction: true,
        isFocusable: true,
      ),
    );

    Finder findRadio(int value) {
      return find.byWidgetPredicate(
        (Widget widget) => widget is Radio<int> && widget.value == value,
      );
    }

    await tester.tap(findRadio(1));
    await tester.pumpAndSettle();

    expect(
      (tester.widget(find.byType(RadioButtonScale)) as RadioButtonScale).value,
      equals(1),
    );
    expect(
      (tester.widget(findRadio(1)) as Radio<int>).groupValue,
      equals(1),
    );
    expect(
      tester.getSemantics(findRadio(1)),
      matchesSemantics(
        value: '2',
        isChecked: true,
        isEnabled: true,
        hasCheckedState: true,
        hasEnabledState: true,
        isInMutuallyExclusiveGroup: true,
        textDirection: TextDirection.ltr,
        hasTapAction: true,
        isFocusable: true,
      ),
    );
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
