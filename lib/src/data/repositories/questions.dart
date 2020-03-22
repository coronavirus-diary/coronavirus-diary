import 'dart:async';

import 'package:covidnearme/src/data/models/questions.dart';

class QuestionsRepository {
  Future<List<Question>> listQuestions() async => [
        SliderQuestion(
          id: '5325',
          title: 'Are you experiencing shortness of breath?',
          subtitle: "Do you feel like you can't get enough air?",
          min: 0,
          max: 4,
          initialValue: 0,
          labels: {
            '0': "I can breathe fine",
            '4': "I can't breathe at all",
          },
        ),
        SliderQuestion(
          id: '32444',
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
          id: '4664',
          title: "Have you felt like you've had a fever?",
          min: 0,
          max: 4,
          initialValue: 0,
          labels: {
            '0': "No",
            '2': "Maybe?",
            '4': "I'm burning up",
          },
        ),
      ];
}
