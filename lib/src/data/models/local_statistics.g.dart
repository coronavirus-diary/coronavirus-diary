// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalStatisticsEntry _$LocalStatisticsEntryFromJson(Map<String, dynamic> json) {
  return LocalStatisticsEntry(
    date: json['date'] as String,
    cases: json['cases'] as int,
    deaths: json['deaths'] as int,
    recoveries: json['recoveries'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$LocalStatisticsEntryToJson(
        LocalStatisticsEntry instance) =>
    <String, dynamic>{
      'date': instance.date,
      'cases': instance.cases,
      'deaths': instance.deaths,
      'recoveries': instance.recoveries,
      'name': instance.name,
    };
