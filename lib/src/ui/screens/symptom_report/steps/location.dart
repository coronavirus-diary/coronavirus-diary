import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/utils/symptom_reports.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/country_dropdown.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/index.dart';
import 'package:covidnearme/src/ui/widgets/questions/step_finished_button.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';

import 'index.dart';

class LocationStep extends StatefulWidget implements SymptomReportStep {
  bool get isLastStep => false;

  @override
  _LocationStepState createState() => _LocationStepState();
}

class _LocationStepState extends State<LocationStep> {
  bool _countryIsValid = false;
  bool _zipIsValid = false;
  bool get _isUSA => _displayedCountry == "US";
  // Keep the values entered, so that when switching between modes,
  // they stick, but we don't have to update the preferences values.
  String _displayedZip;
  String _displayedCountry = 'US';

  LocalKey zipCodeKey = ValueKey<String>('ZIP Code');
  LocalKey countryKey = ValueKey<String>('Country');

  String _validateZipCode(String value, [AppLocalizations localizations]) {
    if (value != '') {
      final int zipValue = int.tryParse(value, radix: 10);
      if (value.length != 5 || zipValue == null) {
        return localizations?.locationStepInvalidZipCode ?? '';
      }
    }
    return null;
  }

  bool _updateValidity() {
    bool valid = false;
    if (_isUSA) {
      valid = _displayedZip != null &&
          _displayedZip.isNotEmpty &&
          _validateZipCode(_displayedZip) == null;
      if (_zipIsValid != valid) {
        setState(() {
          _zipIsValid = valid;
        });
      }
    } else {
      valid = _displayedCountry != 'None';
      if (_countryIsValid != valid) {
        setState(() {
          _countryIsValid = valid;
        });
      }
    }
    return valid;
  }

  void _updateZipCode({
    String zipCode,
    @required SymptomReportStateInProgress symptomReportState,
    @required AppLocalizations localizations,
  }) {
    assert(zipCode != null);
    setState(() {
      _displayedZip = zipCode;
    });
    // Validate before saving.
    if (!_updateValidity()) {
      return;
    }

    updateSymptomReport(
      symptomReportState: symptomReportState,
      context: context,
      updateFunction: (SymptomReport symptomReport) {
        final SymptomReportLocation newResponse = SymptomReportLocation(
          zipCode: zipCode,
          country: 'US',
        );

        symptomReport.location = newResponse;
        return symptomReport;
      },
    );
  }

  void _updateCountry({
    String countryCode,
    @required SymptomReportStateInProgress symptomReportState,
    @required AppLocalizations localizations,
  }) {
    assert(countryCode != null);
    setState(() {
      _displayedCountry = countryCode;
    });
    // Validate before saving.
    if (!_updateValidity()) {
      return;
    }

    updateSymptomReport(
      symptomReportState: symptomReportState,
      context: context,
      updateFunction: (SymptomReport symptomReport) {
        final SymptomReportLocation newResponse = SymptomReportLocation(
          zipCode: null,
          country: countryCode,
        );

        symptomReport.location = newResponse;
        return symptomReport;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return BlocBuilder<SymptomReportBloc, SymptomReportState>(
      builder: (context, state) {
        final SymptomReportStateInProgress symptomReportState = state;
        final SymptomReportLocation existingResponse =
            symptomReportState.symptomReport.location;
        _displayedZip ??=
            existingResponse != null ? existingResponse.zipCode : '';
        _displayedCountry ??=
            existingResponse != null ? existingResponse.country : '';
        return ScrollableBody(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        localizations.locationStepTitle,
                        style: Theme.of(context).textTheme.title.copyWith(
                              fontSize: 26,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  CountryDropdown(
                    onChanged: (String value) => _updateCountry(
                      countryCode: value,
                      symptomReportState: symptomReportState,
                      localizations: localizations,
                    ),
                    value: _displayedCountry,
                  ),
                  if (_isUSA)
                    EntryField(
                      key: zipCodeKey,
                      initialValue: _displayedZip,
                      onChanged: (String value) => _updateZipCode(
                        zipCode: value,
                        symptomReportState: symptomReportState,
                        localizations: localizations,
                      ),
                      label: localizations.locationStepZipCode,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                      validator: (String string) =>
                          _validateZipCode(string, localizations),
                    ),
                  StepFinishedButton(validated: true),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
