import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'index.dart';

class IntroStep extends StatefulWidget implements SymptomReportStep {
  bool get isLastStep => false;
  bool get showProgress => false;

  @override
  _IntroStepState createState() => _IntroStepState();
}

class _IntroStepState extends State<IntroStep> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return ScrollableBody(
      child: Container(
        key: ValueKey('symptomReportIntroStep'),
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: FaIcon(
                FontAwesomeIcons.heartbeat,
                size: 100,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                localizations.introStepTimeForYourCheckup,
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                localizations.introStepWeWillAskQuestions,
                style: Theme.of(context).textTheme.subtitle,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                localizations.introStepAtTheEnd,
                style: Theme.of(context).textTheme.subtitle,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: RaisedButton(
                key: ValueKey('symptomReportIntroStepContinueButton'),
                onPressed: () {
                  Provider.of<PageController>(context, listen: false).nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(localizations.introStepButtonStartLabel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
