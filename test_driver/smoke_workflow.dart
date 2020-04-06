import 'package:flutter_driver/driver_extension.dart';
import 'package:mockito/mockito.dart';

import 'package:covidnearme/main.dart' as entrypoint;
import 'package:covidnearme/src/data/apis/covidnearme.dart';
import 'package:covidnearme/src/ui/widgets/scroll_more_indicator.dart';

Future<void> main() async {
  debugDisableTickerMode = true;
  covidNearMeApi = FakeCovidNearMeApi();
  enableFlutterDriverExtension();
  await entrypoint.main();
}

class FakeCovidNearMeApi extends Mock implements CovidNearMeApi {}
