import 'package:json_annotation/json_annotation.dart';

import 'participant.dart';

part 'event.g.dart';

abstract class Event {
  final String type;
  final DateTime timestamp;

  Event({this.type, this.timestamp});

  factory Event.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case LocationEvent.TYPE:
        return LocationEvent.fromJson(json);
      case SocialEvent.TYPE:
        return SocialEvent.fromJson(json);
      default:
        return UnknownEvent.fromJson(json);
    }
  }
  Map<String, dynamic> toJson() => throw UnimplementedError();
}

@JsonSerializable()
class LocationEvent extends Event {
  static const TYPE = 'location';

  final double latitude;
  final double longitude;
  final double accuracy;
  final double altitude;

  LocationEvent({
    type,
    timestamp,
    this.latitude,
    this.longitude,
    this.accuracy,
    this.altitude,
  }) : super(
          type: type,
          timestamp: timestamp,
        );

  factory LocationEvent.fromJson(Map<String, dynamic> json) =>
      _$LocationEventFromJson(json);
  Map<String, dynamic> toJson() => _$LocationEventToJson(this);
}

@JsonSerializable()
class SocialEvent extends Event {
  static const TYPE = 'social';

  final List<Participant> participants;

  SocialEvent({
    type,
    timestamp,
    this.participants,
  }) : super(
          type: type,
          timestamp: timestamp,
        );

  factory SocialEvent.fromJson(Map<String, dynamic> json) =>
      _$SocialEventFromJson(json);
  Map<String, dynamic> toJson() => _$SocialEventToJson(this);
}

@JsonSerializable()
class UnknownEvent extends Event {
  final Map<String, dynamic> data;

  UnknownEvent({
    type,
    timestamp,
    this.data,
  }) : super(
          type: type,
          timestamp: timestamp,
        );

  factory UnknownEvent.fromJson(Map<String, dynamic> json) =>
      _$UnknownEventFromJson(json);
  Map<String, dynamic> toJson() => _$UnknownEventToJson(this);
}
