# Temporary copy of dev/tools/gen_l10n et al.

This is a temporary copy of the Flutter beta version of the gen_l10n tool.

When messages are added/removed/changed in the Coronavirus Diary app's lib/src/app_en.arb file, the gen_l10n.dart tool must be run to update the generated AppLocalization class:

```dart
${FLUTTER_HOME}/bin/cache/dart-sdk/bin/dart tools/gen_l10n.dart --arb-dir lib/src/l10n
```
