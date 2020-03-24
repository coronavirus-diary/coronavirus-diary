import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/router.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';

class GetStartedStep extends StatelessWidget {
  void _completeTutorial(BuildContext context, PreferencesState state) {
    // Save response
    Preferences newPreferences = state.preferences.cloneWith(
      completedTutorial: true,
    );
    context.bloc<PreferencesBloc>().add(UpdatePreferences(newPreferences));

    // Navigate to home page and put it at the
    // bottom of the navigation stack
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeScreen.routeName,
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        return SafeArea(
          child: ScrollableBody(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    color: Colors.white.withOpacity(0.2),
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    margin: EdgeInsets.only(bottom: 50),
                    child: Text(
                      localizations.getStartedStepJoined,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: RaisedButton(
                      onPressed: () => _completeTutorial(context, state),
                      child: Text(localizations.getStartedStepClick),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
