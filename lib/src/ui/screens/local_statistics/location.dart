import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/local_statistics/local_statistics.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/questions/inputs/index.dart';

class LocalStatisticsLocationScreen extends StatefulWidget {
  static const routeName = '/local-statistics/set-location';

  @override
  _LocalStatisticsLocationScreenState createState() =>
      _LocalStatisticsLocationScreenState();
}

class _LocalStatisticsLocationScreenState
    extends State<LocalStatisticsLocationScreen> {
  Location _selectedLocation = Location(country: 'US');

  void _saveAndExit() {
    context
        .bloc<LocalStatisticsBloc>()
        .add(GetLocalStatistics(location: _selectedLocation));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return Scaffold(
      key: ValueKey('LocalStatisticsLocationScreen'),
      appBar: AppBar(
        // TODO: This needs a better localization
        title: Text(localizations.localStatisticsLocationInput),
      ),
      body: LocationEntry(
        updateData: (Location location) => setState(() {
          _selectedLocation = location;
        }),
        location: _selectedLocation,
        finish: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: 400,
          child: RaisedButton(
            key: ValueKey('LocalStatisticsLocationScreenSubmitButton'),
            onPressed: _saveAndExit,
            // TODO: Replace this with its own localization in next version
            child: Text(localizations.symptomReportSubmitButton),
          ),
        ),
      ),
    );
  }
}
