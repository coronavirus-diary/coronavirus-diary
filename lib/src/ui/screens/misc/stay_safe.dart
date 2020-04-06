import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/tutorial_step.dart';

class StaySafeScreen extends StatelessWidget {
  static const routeName = '/stay-safe';

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.staySafeTitle),
      ),
      body: Container(
        color: Colors.white.withOpacity(0.2),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                localizations.staySafeTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TutorialStep(
                text: localizations.staySafeWashYourHands,
                leadingBackgroundColor: Theme.of(context).accentColor,
                icon: SvgPicture.asset(
                  'assets/images/icons/handwash.svg',
                  color: Theme.of(context).accentIconTheme.color,
                  width: 40,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TutorialStep(
                text: localizations.staySafeLimitContact,
                leadingBackgroundColor: Theme.of(context).accentColor,
                icon: SvgPicture.asset(
                  'assets/images/icons/socialdistance.svg',
                  color: Theme.of(context).accentIconTheme.color,
                  width: 40,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TutorialStep(
                text: localizations.staySafeContactPhysician,
                leadingBackgroundColor: Theme.of(context).accentColor,
                icon: SvgPicture.asset(
                  'assets/images/icons/contactprovider.svg',
                  color: Theme.of(context).accentIconTheme.color,
                  width: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
