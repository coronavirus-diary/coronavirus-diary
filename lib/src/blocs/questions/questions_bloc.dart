import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:coronavirus_diary/src/data/repositories/questions.dart';
import 'questions.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final QuestionsRepository questionsRepository;

  QuestionsBloc({@required this.questionsRepository});

  @override
  QuestionsState get initialState => QuestionsStateNotLoaded();

  @override
  Stream<QuestionsState> mapEventToState(QuestionsEvent event) async* {
    switch (event.runtimeType) {
      case LoadQuestions:
        yield* _mapLoadQuestionsToState(event);
        break;
    }
  }

  Stream<QuestionsState> _mapLoadQuestionsToState(LoadQuestions event) async* {
    yield QuestionsStateLoading();

    try {
      final questions = await questionsRepository.listQuestions();
      yield QuestionsStateLoaded(questions);
    } catch (exception) {
      developer.log(
        'Could not load questions list',
        error: exception,
      );
      yield QuestionsStateLoadingFailed(exception);
    }
  }
}
