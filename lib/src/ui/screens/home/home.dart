import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/screens/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/ui/widgets/network_unavailable_banner.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'package:covidnearme/src/ui/widgets/share.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _getBody(PreferencesState state) {
    final localizations = AppLocalizations.of(context);
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: BorderSide(
              color: Colors.black26,
              width: 1.0,
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(20),
            key: ValueKey<String>('homeScreenStartSymptomReport'),
            onTap: () =>
                Navigator.pushNamed(context, SymptomReportScreen.routeName),
            leading: FaIcon(
              FontAwesomeIcons.heartbeat,
              color: Colors.red,
              size: 40,
            ),
            title: Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                localizations.homeScreenReportSymptomsTitle,
                style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 22,
                    ),
              ),
            ),
            subtitle: Text(
              localizations.homeScreenReportSymptomsSubtitle,
              style: Theme.of(context).textTheme.subtitle,
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: BorderSide(
              color: Colors.black26,
              width: 1.0,
            ),
          ),
          child: ShareApp(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      key: ValueKey('homeScreen'),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'CovidNearMe',
              semanticsLabel: 'Covid Near Me',
            ),
            actions: <Widget>[_MainMenu()],
          ),
          body: NetworkUnavailableBanner.wrap(
            ScrollableBody(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: _getBody(state),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LinkTextSpan extends TextSpan {
  _LinkTextSpan({TextStyle style, String url, String text})
      : super(
          style: style,
          text: text ?? url,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launch(url, forceSafariVC: false);
            },
        );
}

class _MainMenu extends StatelessWidget {
  void _showAboutDialog(BuildContext context) async {
    final ThemeData themeData = Theme.of(context);
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final TextStyle aboutTextStyle = themeData.textTheme.body2;
    final TextStyle linkStyle =
        themeData.textTheme.body2.copyWith(color: Color(0xff0000ff));
    final AppLocalizations localizations = AppLocalizations.of(context);

    await showDialog<void>(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return Theme(
          data: themeData.copyWith(
            buttonTheme: themeData.buttonTheme.copyWith(
              colorScheme: themeData.colorScheme,
            ),
          ),
          child: AboutDialog(
            applicationVersion:
                '${packageInfo.version}.${packageInfo.buildNumber}',
            applicationIcon: Image(
              width: 50,
              height: 50,
              image: AssetImage('assets/images/icon.png'),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        style: aboutTextStyle,
                        text: localizations.aboutBoxDescription,
                      ),
                      _LinkTextSpan(
                        style: linkStyle,
                        text: localizations.aboutBoxLinkText,
                        url:
                            'https://github.com/coronavirus-diary/coronavirus-diary',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _debugClearData(BuildContext context) {
    // Clear state
    context.bloc<PreferencesBloc>().add(UpdatePreferences(Preferences()));

    // Restart app
    Phoenix.rebirth(context);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return PopupMenuButton(
      key: ValueKey('homeScreenMenuButton'),
      onSelected: (String selection) async {
        switch (selection) {
          case 'about':
            _showAboutDialog(context);
            break;
          case 'clear_data':
            _debugClearData(context);
            break;
        }
      },
      icon: Icon(Icons.more_vert),
      tooltip: localizations.homeMenuTooltip,
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem<String>>[
          PopupMenuItem<String>(
            value: 'about',
            child: Text(
              localizations.homeMenuAbout,
              semanticsLabel: localizations.homeMenuAboutSemantics,
            ),
          ),
          if (!kReleaseMode)
            PopupMenuItem<String>(
              key: ValueKey('homeScreenDebugDeleteDataButton'),
              value: 'clear_data',
              child: Text('DEBUG MODE ONLY: Clear user data'),
              textStyle: TextStyle(
                color: Colors.red,
              ),
            ),
        ];
      },
    );
  }
}
