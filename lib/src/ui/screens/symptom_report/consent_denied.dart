import 'dart:ui';

import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SymptomReportConsentDeniedScreen extends StatelessWidget {
  static const routeName = '/symptom_report/denied_consent';

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return Scaffold(
      key: ValueKey('symptomReportConsentDeniedScreen'),
      appBar: AppBar(
        leading: IconButton(
          key: ValueKey('symptomReportConsentDeniedCloseButton'),
          tooltip: localizations.deniedConsentBackButton,
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(localizations.symptomReportTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 48, bottom: 24),
            child: Icon(
              Icons.info,
              size: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 20),
            child: Text(
              localizations.deniedConsentHeading,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                localizations.deniedConsentMessage,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.body2.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
