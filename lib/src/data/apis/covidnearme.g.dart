// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covidnearme.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CovidNearMeApi implements CovidNearMeApi {
  _CovidNearMeApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  createSymptomReport(symptomReport) async {
    ArgumentError.checkNotNull(symptomReport, 'symptomReport');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(symptomReport?.toJson() ?? <String, dynamic>{});
    await _dio.request<void>('symptom_report/create',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return Future.value(null);
  }
}
