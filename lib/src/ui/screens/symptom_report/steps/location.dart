import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/utils/symptom_reports.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/index.dart';
import 'package:covidnearme/src/ui/widgets/questions/step_finished_button.dart';

import 'index.dart';

class LocationStep extends StatefulWidget implements SymptomReportStep {
  bool get isLastStep => false;
  bool get showProgress => true;

  @override
  _LocationStepState createState() => _LocationStepState();
}

class _LocationStepState extends State<LocationStep> {
  void _updateData({
    UserLocation location,
    @required SymptomReportState symptomReportState,
    @required PreferencesState preferencesState,
  }) {
    if (location.zipCode != null) {
      location.country = 'US';
    }
    assert(location.country != null);
    assert(symptomReportState != null);
    setState(() {
      // Save response to preferences to update default.
      Preferences newPreferences = preferencesState.preferences.cloneWith(
        location: location,
      );
      context.bloc<PreferencesBloc>().add(UpdatePreferences(newPreferences));

      updateSymptomReport(
        symptomReportState: symptomReportState,
        context: context,
        updateFunction: (SymptomReport symptomReport) {
          symptomReport.location = location;
          return symptomReport;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      key: ValueKey('symptomReportLocationStep'),
      builder: (BuildContext context, PreferencesState preferencesState) {
        return BlocBuilder<SymptomReportBloc, SymptomReportState>(
            builder: (BuildContext context, SymptomReportState state) {
          final SymptomReportStateInProgress symptomReportState = state;
          final UserLocation currentLocation =
              symptomReportState?.symptomReport?.location ??
                  preferencesState.preferences.location;
          return LocationEntry(
            updateData: (UserLocation location) => _updateData(
              location: location,
              symptomReportState: symptomReportState,
              preferencesState: preferencesState,
            ),
            title: localizations.locationStepTitle,
            location: currentLocation,
            finish: StepFinishedButton(
              validated: true,
              isLastStep: widget.isLastStep,
              onPressed: () {
                // Save the data to the symptom report if the user didn't cause
                // any changes to the screen.
                if (currentLocation != null &&
                    symptomReportState?.symptomReport?.location == null) {
                  _updateData(
                    location: currentLocation,
                    symptomReportState: symptomReportState,
                    preferencesState: preferencesState,
                  );
                }
              },
            ),
          );
        });
      },
    );
  }
}
