import 'package:json_annotation/json_annotation.dart';

part 'local_statistics.g.dart';

@JsonSerializable()
class LocalStatisticsEntry {
  String date; // YYYY-MM-DD
  int cases;
  int deaths;
  int recoveries;
  String name;

  LocalStatisticsEntry({
    this.date,
    this.cases,
    this.deaths,
    this.recoveries,
    this.name,
  });

  factory LocalStatisticsEntry.fromJson(Map<String, dynamic> json) =>
      _$LocalStatisticsEntryFromJson(json);

  Map<String, dynamic> toJson() => _$LocalStatisticsEntryToJson(this);
}
