import 'dart:async';

import 'package:covidnearme/src/data/models/questions.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';

class QuestionsRepository {
  Future<List<Question>> listQuestions(AppLocalizations localizations) async =>
      [
        ScaleQuestion(
          id: 'shortness_of_breath',
          title: localizations.questionShortnessOfBreathTitle,
          initialValue: null,
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
          initialValue: null,
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
          initialValue: null,
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
        ),
        ScaleQuestion(
          id: 'nausea',
          title: localizations.questionHaveNauseaTitle,
          initialValue: null,
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
              initialValue: null,
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
              initialValue: null,
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
              initialValue: null,
            ),
          ],
          answers: <dynamic>['yes', 'yes'],
        ),
        CompositeQuestion(
          children: <Question>[
            ScaleQuestion(
              id: 'tried_to_get_tested_for_covid19',
              title: localizations.questionTryForTestingTitle,
              initialValue: null,
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
              initialValue: null,
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
