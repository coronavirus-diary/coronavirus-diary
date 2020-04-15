// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
