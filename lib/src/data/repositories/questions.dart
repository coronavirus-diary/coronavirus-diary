import 'dart:async';

import 'package:covidnearme/src/data/models/questions.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';

import 'symptom_reports.dart';

class QuestionsRepository {
  Future<List<Question>> listQuestions(
    AppLocalizations localizations,
    List<QuestionResponse> currentResponses,
  ) async {
    _currentValueOrNull(String id, List<QuestionResponse> currentResponses) {
      final response = currentResponses
          ?.firstWhere((q) => q.questionIdentifier == id, orElse: () => null)
          ?.response;
      print('ID: $id Value: $response');
      return response;
    }

    return [
      ScaleQuestion(
        id: 'shortness_of_breath',
        title: localizations.questionShortnessOfBreathTitle,
        initialValue: _currentValueOrNull(
          'shortness_of_breath',
          currentResponses,
        ),
        values: ['none', 'mild', 'moderate', 'severe'],
        labels: [
          localizations.questionShortnessOfBreathAnswer0,
          localizations.questionShortnessOfBreathAnswer1,
          localizations.questionShortnessOfBreathAnswer2,
          localizations.questionShortnessOfBreathAnswer3,
        ],
        semanticLabels: [
          localizations.questionShortnessOfBreathSemantics0,
          localizations.questionShortnessOfBreathSemantics1,
          localizations.questionShortnessOfBreathSemantics2,
          localizations.questionShortnessOfBreathSemantics3,
        ],
      ),
      ScaleQuestion(
        id: 'cough',
        title: localizations.questionHaveACoughTitle,
        initialValue: _currentValueOrNull(
          'cough',
          currentResponses,
        ),
        values: ['none', 'mild', 'moderate', 'severe'],
        labels: [
          localizations.questionHaveACoughAnswer0,
          localizations.questionHaveACoughAnswer1,
          localizations.questionHaveACoughAnswer2,
          localizations.questionHaveACoughAnswer3,
        ],
        semanticLabels: [
          localizations.questionHaveACoughSemantics0,
          localizations.questionHaveACoughSemantics1,
          localizations.questionHaveACoughSemantics2,
          localizations.questionHaveACoughSemantics3,
        ],
      ),
      ScaleQuestion(
        id: 'fever',
        title: localizations.questionHaveAFeverTitle,
        initialValue: _currentValueOrNull(
          'fever',
          currentResponses,
        ),
        values: ['no', 'maybe', 'severe'],
        labels: [
          localizations.questionHaveAFeverAnswer0,
          localizations.questionHaveAFeverAnswer1,
          localizations.questionHaveAFeverAnswer2,
        ],
        semanticLabels: [
          localizations.questionHaveAFeverSemantics0,
          localizations.questionHaveAFeverSemantics1,
          localizations.questionHaveAFeverSemantics2,
        ],
      ),
      TemperatureQuestion(
        id: 'temperature',
        title: localizations.questionHowHighWasYourFever,
        // TODO(bkonyi): this value is always converted to F before being
        // saved, so repopulating a temperature field results in the F
        // value being used.
        initialValue: double.tryParse(
          _currentValueOrNull(
                'temperature',
                currentResponses,
              ) ??
              '',
        ),
      ),
      ScaleQuestion(
        id: 'nausea',
        title: localizations.questionHaveNauseaTitle,
        initialValue: _currentValueOrNull(
          'nausea',
          currentResponses,
        ),
        values: ['none', 'mild', 'moderate', 'severe'],
        labels: [
          localizations.questionHaveNauseaAnswer0,
          localizations.questionHaveNauseaAnswer1,
          localizations.questionHaveNauseaAnswer2,
          localizations.questionHaveNauseaAnswer3,
        ],
        semanticLabels: [
          localizations.questionHaveNauseaSemantics0,
          localizations.questionHaveNauseaSemantics1,
          localizations.questionHaveNauseaSemantics2,
          localizations.questionHaveNauseaSemantics3,
        ],
      ),
      CompositeQuestion(
        children: <Question>[
          ScaleQuestion(
            id: 'tested_for_flu_etc',
            title: localizations.questionHaveYouBeenFluTestedTitle,
            initialValue: _currentValueOrNull(
              'tested_for_flu_etc',
              currentResponses,
            ),
            values: ['no', 'yes'],
            labels: [
              localizations.questionNo,
              localizations.questionYes,
            ],
            semanticLabels: [
              localizations.questionHaveAFeverSemantics1,
              localizations.questionHaveAFeverSemantics0,
            ],
          ),
          ScaleQuestion(
            id: 'tested_positive_for_flu_etc',
            title: localizations.questionFluTestPositiveTitle,
            initialValue: _currentValueOrNull(
              'tested_positive_for_flu_etc',
              currentResponses,
            ),
            values: ['no', 'yes'],
            labels: [
              localizations.questionNo,
              localizations.questionYes,
            ],
            semanticLabels: [
              localizations.questionFluTestPositiveSemantics1,
              localizations.questionFluTestPositiveSemantics0,
            ],
          ),
          TextFieldQuestion(
            id: 'tested_positive_for_what',
            title: localizations.questionWhatWasPositiveTitle,
            initialValue: _currentValueOrNull(
              'tested_positive_for_what',
              currentResponses,
            ),
          ),
        ],
        answers: <dynamic>['yes', 'yes'],
      ),
      CompositeQuestion(
        children: <Question>[
          ScaleQuestion(
            id: 'tried_to_get_tested_for_covid19',
            title: localizations.questionTryForTestingTitle,
            initialValue: _currentValueOrNull(
              'tried_to_get_tested_for_covid19',
              currentResponses,
            ),
            values: ['no', 'yes'],
            labels: [
              localizations.questionNo,
              localizations.questionYes,
            ],
            semanticLabels: [
              localizations.questionTryForTestingSemantics1,
              localizations.questionTryForTestingSemantics0,
            ],
          ),
          ScaleQuestion(
            id: 'covid19_result',
            title: localizations.questionCovid19TestResultTitle,
            vertical: true,
            initialValue: _currentValueOrNull(
              'covid19_result',
              currentResponses,
            ),
            values: [
              'negative',
              'positive',
              'i_dont_know_yet',
              'no_available_tests',
              'turned_away',
            ],
            labels: [
              localizations.questionCovid19TestResultAnswer0,
              localizations.questionCovid19TestResultAnswer1,
              localizations.questionCovid19TestResultAnswer2,
              localizations.questionCovid19TestResultAnswer3,
              localizations.questionCovid19TestResultAnswer4,
            ],
            semanticLabels: [
              localizations.questionCovid19TestResultAnswer0,
              localizations.questionCovid19TestResultAnswer1,
              localizations.questionCovid19TestResultAnswer2,
              localizations.questionCovid19TestResultAnswer3,
              localizations.questionCovid19TestResultAnswer4,
            ],
          ),
        ],
        answers: <dynamic>['yes'],
      ),
    ];
  }
}
