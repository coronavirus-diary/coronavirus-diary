# Usage instructions

## Setup

1. Install and configure the latest stable-channel Flutter framework: https://flutter.dev/docs/get-started/install

2. Add the Flutter and Dart plugins to your IDE: https://flutter.dev/docs/get-started/editor

3. Fork this repository and clone your fork.

4. Run the project using your IDE or the Flutter CLI:
   ```
   flutter run
   ```

## Useful commands
### Regenerate apis, blocs and JSON models
```sh
flutter pub run build_runner watch
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
