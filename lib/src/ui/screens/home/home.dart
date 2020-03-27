import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/router.dart';
import 'package:covidnearme/src/ui/widgets/network_unavailable_banner.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'package:covidnearme/src/ui/widgets/share.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _debugRestart() {
    // Clear state
    context.bloc<PreferencesBloc>().add(UpdatePreferences(Preferences()));

    // Restart app
    Phoenix.rebirth(context);
  }

  Widget _getBody(PreferencesState state) {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final localizations = AppLocalizations.of(context);

    if (state.preferences.lastAssessment == null ||
        state.preferences.lastAssessment.processed.isBefore(today)) {
      return Column(
        children: <Widget>[
          if (!state.preferences.completedTutorial)
            Container(
              width: double.infinity,
              color: Theme.of(context).accentColor.withOpacity(0.5),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              margin: EdgeInsets.only(bottom: 20),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.handHoldingHeart,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
          if (!state.preferences.completedTutorial)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                localizations.getStartedStepJoined,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.title,
              ),
            ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 20),
            child: FaIcon(
              FontAwesomeIcons.questionCircle,
              size: 80,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              localizations.homeScreenHeading,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              localizations.homeScreenDoYouHaveSymptoms,
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
              child: Text(localizations.homeScreenCheckupButtonLabel),
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
              size: 80,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              localizations.homeScreenYouHaveCompletedCheckup,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              localizations.homeScreenCheckBackTomorrow,
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
              child: Text(localizations.homeScreenViewMyAssessment),
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
            title: Text('CovidNearMe'),
            leading: kReleaseMode
                ? null
                : IconButton(
                    onPressed: _debugRestart,
                    icon: Icon(Icons.delete),
                    tooltip: 'DEBUG MODE ONLY: Clear user data',
                  ),
          ),
          body: NetworkUnavailableBanner.wrap(
            ScrollableBody(
              child: Container(
                padding: state.preferences.completedTutorial
                    ? EdgeInsets.symmetric(vertical: 40)
                    : EdgeInsets.only(bottom: 40),
                alignment: Alignment.center,
                child: _getBody(state),
              ),
            ),
          ),
        );
      },
    );
  }
}
