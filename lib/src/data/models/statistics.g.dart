// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticsByLocation _$StatisticsByLocationFromJson(Map<String, dynamic> json) {
  return StatisticsByLocation(
    date: json['date'] as String,
    cases: json['cases'] as int,
    deaths: json['deaths'] as int,
    recoveries: json['recoveries'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$StatisticsByLocationToJson(
        StatisticsByLocation instance) =>
    <String, dynamic>{
      'date': instance.date,
      'cases': instance.cases,
      'deaths': instance.deaths,
      'recoveries': instance.recoveries,
      'name': instance.name,
    };
