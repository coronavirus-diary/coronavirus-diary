import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/checkup/checkup.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'package:covidnearme/src/ui/utils/checkups.dart';
import 'index.dart';

class IntroStep extends StatefulWidget implements CheckupStep {
  @override
  _IntroStepState createState() => _IntroStepState();
}

class _IntroStepState extends State<IntroStep> {
  void _updateDataContributionPreference(
    bool value,
    CheckupStateInProgress checkupState,
  ) {
    updateCheckup(
      context: context,
      checkupState: checkupState,
      updateFunction: (Checkup checkup) {
        checkup.dataContributionPreference = value;

        // Make sure to clear location if the user has disabled data sharing
        if (!value) {
          checkup.location = null;
        }

        return checkup;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckupBloc, CheckupState>(
      builder: (context, state) {
        final CheckupStateInProgress checkupState = state;
        return ScrollableBody(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: FaIcon(
                  FontAwesomeIcons.heartbeat,
                  color: Colors.white,
                  size: 100,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "It's time for your checkup.",
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "We will ask you a few questions and have you take your temperature.",
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "At the end, you will receive a personalized COVID-19 risk assessment and recommendations for staying healthy.",
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                color: Colors.white.withOpacity(0.2),
                child: SwitchListTile(
                  contentPadding: EdgeInsets.all(20),
                  secondary: FaIcon(
                    FontAwesomeIcons.handHoldingHeart,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: Text(
                    'Contribute my data to the COVID-19 response effort.',
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      'We will collect your postal code.',
                    ),
                  ),
                  activeColor: Colors.white,
                  onChanged: (bool value) =>
                      _updateDataContributionPreference(value, checkupState),
                  value: checkupState.checkup.dataContributionPreference,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: RaisedButton(
                  onPressed: () {
                    Provider.of<PageController>(context, listen: false)
                        .nextPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text('Start checkup'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
