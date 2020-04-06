import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:flutter/material.dart';

import 'consent.dart';
import 'intro.dart';
import 'location.dart';
import 'subjective.dart';

export 'consent.dart';
export 'intro.dart';
export 'location.dart';
export 'subjective.dart';

abstract class SymptomReportStep extends Widget {
  SymptomReportStep();

  bool get isLastStep;
  bool get showProgress;
}

List<SymptomReportStep> getSteps(PreferencesState preferencesState) => [
      IntroStep(),
      if (preferencesState.preferences.acceptedInformedConsent != true)
        ConsentStep(),
      LocationStep(),
      SubjectiveStep(),
    ];

int getProgressStepCount(List<SymptomReportStep> steps) =>
    steps.where((SymptomReportStep step) => step.showProgress == true).length;
