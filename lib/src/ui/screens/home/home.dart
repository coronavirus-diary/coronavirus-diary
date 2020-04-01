import 'package:covidnearme/src/ui/screens/symptom_report/symptom_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/network_unavailable_banner.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'package:covidnearme/src/ui/widgets/share.dart';
import 'package:package_info/package_info.dart';

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
    final localizations = AppLocalizations.of(context);
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
              semanticsLabel: localizations.getStartedStepJoinedSemanticsLabel,
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
            key: ValueKey<String>('START HEALTH CHECKUP'),
            onPressed: () =>
                Navigator.pushNamed(context, SymptomReportScreen.routeName),
            child: Text(localizations.homeScreenCheckupButtonLabel),
          ),
        ),
        ShareApp(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'CovidNearMe',
              semanticsLabel: 'Covid Near Me',
            ),
            leading: kReleaseMode
                ? null
                : IconButton(
                    onPressed: _debugRestart,
                    icon: Icon(Icons.delete),
                    tooltip: 'DEBUG MODE ONLY: Clear user data',
                  ),
            actions: <Widget>[_MainMenu()],
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

class _MainMenu extends StatelessWidget {
  static const String copyright = '© 2020 Josh Smith';

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem<String>>[
          PopupMenuItem<String>(
            value: 'About',
            child: Text(
              localizations.homeMenuAbout,
              semanticsLabel: localizations.homeMenuAboutSemantics,
            ),
          ),
        ];
      },
      onSelected: (String selection) async {
        assert(selection == 'About');
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        showAboutDialog(
          context: context,
          applicationVersion:
              '${packageInfo.version}.${packageInfo.buildNumber}',
          applicationLegalese: copyright,
          applicationIcon: Image(
            width: 50,
            height: 50,
            image: AssetImage('assets/images/icon.png'),
          ),
        );
      },
      icon: Icon(Icons.more_vert),
      tooltip: localizations.homeMenuTooltip,
    );
  }
}
