import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:coronavirus_diary/src/blocs/preferences/preferences.dart';
import 'package:coronavirus_diary/src/ui/router.dart';
import 'package:coronavirus_diary/src/ui/widgets/share.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _getBody(PreferencesState state) {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);

    if (state.preferences.lastAssessment == null ||
        state.preferences.lastAssessment.processed.isBefore(today)) {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 20),
            child: FaIcon(
              FontAwesomeIcons.questionCircle,
              color: Colors.white,
              size: 80,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              "Concerned about your health?",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              "Are you experiencing symptoms? Have you been in contact with someone who is infected?",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body2,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 40),
            width: double.infinity,
            child: RaisedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, CheckupScreen.routeName),
              child: Text('Check up on your health'),
            ),
          ),
          ShareApp(),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 20),
            child: FaIcon(
              FontAwesomeIcons.checkCircle,
              color: Colors.white,
              size: 80,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              'You have completed your checkup for today!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              'If you continue to experience symptoms, please check back tomorrow.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 40),
            width: double.infinity,
            child: RaisedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                AssessmentScreen.routeName,
                arguments: AssessmentScreenArguments(
                  assessment: state.preferences.lastAssessment,
                ),
              ),
              child: Text('View my assessment'),
            ),
          ),
          ShareApp(),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Coronavirus Diary'),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              alignment: Alignment.center,
              child: _getBody(state),
            ),
          ),
        );
      },
    );
  }
}
