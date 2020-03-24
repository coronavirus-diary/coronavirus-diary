import 'package:flutter/material.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/tutorial_step.dart';

class StaySafe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return Container(
      color: Colors.white.withOpacity(0.2),
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              localizations.staySafeTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          TutorialStep(
            text: localizations.staySafeWashYourHands,
            number: 1,
            leadingBackgroundColor: Colors.white.withOpacity(0.2),
          ),
          TutorialStep(
            text: localizations.staySafeLimitContact,
            number: 2,
            leadingBackgroundColor: Colors.white.withOpacity(0.2),
          ),
          TutorialStep(
            text: localizations.staySafeCheckBackIf,
            number: 3,
            leadingBackgroundColor: Colors.white.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
