import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'symptom_report_controller.dart';
import 'symptom_report_progress_bar.dart';
import 'steps/index.dart';

class SymptomReportLoadedBody extends StatefulWidget {
  final List<SymptomReportStep> steps;
  final bool jumpToLastStep;

  const SymptomReportLoadedBody({this.steps, this.jumpToLastStep = false});

  @override
  _SymptomReportLoadedBodyState createState() =>
      _SymptomReportLoadedBodyState();
}

class _SymptomReportLoadedBodyState extends State<SymptomReportLoadedBody> {
  @override
  Widget build(BuildContext context) {
    // Retrieve the symptom report controller
    SymptomReportController symptomReportController =
        Provider.of<SymptomReportController>(context);

    // Calculate the user's progress from enabled steps (not zero-indexed)
    final int progressStepCount = getProgressStepCount(widget.steps);
    final int currentProgressStepIndex = widget.jumpToLastStep
        ? widget.steps.length - 1
        : (symptomReportController.currentStepIndex != null
            ? symptomReportController.currentStepIndex -
                (widget.steps.length - progressStepCount) +
                1
            : 0);

    // Display the last step as the initial page. Used to rebuild this widget
    // after a network error while maintaining the symptom report state. Gives
    // the appearance of going "back" from the submitting HUD (showing the HUD
    // currently forces this widget to be rebuilt).
    if (widget.jumpToLastStep) {
      symptomReportController.pageController =
          PageController(initialPage: widget.steps.length - 1);
    }
    return Column(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: ((symptomReportController.currentStep != null &&
                      symptomReportController.currentStep.showProgress) ||
                  widget.jumpToLastStep)
              ? SymptomReportProgressBar(
                  currentProgressStep: currentProgressStepIndex,
                  totalProgressSteps: progressStepCount,
                )
              : Container(),
        ),
        Expanded(
          child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller:
                Provider.of<SymptomReportController>(context).pageController,
            itemCount: widget.steps.length,
            itemBuilder: (BuildContext context, int index) {
              return widget.steps[index];
            },
          ),
        ),
      ],
    );
  }
}
