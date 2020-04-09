import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/router.dart';
import 'package:covidnearme/src/ui/widgets/network_unavailable_banner.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'home_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _shareApp() {
    Share.share(AppLocalizations.of(context).shareAppDownloadPrompt);
  }

  Widget _getBody(PreferencesState state) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return Column(
      children: <Widget>[
        HomeCard(
          leading: FaIcon(
            FontAwesomeIcons.heartbeat,
            color: Colors.red,
            size: 40,
          ),
          title: Text(localizations.homeScreenReportSymptomsTitle),
          subtitle: Text(localizations.homeScreenReportSymptomsSubtitle),
          button: RaisedButton(
            key: ValueKey('homeScreenReportSymptomsButton'),
            onPressed: () =>
                Navigator.pushNamed(context, SymptomReportScreen.routeName),
            child: Text(localizations.homeScreenReportSymptomsButton),
          ),
        ),
        HomeCard(
          leading: FaIcon(
            FontAwesomeIcons.handHoldingHeart,
            color: Theme.of(context).primaryColor,
            size: 40,
          ),
          title: Text(localizations.homeScreenShareAppTitle),
          subtitle: Text(localizations.homeScreenShareAppSubtitle),
          button: RaisedButton(
            key: ValueKey('homeScreenShareAppButton'),
            onPressed: _shareApp,
            child: Text(localizations.homeScreenShareAppButton),
          ),
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
