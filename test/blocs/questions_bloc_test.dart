import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:covidnearme/src/blocs/questions/questions.dart';
import 'package:covidnearme/src/data/repositories/questions.dart';

class MockQuestionsRepository extends Mock implements QuestionsRepository {}

void main() {
  group('QuestionsBloc', () {
    QuestionsRepository questionsRepository;
    QuestionsBloc questionsBloc;

    setUp(() {
      questionsRepository = MockQuestionsRepository();
      questionsBloc = QuestionsBloc(questionsRepository: questionsRepository);
    });

    group('initialState', () {
      test('is QuestionsStateNotLoaded', () {
        expect(questionsBloc.initialState, QuestionsStateNotLoaded());
      });
    });

    group('LoadQuestions', () {
      final listQuestionsException = Exception('listQuestions Exception');
      blocTest(
        'emits [loading, loaded] when questions are successfully retrieved',
        build: () async {
          when(questionsRepository.listQuestions())
              .thenAnswer((_) => Future.value(<Question>[]));
          return questionsBloc;
        },
        act: (bloc) => bloc.add(LoadQuestions()),
        expect: [
          QuestionsStateLoading(),
          QuestionsStateLoaded(<Question>[]),
        ],
      );

      blocTest(
        'emits [loading, failure] when questions cannot be retrieved',
        build: () async {
          when(questionsRepository.listQuestions())
              .thenThrow(listQuestionsException);
          return questionsBloc;
        },
        act: (bloc) => bloc.add(LoadQuestions()),
        expect: [
          QuestionsStateLoading(),
          QuestionsStateLoadingFailed(listQuestionsException),
        ],
      );
    });
  });
}
