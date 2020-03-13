// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationEvent _$LocationEventFromJson(Map<String, dynamic> json) {
  return LocationEvent(
    type: json['type'],
    timestamp: json['timestamp'],
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    accuracy: (json['accuracy'] as num)?.toDouble(),
    altitude: (json['altitude'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$LocationEventToJson(LocationEvent instance) =>
    <String, dynamic>{
      'type': instance.type,
      'timestamp': instance.timestamp?.toIso8601String(),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accuracy': instance.accuracy,
      'altitude': instance.altitude,
    };

SocialEvent _$SocialEventFromJson(Map<String, dynamic> json) {
  return SocialEvent(
    type: json['type'],
    timestamp: json['timestamp'],
    participants: (json['participants'] as List)
        ?.map((e) =>
            e == null ? null : Participant.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SocialEventToJson(SocialEvent instance) =>
    <String, dynamic>{
      'type': instance.type,
      'timestamp': instance.timestamp?.toIso8601String(),
      'participants': instance.participants?.map((e) => e?.toJson())?.toList(),
    };

UnknownEvent _$UnknownEventFromJson(Map<String, dynamic> json) {
  return UnknownEvent(
    type: json['type'],
    timestamp: json['timestamp'],
    data: json['data'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$UnknownEventToJson(UnknownEvent instance) =>
    <String, dynamic>{
      'type': instance.type,
      'timestamp': instance.timestamp?.toIso8601String(),
      'data': instance.data,
    };
