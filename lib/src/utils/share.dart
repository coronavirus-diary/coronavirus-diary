import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/utils/env.dart';

void shareApp(BuildContext context) {
  final AppLocalizations localizations = AppLocalizations.of(context);
  Share.share(localizations.shareAppDownloadPrompt.replaceFirst(
    '{{ APP_LINK }}',
    appEnv['APP_DOWNLOAD_LINK'],
  ));
}
