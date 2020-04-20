import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'locations.dart';

part 'local_statistics.g.dart';

@JsonSerializable()
class LocalStatisticsResponse {
  final List<LocalStatisticsEntry> localStatisticsEntries;
  final String error;

  const LocalStatisticsResponse({
    this.localStatisticsEntries,
    this.error,
  });

  factory LocalStatisticsResponse.fromJson(dynamic json) {
    if (json is List) {
      return _$LocalStatisticsResponseFromJson({
        'local_statistics_entries': json,
      });
    } else if (json.containsKey('message')) {
      return _$LocalStatisticsResponseFromJson({
        'error': json['message'],
      });
    } else {
      return _$LocalStatisticsResponseFromJson(json);
    }
  }

  Map<String, dynamic> toJson() => _$LocalStatisticsResponseToJson(this);

  @override
  String toString() =>
      'LocalStatisticsResponse { localStatisticsEntries: $localStatisticsEntries, error: $error }';
}

@JsonSerializable()
class LocalStatisticsEntry {
  String name;
  DateTime date;
  int cases;
  int deaths;
  int recoveries;

  LocalStatisticsEntry({
    this.name,
    this.date,
    this.cases,
    this.deaths,
    this.recoveries,
  });

  factory LocalStatisticsEntry.fromJson(Map<String, dynamic> json) =>
      _$LocalStatisticsEntryFromJson(json);

  Map<String, dynamic> toJson() => _$LocalStatisticsEntryToJson(this);

  @override
  String toString() => 'LocalStatisticsEntry { name: $name, date: $date }';
}

@JsonSerializable()
class LocalStatisticsLocation extends Equatable {
  final String name;
  final Location location;

  const LocalStatisticsLocation({
    this.name,
    this.location,
  });

  factory LocalStatisticsLocation.fromJson(Map<String, dynamic> json) =>
      _$LocalStatisticsLocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocalStatisticsLocationToJson(this);

  @override
  String toString() =>
      'LocalStatisticsLocation { name: $name, location: $location }';

  @override
  List<Object> get props => [name];
}
