import 'package:flutter/material.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';

class CheckupProgressBar extends StatelessWidget {
  final int currentIndex;
  final int stepsLength;
  final bool isLastPage;
  final double percentComplete;

  const CheckupProgressBar({
    this.currentIndex,
    this.stepsLength,
  })  : isLastPage = currentIndex == stepsLength - 1,
        percentComplete = (currentIndex) / (stepsLength - 1);

  @override
  Widget build(BuildContext context) {
    // Remember to update this if steps are added that do not count towards the total
    final AppLocalizations localizations = AppLocalizations.of(context);
    String percentCompleteText = localizations
        .checkupProgressBarPercentCompleteText(currentIndex, stepsLength);
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ExcludeSemantics(
            child: SizedBox(
              height: 20,
              child: LinearProgressIndicator(
                value: percentComplete,
                backgroundColor: Colors.white.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
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
                    color: Colors.white,
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
