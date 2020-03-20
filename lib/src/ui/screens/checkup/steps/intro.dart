import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:coronavirus_diary/src/blocs/checkup/checkup.dart';
import 'package:coronavirus_diary/src/ui/router.dart';
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
    Checkup checkup = checkupState.checkup;
    checkup.dataContributionPreference = value;

    // Make sure to clear location
    checkup.location = null;

    context
        .bloc<CheckupBloc>()
        .add(UpdateLocalCheckup(updatedCheckup: checkup));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckupBloc, CheckupState>(
      builder: (context, state) {
        if (state is! CheckupStateInProgress) {
          // We should never hit this, but if we do, let's
          // navigate back to the beginning to make sure
          // the checkup is created.
          Navigator.pushNamed(context, CheckupScreen.routeName);
          return Container();
        }

        final CheckupStateInProgress checkupState = state;
        return DefaultTextStyle(
          style: TextStyle(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: FaIcon(
                  FontAwesomeIcons.solidSmile,
                  color: Colors.white.withOpacity(0.7),
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
                    FontAwesomeIcons.heartbeat,
                    color: Colors.red,
                    size: 35,
                  ),
                  title: Text(
                    'Contribute my data to the COVID-19 response effort.',
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      'We will ask for your approximate location.',
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
