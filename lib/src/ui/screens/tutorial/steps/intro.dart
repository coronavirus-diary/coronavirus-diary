import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'package:covidnearme/src/ui/widgets/tutorial_step.dart';
import '../tutorial_controller.dart';

class TutorialIntroStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return SafeArea(
      key: ValueKey('tutorialIntroStep'),
      child: ScrollableBody(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                margin: EdgeInsets.only(bottom: 20),
                child: FaIcon(
                  FontAwesomeIcons.bookMedical,
                  size: 80,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  localizations.tutorialIntroStepWelcome,
                  semanticsLabel:
                      localizations.tutorialIntroStepWelcomeSemanticsLabel,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(bottom: 30),
                child: Text(
                  localizations.tutorialIntroStepDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                margin: EdgeInsets.only(bottom: 40),
                child: Column(
                  children: <Widget>[
                    TutorialStep(
                      text: localizations.tutorialIntroStepLocalStatistics,
                      icon: FaIcon(
                        FontAwesomeIcons.mapMarked,
                        size: 30,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      leadingBackgroundColor: Theme.of(context).primaryColor,
                      leadingPadding: EdgeInsets.all(20),
                    ),
                    TutorialStep(
                      text: localizations.tutorialIntroStepSubmitSymptoms,
                      icon: FaIcon(
                        FontAwesomeIcons.heartbeat,
                        size: 30,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      leadingBackgroundColor: Theme.of(context).primaryColor,
                      leadingPadding: EdgeInsets.all(20),
                    ),
                    TutorialStep(
                      text: localizations.tutorialIntroStepAidEffort,
                      icon: FaIcon(
                        FontAwesomeIcons.handHoldingHeart,
                        size: 30,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      leadingBackgroundColor: Theme.of(context).primaryColor,
                      leadingPadding: EdgeInsets.all(20),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: RaisedButton(
                  key: ValueKey('tutorialIntroStepContinueButton'),
                  onPressed: () =>
                      Provider.of<TutorialController>(context, listen: false)
                          .next(),
                  child: Text(localizations.tutorialIntroStepGetStarted),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
