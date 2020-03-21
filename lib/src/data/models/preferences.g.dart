// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preferences _$PreferencesFromJson(Map<String, dynamic> json) {
  return Preferences(
    userId: json['user_id'],
    lastAssessment: json['last_assessment'] == null
        ? null
        : Assessment.fromJson(json['last_assessment'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'last_assessment': instance.lastAssessment?.toJson(),
    };
