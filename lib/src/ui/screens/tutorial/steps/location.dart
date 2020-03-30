import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/router.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/index.dart';

class TutorialLocationStep extends StatefulWidget {
  bool get isLastStep => false;

  @override
  _TutorialLocationStepState createState() => _TutorialLocationStepState();
}

class _TutorialLocationStepState extends State<TutorialLocationStep> {
  void _updateData({
    UserLocation location,
    @required PreferencesState preferencesState,
  }) {
    if (location.zipCode != null) {
      location.country = 'US';
    }
    assert(location.country != null);
    setState(() {
      // Save response to preferences to update default.
      Preferences newPreferences = preferencesState.preferences.cloneWith(
        location: location,
      );
      context.bloc<PreferencesBloc>().add(UpdatePreferences(newPreferences));
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (BuildContext context, PreferencesState preferencesState) {
      return LocationEntry(
        updateData: (UserLocation location) => _updateData(
          location: location,
          preferencesState: preferencesState,
        ),
        title: localizations.tutorialLocationStepTitle,
        location: preferencesState.preferences.location,
        finish: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: 400,
          child: RaisedButton(
            onPressed: () {
              // Navigate to home page and put it at the
              // bottom of the navigation stack if consent is given.
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomeScreen.routeName,
                (Route<dynamic> route) => false,
              );
            },
            child: Text(localizations.checkupStepFinishedSubmit),
          ),
        ),
      );
    });
  }
}
