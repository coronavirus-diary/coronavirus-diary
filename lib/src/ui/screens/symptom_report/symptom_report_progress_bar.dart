import 'package:flutter/material.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';

class SymptomReportProgressBar extends StatelessWidget {
  final int currentProgressStep;
  final int totalProgressSteps;
  final double percentComplete;

  const SymptomReportProgressBar({
    this.currentProgressStep,
    this.totalProgressSteps,
  }) : percentComplete = currentProgressStep / totalProgressSteps;

  @override
  Widget build(BuildContext context) {
    // Remember to update this if steps are added that do not count towards the total
    final AppLocalizations localizations = AppLocalizations.of(context);
    String percentCompleteText =
        localizations.symptomReportProgressBarPercentCompleteText(
            currentProgressStep, totalProgressSteps);
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ExcludeSemantics(
            child: SizedBox(
              height: 14,
              child: LinearProgressIndicator(
                value: percentComplete,
                backgroundColor:
                    Theme.of(context).colorScheme.surface.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).accentColor),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  percentCompleteText,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
