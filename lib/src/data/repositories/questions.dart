import 'dart:async';

import 'package:covidnearme/src/data/models/questions.dart';

class QuestionsRepository {
  Future<List<Question>> listQuestions() async => [
        ScaleQuestion(
          id: '5325',
          title: 'Are you experiencing shortness of breath?',
          subtitle: "Do you feel like you can't get enough air?",
          initialValue: null,
          labels: [
            'I can breathe fine',
            '',
            '',
            '',
            "I can hardly breathe at all",
          ],
          semanticLabels: [
            'I can breathe fine',
            'I have a little trouble breathing',
            'I have some trouble breathing',
            'It is difficult to breathe',
            "I can hardly breathe at all",
          ],
        ),
        ScaleQuestion(
          id: '32444',
          title: 'Do you have a cough?',
          initialValue: null,
          labels: [
            'Never',
            '',
            '',
            '',
            'Constantly',
          ],
          semanticLabels: [
            'Never',
            'Occasionally',
            'Sometimes',
            'Often',
            'Constantly',
          ],
        ),
        ScaleQuestion(
          id: '4664',
          title: "Have you felt like you've had a fever?",
          initialValue: null,
          labels: [
            'No',
            '',
            'Maybe?',
            '',
            "I'm burning up",
          ],
          semanticLabels: [
            'No',
            'Unlikely',
            'Maybe',
            'Probably',
            "I'm burning up",
          ],
        ),
      ];
}
