import 'dart:async';

import 'package:coronavirus_diary/src/data/models/questions.dart';

class QuestionsRepository {
  Future<List<Question>> listQuestions() async => [
        SliderQuestion(
          title: 'Are you experiencing shortness of breath?',
          subtitle: "Do you feel like you can't get enough air?",
          min: 0,
          max: 4,
          initialValue: 0,
        ),
        SliderQuestion(
          title: 'Do you have a cough?',
          min: 0,
          max: 4,
          initialValue: 0,
          labels: {
            '0': 'Never',
            '4': 'Constantly',
          },
        ),
        SliderQuestion(
          title: "Have you felt like you've had a fever?",
          min: 0,
          max: 4,
          initialValue: 0,
          labels: {
            '0': "No",
            '2': "Maybe?",
            '4': "I'm burning up.",
          },
        ),
      ];
}
