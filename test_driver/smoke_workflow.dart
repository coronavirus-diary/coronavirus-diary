import 'package:covidnearme/src/ui/widgets/scroll_more_indicator.dart';
import 'package:flutter_driver/driver_extension.dart';

import 'package:covidnearme/main.dart' as entrypoint;

Future<void> main() async {
  debugDisableTickerMode = true;
  enableFlutterDriverExtension();
  await entrypoint.main();
}
