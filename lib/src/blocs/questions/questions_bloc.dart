import 'dart:async';
import 'dart:developer' as developer;

import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:covidnearme/src/data/repositories/questions.dart';
import 'questions.dart';

export 'package:covidnearme/src/data/models/questions.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final QuestionsRepository questionsRepository;
  final AppLocalizations localizations;

  QuestionsBloc(
      {@required this.questionsRepository, @required this.localizations});

  @override
  QuestionsState get initialState => const QuestionsStateNotLoaded();

  @override
  Stream<QuestionsState> mapEventToState(QuestionsEvent event) async* {
    switch (event.runtimeType) {
      case LoadQuestions:
        yield* _mapLoadQuestionsToState(event);
        break;
    }
  }

  Stream<QuestionsState> _mapLoadQuestionsToState(LoadQuestions event) async* {
    yield const QuestionsStateLoading();

    try {
      final questions = await questionsRepository.listQuestions(
        localizations,
        event.responses,
      );
      yield QuestionsStateLoaded(questions);
    } on Exception catch (exception) {
      developer.log(
        'Could not load questions list',
        error: exception,
      );
      yield QuestionsStateLoadingFailed(exception);
    }
  }
}
