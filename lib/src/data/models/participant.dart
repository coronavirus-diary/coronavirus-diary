import 'package:json_annotation/json_annotation.dart';

part 'participant.g.dart';

@JsonSerializable()
class Participant {
  final String name;

  Participant({this.name});

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
  Map<String, dynamic> toJson() => _$ParticipantToJson(this);
}
