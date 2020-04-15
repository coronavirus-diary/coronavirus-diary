// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preferences _$PreferencesFromJson(Map<String, dynamic> json) {
  return Preferences(
    userId: json['user_id'] as String,
    completedTutorial: json['completed_tutorial'] as bool,
    acceptedInformedConsent: json['accepted_informed_consent'] as bool,
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    recentLocalStatisticsLocations: json['recent_local_statistics_locations'],
  );
}

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'completed_tutorial': instance.completedTutorial,
      'accepted_informed_consent': instance.acceptedInformedConsent,
      'location': instance.location?.toJson(),
      'recent_local_statistics_locations': instance
          .recentLocalStatisticsLocations
          ?.map((e) => e?.toJson())
          ?.toList(),
    };
