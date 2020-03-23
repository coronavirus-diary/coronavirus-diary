import 'package:covidnearme/src/blocs/questions/questions.dart';
import 'package:covidnearme/src/data/repositories/questions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pedantic/pedantic.dart';

void main() {
  test('LoadQuestions has no props by default', () {
    expect(LoadQuestions().props, isEmpty);
  });

  test('LoadQuestions stringifies with no props', () {
    expect(LoadQuestions().toString(), 'LoadQuestions()');
  });

  test('QuestionsBloc only responds to LoadQuestions events', () async {
    final bloc = QuestionsBloc(questionsRepository: QuestionsRepository());
    bloc.add(NotQuestion());
    unawaited(bloc.close());

    await expectLater(
      bloc,
      emitsInOrder(
        [
          QuestionsStateNotLoaded(),
          emitsDone,
        ],
      ),
    );
  });

  test(
      'QuestionsBloc returns the question list after loading when it receives '
      'a LoadQuestions event', () async {
    final bloc = QuestionsBloc(questionsRepository: QuestionsRepository());
    bloc.add(LoadQuestions());
    unawaited(bloc.close());

    await expectLater(
      bloc,
      emitsInOrder(
        [
          const QuestionsStateNotLoaded(),
          const QuestionsStateLoading(),
          isA<QuestionsStateLoaded>(),
          emitsDone,
        ],
      ),
    );
  });

  test('QuestionsBloc catches Exceptions thrown when loading the question list',
      () async {
    final bloc = QuestionsBloc(questionsRepository: FakeQuestionsRepository());
    bloc.add(LoadQuestions());
    unawaited(bloc.close());

    await expectLater(
      bloc,
      emitsInOrder(
        [
          const QuestionsStateNotLoaded(),
          const QuestionsStateLoading(),
          isA<QuestionsStateLoadingFailed>(),
          emitsDone,
        ],
      ),
    );
  });
}

class NotQuestion extends QuestionsEvent {}

class FakeQuestionsRepository implements QuestionsRepository {
  @override
  Future<List<Question>> listQuestions() {
    throw Exception('Failed to load.');
  }
}
