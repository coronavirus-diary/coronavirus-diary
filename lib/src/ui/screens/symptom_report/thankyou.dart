import 'package:covidnearme/src/ui/widgets/network_unavailable_banner.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/router.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'package:covidnearme/src/utils/share.dart';

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
      key: ValueKey('symptomReportThankYouScreen'),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          tooltip: localizations.thankYouScreenFinishButton,
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
                  size: 80,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
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
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  localizations.thankYouScreenCallToAction,
                  style:
                      Theme.of(context).textTheme.body2.copyWith(fontSize: 16),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  localizations.thankYouScreenSeriousSymptoms,
                  style:
                      Theme.of(context).textTheme.body2.copyWith(fontSize: 16),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        onPressed: () => Navigator.of(context)
                            .pushNamed(StaySafeScreen.routeName),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                          side: BorderSide(
                            color: Colors.black26,
                            width: 1.0,
                          ),
                        ),
                        color: Colors.white,
                        textColor: Theme.of(context).colorScheme.primary,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: FaIcon(
                                FontAwesomeIcons.check,
                                size: 40,
                              ),
                            ),
                            Text(localizations.thankYouScreenSafetyTipsButton),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: () => shareApp(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                          side: BorderSide(
                            color: Colors.black26,
                            width: 1.0,
                          ),
                        ),
                        color: Colors.white,
                        textColor: Theme.of(context).colorScheme.primary,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: FaIcon(
                                FontAwesomeIcons.shareAlt,
                                size: 40,
                              ),
                            ),
                            Text(localizations.thankYouScreenShareAppButton),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                padding: EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                child: RaisedButton(
                  key: ValueKey('symptomReportThankYouFinishButton'),
                  onPressed: () => Navigator.pop(context),
                  child: Text(localizations.thankYouScreenFinishButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
