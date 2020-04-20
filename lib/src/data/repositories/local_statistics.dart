import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:meta/meta.dart';

import 'package:covidnearme/src/data/apis/covidnearme.dart';
import 'package:covidnearme/src/data/models/local_statistics.dart';
import 'package:covidnearme/src/data/models/locations.dart';

export 'package:covidnearme/src/data/models/local_statistics.dart';

class LocalStatisticsRepository {
  Future<LocalStatisticsResponse> getLocalStatistics({
    @required Location location,
  }) async {
    final Response response = await covidNearMeService.getLocalStatistics(
      location.country,
      zip: location.postalCode,
    );
    if (response.error == null) {
      return LocalStatisticsResponse.fromJson(response.body);
    } else {
      return LocalStatisticsResponse.fromJson({'error': response.error});
    }
  }
}
