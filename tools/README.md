# Temporary copy of dev/tools/gen_l10n et al.

This is a temporary copy of the Flutter beta version of the gen_l10n tool.

Internationalization support landed in https://github.com/coronavirus-diary/coronavirus-diary/pull/95. This change enables the app to be localized for different languages.  The app now looks up messages (user visible text strings) via the AppLocalizations class, see lib/src/l10n/app_localizations.dart. This class was generated from lib/src/l10n/app_en.arb - the app's message "template" file" - using the beta version of the Flutter gen_l10n tool. The English localizations, lib/src/l10n/app_localizations_en.dart, were generated this way as well. Each message is defined by two entries in the template file. For example these entries define the message called temperatureStepWait30Minutes:

```
"temperatureStepWait30Minutes": "Wait 30 minutes after eating, drinking, or exercising",
"@temperatureStepWait30Minutes": {
  "description": "User advice"
},
```

The name of the message corresponds to Widget that uses it, `TemperatureStep`, along with a suffix that's supposed to help someone reading the code to understand what the message refers to. The second "@" entry will be visible to translators. It's required.

Many developers are still adding and modifying messages and will need a way to update the AppLocalization class themselves. I've added a copy of the beta version of the gen_l10n tool to this repo:

https://github.com/coronavirus-diary/coronavirus-diary/pull/102

Once this PR has landed:

- To change a message that's currently retrieved by the AppLocalizations class, change the corresponding entry in lib/src/l10n/app_en.arb and then run the local copy of gen_l10n:

```
${FLUTTER_HOME}/bin/cache/dart-sdk/bin/dart tools/gen_l10n.dart --arb-dir lib/src/l10n
```

As you know, you'll also have to run `flutter format .` because.


- To add a message, add a pair of message entries to lib/src/l10n/app_en.arb and then run the gen_l10n tool. Be careful to follow JSON conventions for commas or gen_l10n will fail with `fatal: Unexpected character`.

- To remove message, remove its entries from lib/src/l10n/app_en.arb and then run the gen_l10n tool.
