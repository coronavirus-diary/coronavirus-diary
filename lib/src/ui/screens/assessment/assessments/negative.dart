import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'package:covidnearme/src/ui/widgets/stay_safe.dart';

class NegativeAssessment extends StatefulWidget {
  @override
  _NegativeAssessmentState createState() => _NegativeAssessmentState();
}

class _NegativeAssessmentState extends State<NegativeAssessment> {
  @override
  Widget build(BuildContext context) {
    return ScrollableBody(
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
              AppLocalizations.of(context).negativeAssessmentTestingCriteria,
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              AppLocalizations.of(context).negativeAssessmentCheckInTomorrow,
              style: Theme.of(context).textTheme.body2.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40),
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              AppLocalizations.of(context).negativeAssessmentConsultPhysician,
              style: Theme.of(context).textTheme.body2.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          StaySafe(),
        ],
      ),
    );
  }
}
