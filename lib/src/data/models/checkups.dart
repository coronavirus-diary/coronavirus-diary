import 'package:json_annotation/json_annotation.dart';

part 'checkups.g.dart';

@JsonSerializable()
class Checkup {
  const Checkup();

  factory Checkup.fromJson(Map<String, dynamic> json) =>
      _$CheckupFromJson(json);
  Map<String, dynamic> toJson() => _$CheckupToJson(this);
}
