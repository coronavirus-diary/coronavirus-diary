import 'dart:async';

import 'package:meta/meta.dart';

import 'package:covidnearme/src/data/apis/covidnearme.dart';
import 'package:covidnearme/src/data/models/local_statistics.dart';
import 'package:covidnearme/src/utils/env.dart';

export 'package:covidnearme/src/data/models/local_statistics.dart';

class LocalStatisticsRepository {
  Future<List<LocalStatisticsEntry>> getLocalStatistics({
    @required String country,
    String zip,
  }) async {
    if (appEnv['SKIP_PRIVATE_API'] != 'true') {
      return await covidNearMeApi.getLocalStatistics(country, zip: zip);
    }
    return [];
  }
}
