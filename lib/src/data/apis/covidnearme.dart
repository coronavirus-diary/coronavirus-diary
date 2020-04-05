import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'package:covidnearme/src/utils/env.dart' show appEnv;
import 'package:covidnearme/src/data/models/symptom_report.dart';
part 'covidnearme.g.dart';

@RestApi()
abstract class CovidNearMeApi {
  factory CovidNearMeApi(Dio dio) = _CovidNearMeApi;

  @POST('symptom_report/create')
  Future<void> createSymptomReport(@Body() SymptomReport symptomReport);
}

Dio _createDio() {
  return Dio(BaseOptions(
    baseUrl: appEnv['COVIDNEARME_API_URL'],
    headers: {
      'Accept': 'application/json',
      'Authorization': appEnv['COVIDNEARME_API_KEY'],
    },
  ));
}

CovidNearMeApi covidNearMeApi = CovidNearMeApi(_createDio());
