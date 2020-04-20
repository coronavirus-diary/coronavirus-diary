import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:covidnearme/src/data/models/locations.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/country_dropdown.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/index.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';

import 'index.dart';

const countriesWithPostalCode = [
  'US',
];

class LocationEntry extends StatefulWidget {
  const LocationEntry({
    Key key,
    @required this.updateData,
    @required this.location,
    this.finish,
    this.title,
  })  : assert(updateData != null),
        super(key: key);

  final ValueChanged<Location> updateData;
  final Location location;
  final String title;
  final Widget finish;

  @override
  _LocationEntryState createState() => _LocationEntryState();
}

class _LocationEntryState extends State<LocationEntry> {
  bool _countryIsValid = false;
  bool _postalCodeIsValid = false;
  // Keep the values entered, so that when switching between modes,
  // they stick, but we don't have to update the preferences values.
  Location _displayedLocation;

  bool get _selectedCountrySupportsPostalCode =>
      countriesWithPostalCode.contains(_displayedLocation.country);

  @override
  void initState() {
    super.initState();
    _displayedLocation = widget.location ?? Location();
  }

  LocalKey postalCodeKey = ValueKey<String>('ZIP Code');
  LocalKey countryKey = ValueKey<String>('Country');

  String _validatePostalCode(String value, [AppLocalizations localizations]) {
    if (value != null && value.isNotEmpty) {
      final int postalValue = int.tryParse(value, radix: 10);
      if (value.length != 5 || postalValue == null) {
        return localizations?.locationStepInvalidZipCode ?? '';
      }
    }
    return null;
  }

  bool _updateValidity() {
    // Validate country
    final bool newCountryValidity = _displayedLocation.country != 'None';
    if (_countryIsValid != newCountryValidity) {
      setState(() {
        _countryIsValid = newCountryValidity;
      });
    }

    // Validate postal code
    final bool newPostalCodeValidity =
        _validatePostalCode(_displayedLocation.postalCode) == null;
    if (_postalCodeIsValid != newPostalCodeValidity) {
      setState(() {
        _postalCodeIsValid = newPostalCodeValidity;
      });
    }

    return _countryIsValid && _postalCodeIsValid;
  }

  void _updateLocation(Location location) {
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
    _displayedLocation.country ??= widget.location?.country ?? '';
    _displayedLocation.postalCode ??= widget.location?.postalCode ?? '';

    return ScrollableBody(
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
              onChanged: (String value) => _updateLocation(Location(
                country: value,
                postalCode: null,
              )),
              value: _displayedLocation.country,
            ),
            if (_selectedCountrySupportsPostalCode)
              EntryField(
                key: postalCodeKey,
                initialValue: _displayedLocation.postalCode,
                onChanged: (String value) => _updateLocation(Location(
                  postalCode: value,
                  country: _displayedLocation.country,
                )),
                label: localizations.locationStepZipCode,
                keyboardType: TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                validator: (String string) =>
                    _validatePostalCode(string, localizations),
              ),
            if (widget.finish != null) widget.finish,
          ],
        ),
      ),
    );
  }
}
