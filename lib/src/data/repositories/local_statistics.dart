import 'dart:async';

import 'package:meta/meta.dart';

import 'package:covidnearme/src/data/apis/covidnearme.dart';
import 'package:covidnearme/src/data/models/local_statistics.dart';

export 'package:covidnearme/src/data/models/local_statistics.dart';

class LocalStatisticsRepository {
  Future<List<LocalStatisticsEntry>> getLocalStatistics({
    @required String country,
    String zip,
  }) async {
    return await covidNearMeApi.getLocalStatistics(country, zip: zip);
  }
}
