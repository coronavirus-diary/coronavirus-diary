// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalStatisticsResponse _$LocalStatisticsResponseFromJson(
    Map<String, dynamic> json) {
  return LocalStatisticsResponse(
    localStatisticsEntries: (json['local_statistics_entries'] as List)
        ?.map((e) => e == null
            ? null
            : LocalStatisticsEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    error: json['error'] as String,
  );
}

Map<String, dynamic> _$LocalStatisticsResponseToJson(
        LocalStatisticsResponse instance) =>
    <String, dynamic>{
      'local_statistics_entries':
          instance.localStatisticsEntries?.map((e) => e?.toJson())?.toList(),
      'error': instance.error,
    };

LocalStatisticsEntry _$LocalStatisticsEntryFromJson(Map<String, dynamic> json) {
  return LocalStatisticsEntry(
    name: json['name'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    cases: json['cases'] as int,
    deaths: json['deaths'] as int,
    recoveries: json['recoveries'] as int,
  );
}

Map<String, dynamic> _$LocalStatisticsEntryToJson(
        LocalStatisticsEntry instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date?.toIso8601String(),
      'cases': instance.cases,
      'deaths': instance.deaths,
      'recoveries': instance.recoveries,
    };

LocalStatisticsLocation _$LocalStatisticsLocationFromJson(
    Map<String, dynamic> json) {
  return LocalStatisticsLocation(
    name: json['name'] as String,
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LocalStatisticsLocationToJson(
        LocalStatisticsLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location?.toJson(),
    };
