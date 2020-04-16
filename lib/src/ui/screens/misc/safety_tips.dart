import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'package:covidnearme/src/ui/widgets/tutorial_step.dart';

class SafetyTipsScreen extends StatelessWidget {
  static const routeName = '/safety-tips';

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.safetyTipsTitle),
      ),
      body: ScrollableBody(
        child: Container(
          color: Colors.white.withOpacity(0.2),
          padding: EdgeInsets.all(40),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  localizations.safetyTipsTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Text(
                  localizations.safetyTipsSubtitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: TutorialStep(
                  text: localizations.safetyTipsWashYourHands,
                  contentPadding: EdgeInsets.all(0),
                  leadingBackgroundColor: Theme.of(context).primaryColor,
                  icon: SvgPicture.asset(
                    'assets/images/icons/handwash.svg',
                    color: Theme.of(context).primaryIconTheme.color,
                    width: 40,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: TutorialStep(
                  text: localizations.safetyTipsSocialDistancing,
                  contentPadding: EdgeInsets.all(0),
                  leadingBackgroundColor: Theme.of(context).primaryColor,
                  icon: SvgPicture.asset(
                    'assets/images/icons/socialdistance.svg',
                    color: Theme.of(context).primaryIconTheme.color,
                    width: 40,
                  ),
                ),
              ),
              Container(
                child: TutorialStep(
                  text: localizations.safetyTipsContactPhysician,
                  leadingBackgroundColor: Theme.of(context).primaryColor,
                  icon: SvgPicture.asset(
                    'assets/images/icons/contactprovider.svg',
                    color: Theme.of(context).primaryIconTheme.color,
                    width: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
