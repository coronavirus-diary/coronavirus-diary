import 'package:json_annotation/json_annotation.dart';

part 'vitals.g.dart';

@JsonSerializable()
class Vitals {
  const Vitals();

  factory Vitals.fromJson(Map<String, dynamic> json) => _$VitalsFromJson(json);
  Map<String, dynamic> toJson() => _$VitalsToJson(this);
}
