// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covidnearme.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$CovidNearMeService extends CovidNearMeService {
  _$CovidNearMeService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CovidNearMeService;

  @override
  Future<Response<dynamic>> createSymptomReport(SymptomReport symptomReport) {
    final $url = 'symptom_report/create';
    final $body = symptomReport;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getLocalStatistics(String country, {String zip}) {
    final $url = 'locations';
    final $params = <String, dynamic>{'country': country, 'zip': zip};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
