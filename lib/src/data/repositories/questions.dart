import 'dart:async';

import 'package:covidnearme/src/data/models/questions.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';

class QuestionsRepository {
  Future<List<Question>> listQuestions(AppLocalizations localizations) async =>
      [
        ScaleQuestion(
          id: '5325',
          title: localizations.questionShortnessOfBreathTitle,
          initialValue: null,
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
          id: '32444',
          title: localizations.questionHaveACoughTitle,
          initialValue: null,
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
          id: '4664',
          title: localizations.questionHaveAFeverTitle,
          initialValue: null,
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
          // TODO(gspencergoog): Insert correct ID here.
          id: '1',
          title: localizations.questionHowHighWasYourFever,
        ),
        ScaleQuestion(
          // TODO(gspencergoog): Insert correct ID here.
          id: '0',
          title: localizations.questionHaveNauseaTitle,
          initialValue: null,
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
        ScaleQuestion(
          // TODO(gspencergoog): Insert correct ID here.
          id: '2',
          title: localizations.questionHaveYouBeenFluTestedTitle,
          initialValue: null,
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
          // TODO(gspencergoog): Insert correct ID here.
          id: '2',
          title: localizations.questionFluTestPositiveTitle,
          initialValue: null,
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
          // TODO(gspencergoog): Insert correct ID here.
          id: '3',
          title: localizations.questionWhatWasPositiveTitle,
          initialValue: null,
        ),
        ScaleQuestion(
          // TODO(gspencergoog): Insert correct ID here.
          id: '4',
          title: localizations.questionTryForTestingTitle,
          initialValue: null,
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
          // TODO(gspencergoog): Insert correct ID here.
          id: '4',
          title: localizations.questionCovid19TestResultTitle,
          vertical: true,
          initialValue: null,
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
      ];
}
