import 'package:covidnearme/src/ui/widgets/network_unavailable_banner.dart';
import 'package:covidnearme/src/ui/widgets/share.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'package:covidnearme/src/ui/widgets/stay_safe.dart';

class ThankYouScreen extends StatefulWidget {
  static const routeName = '/symptom-report/thankyou';

  @override
  _ThankYouScreenState createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          tooltip: localizations.thankYouScreenReturnToHome,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(localizations.thankYouScreenTitle),
      ),
      body: NetworkUnavailableBanner.wrap(
        ScrollableBody(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: FaIcon(
                  FontAwesomeIcons.heartbeat,
                  size: 70,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  localizations.thankYouScreenTitle,
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  localizations.thankYouScreenDataSubmission,
                  style:
                      Theme.of(context).textTheme.body2.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  localizations.thankYouScreenCallToAction,
                  style:
                      Theme.of(context).textTheme.body2.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                padding: EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(localizations.thankYouScreenReturnToHome),
                ),
              ),
              ShareApp(),
              StaySafe(),
            ],
          ),
        ),
      ),
    );
  }
}
