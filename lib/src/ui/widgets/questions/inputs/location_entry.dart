import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/country_dropdown.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/index.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';

import 'index.dart';

class LocationEntry extends StatefulWidget {
  const LocationEntry({
    Key key,
    @required this.updateData,
    @required this.location,
    this.finish,
    this.title,
  })  : assert(updateData != null),
        super(key: key);

  final ValueChanged<UserLocation> updateData;
  final UserLocation location;
  final String title;
  final Widget finish;

  @override
  _LocationEntryState createState() => _LocationEntryState();
}

class _LocationEntryState extends State<LocationEntry> {
  bool _countryIsValid = false;
  bool _zipIsValid = false;
  bool get _isUSA => _displayedLocation.country == "US";
  // Keep the values entered, so that when switching between modes,
  // they stick, but we don't have to update the preferences values.
  UserLocation _displayedLocation = UserLocation(
    country: 'US',
    postalCode: null,
  );

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
      valid = _displayedLocation.postalCode != null &&
          _displayedLocation.postalCode.isNotEmpty &&
          _validateZipCode(_displayedLocation.postalCode) == null;
      if (_zipIsValid != valid) {
        setState(() {
          _zipIsValid = valid;
        });
      }
    } else {
      valid = _displayedLocation.country != 'None';
      if (_countryIsValid != valid) {
        setState(() {
          _countryIsValid = valid;
        });
      }
    }
    return valid;
  }

  void _updateLocation(UserLocation location) {
    if (location.postalCode != null) {
      location.country = 'US';
    }
    assert(location.country != null);
    setState(() {
      _displayedLocation = location;
    });

    // Validate before saving.
    if (!_updateValidity()) {
      return;
    }

    widget.updateData(location);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    _displayedLocation.postalCode ??= widget.location?.postalCode ?? '';
    _displayedLocation.country ??= widget.location?.country ?? '';

    return ScrollableBody(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (widget.title != null)
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.title.copyWith(
                            fontSize: 26,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              CountryDropdown(
                onChanged: (String value) => _updateLocation(UserLocation(
                  country: value,
                  postalCode: null,
                )),
                value: _displayedLocation.country,
              ),
              if (_isUSA)
                EntryField(
                  key: zipCodeKey,
                  initialValue: _displayedLocation.postalCode,
                  onChanged: (String value) => _updateLocation(
                      UserLocation(postalCode: value, country: 'US')),
                  label: localizations.locationStepZipCode,
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: false, signed: false),
                  validator: (String string) =>
                      _validateZipCode(string, localizations),
                ),
              if (widget.finish != null) widget.finish,
            ],
          ),
        ),
      ),
    );
  }
}
