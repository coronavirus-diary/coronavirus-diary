import 'package:flutter/material.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'steps/index.dart';

class SymptomReportController {
  PageController pageController;
  final PreferencesState preferencesState;
  final BuildContext context;
  final List<SymptomReportStep> steps;

  SymptomReportController({
    this.context,
    this.pageController,
    this.preferencesState,
    this.steps,
  });

  int get currentStepIndex =>
      pageController.hasClients ? pageController.page.toInt() : null;
  SymptomReportStep get currentStep =>
      currentStepIndex != null ? steps[currentStepIndex] : null;

  void next() {
    int nextPage = currentStepIndex + 1;

    // Page-specific actions
    if (steps[nextPage] is ConsentStep) {
      if (preferencesState.preferences.acceptedInformedConsent == true) {
        nextPage += 1;
      }
    }

    // Advance to the next page
    pageController.animateToPage(
      nextPage,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void previous() {
    // Go back to the previous page
    pageController.previousPage(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
