import 'package:json_annotation/json_annotation.dart';

part 'statistics.g.dart';

@JsonSerializable()
class StatisticsByLocation {
  String date; // YYYY-MM-DD
  int cases;
  int deaths;
  int recoveries;
  String name;

  StatisticsByLocation({
    this.date,
    this.cases,
    this.deaths,
    this.recoveries,
    this.name,
  });

  factory StatisticsByLocation.fromJson(Map<String, dynamic> json) =>
      _$StatisticsByLocationFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsByLocationToJson(this);
}