import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';

class ShareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    void _shareApp() {
      Share.share(localizations.shareAppDownloadPrompt);
    }

    return Container(
      color: Colors.white.withOpacity(0.2),
      padding: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: FaIcon(
              FontAwesomeIcons.handHoldingHeart,
              size: 40,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              localizations.shareAppProtectYourCommunity,
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              localizations.shareAppWithFriendsEtc,
              style: Theme.of(context).textTheme.body1.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: _shareApp,
              child: Text(localizations.shareAppNow),
            ),
          ),
        ],
      ),
    );
  }
}
