import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/ui/widgets/tutorial_step.dart';

class IntroStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return SafeArea(
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
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                margin: EdgeInsets.only(bottom: 40),
                child: Text(
                  localizations.tutorialIntroStepWelcome,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                margin: EdgeInsets.only(bottom: 40),
                child: Column(
                  children: <Widget>[
                    TutorialStep(
                      text: localizations.tutorialIntroStepCompleteACheckup,
                      icon: FaIcon(
                        FontAwesomeIcons.check,
                        size: 30,
                      ),
                      leadingBackgroundColor:
                          Theme.of(context).accentColor.withOpacity(0.5),
                      leadingPadding: EdgeInsets.all(20),
                    ),
                    TutorialStep(
                      text: localizations.tutorialIntroStepReceiveAssessment,
                      icon: FaIcon(
                        FontAwesomeIcons.heartbeat,
                        size: 30,
                      ),
                      leadingBackgroundColor:
                          Theme.of(context).accentColor.withOpacity(0.5),
                      leadingPadding: EdgeInsets.all(20),
                    ),
                    TutorialStep(
                      text: localizations.tutorialIntroStepAidEffort,
                      icon: FaIcon(
                        FontAwesomeIcons.handHoldingHeart,
                        size: 30,
                      ),
                      leadingBackgroundColor:
                          Theme.of(context).accentColor.withOpacity(0.5),
                      leadingPadding: EdgeInsets.all(20),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: RaisedButton(
                  onPressed: () => {
                    Provider.of<PageController>(context, listen: false)
                        .nextPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    )
                  },
                  child: Text(localizations.tutorialIntroStepLearnMore),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
