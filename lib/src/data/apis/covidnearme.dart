import "dart:async";
import 'package:chopper/chopper.dart';

import 'package:covidnearme/src/utils/env.dart' show appEnv;
import 'package:covidnearme/src/data/models/symptom_report.dart';

part 'covidnearme.chopper.dart';

@ChopperApi()
abstract class CovidNearMeService extends ChopperService {
  static CovidNearMeService create([ChopperClient client]) =>
      _$CovidNearMeService(client);

  @Post(path: 'symptom_report/create')
  Future<Response> createSymptomReport(@Body() SymptomReport symptomReport);

  @Get(path: 'locations')
  Future<Response> getLocalStatistics(
    @Query('country') String country, {
    @Query('zip') String zip,
  });
}

ChopperClient covidNearMeClient = ChopperClient(
  baseUrl: appEnv['COVIDNEARME_API_URL'],
  converter: JsonConverter(),
  errorConverter: JsonConverter(),
  interceptors: [
    (Request request) async => request.copyWith(
          headers: {
            'Accept': 'application/json',
            'Authorization': appEnv['COVIDNEARME_API_KEY'],
          },
        ),
  ],
  services: [CovidNearMeService.create()],
);
CovidNearMeService covidNearMeService =
    covidNearMeClient.getService<CovidNearMeService>();
