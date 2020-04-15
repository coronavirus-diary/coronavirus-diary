import 'dart:async';

import 'package:meta/meta.dart';

import 'package:covidnearme/src/data/apis/covidnearme.dart';
import 'package:covidnearme/src/data/models/local_statistics.dart';
import 'package:covidnearme/src/data/models/locations.dart';

export 'package:covidnearme/src/data/models/local_statistics.dart';

class LocalStatisticsRepository {
  Future<List<LocalStatisticsEntry>> getLocalStatistics({
    @required Location location,
  }) async {
    return await covidNearMeApi.getLocalStatistics(
      location.country,
      zip: location.postalCode,
    );
  }
}
