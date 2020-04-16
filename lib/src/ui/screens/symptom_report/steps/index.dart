import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:flutter/material.dart';

import 'consent.dart';
import 'intro.dart';
import 'location.dart';
import 'questions.dart';

export 'consent.dart';
export 'intro.dart';
export 'location.dart';
export 'questions.dart';

abstract class SymptomReportStep extends Widget {
  SymptomReportStep();

  bool get isLastStep;
  bool get showProgress;
}

List<SymptomReportStep> getSteps(
  PreferencesState preferencesState,
  List<QuestionResponse> prepopulatedResponses,
) =>
    [
      IntroStep(),
      if (preferencesState.preferences.acceptedInformedConsent != true)
        ConsentStep(),
      LocationStep(),
      QuestionsStep(prepopulatedResponses),
    ];

int getProgressStepCount(List<SymptomReportStep> steps) =>
    steps.where((SymptomReportStep step) => step.showProgress == true).length;
