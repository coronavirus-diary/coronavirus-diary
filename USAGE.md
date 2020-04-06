# Usage instructions

## Setup

1. Install and configure the latest stable-channel Flutter framework: https://flutter.dev/docs/get-started/install

2. Add the Flutter and Dart plugins to your IDE: https://flutter.dev/docs/get-started/editor

3. Fork this repository and clone your fork.

4. Create an environment configuration file (.env) with the structure shown in [the example .env file](env.example).

5. Run the project using your IDE or the Flutter CLI:
   ```sh
   flutter run
   ```

## Useful commands
### Testing
#### Unit tests
```sh
flutter test
```

#### Driver tests
```sh
flutter drive --target=test_driver/smoke_workflow.dart
```

### Regenerate apis, blocs and JSON models
```sh
flutter pub run build_runner watch
```

### Regenerate localization files
```sh
$FLUTTER_ROOT/bin/cache/dart-sdk/bin/dart tools/gen_l10n.dart --arb-dir lib/src/l10n
```

### Clean the project's build folders
This can resolve issues where the simulator is not running the latest code.
```sh
flutter clean
```

### Update launcher icons
```sh
flutter pub run flutter_launcher_icons:main
```
