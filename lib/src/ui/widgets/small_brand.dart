import 'package:flutter/material.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';

class SmallBrand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            localizations.brandingCallout,
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .caption
                      .color
                      .withOpacity(0.6),
                  fontSize: 16,
                ),
          ),
        ),
        Container(
          height: 100,
          color: Theme.of(context).accentColor,
          child: Center(
            child: Text('Logo will be here'),
          ),
        ),
      ],
    );
  }
}
