import 'dart:async';

import 'package:covidnearme/src/data/models/questions.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';

class QuestionsRepository {
  Future<List<Question>> listQuestions(AppLocalizations localizations) async =>
      [
        ScaleQuestion(
          id: '5325',
          title: localizations.questionShortnessOfBreathTitle,
          subtitle: localizations.questionShortnessOfBreathSubtitle,
          initialValue: null,
          labels: [
            localizations.questionShortnessOfBreathAnswer0,
            '',
            '',
            '',
            localizations.questionShortnessOfBreathAnswer4,
          ],
          semanticLabels: [
            localizations.questionShortnessOfBreathSemantics0,
            localizations.questionShortnessOfBreathSemantics1,
            localizations.questionShortnessOfBreathSemantics2,
            localizations.questionShortnessOfBreathSemantics3,
            localizations.questionShortnessOfBreathSemantics4,
          ],
        ),
        ScaleQuestion(
          id: '32444',
          title: localizations.questionHaveACoughTitle,
          initialValue: null,
          labels: [
            localizations.questionHaveACoughAnswer0,
            '',
            '',
            '',
            localizations.questionHaveACoughAnswer4,
          ],
          semanticLabels: [
            localizations.questionHaveACoughSemantics0,
            localizations.questionHaveACoughSemantics1,
            localizations.questionHaveACoughSemantics2,
            localizations.questionHaveACoughSemantics3,
            localizations.questionHaveACoughSemantics4,
          ],
        ),
        ScaleQuestion(
          id: '4664',
          title: localizations.questionHaveAFeverTitle,
          initialValue: null,
          labels: [
            localizations.questionHaveAFeverAnswer0,
            '',
            '',
            '',
            localizations.questionHaveAFeverAnswer4,
          ],
          semanticLabels: [
            localizations.questionHaveAFeverSemantics0,
            localizations.questionHaveAFeverSemantics1,
            localizations.questionHaveAFeverSemantics2,
            localizations.questionHaveAFeverSemantics3,
            localizations.questionHaveAFeverSemantics4,
          ],
        ),
      ];
}
