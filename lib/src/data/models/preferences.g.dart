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
    isFirstLoad: json['is_first_load'],
    consented: json['consented'],
  );
}

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'last_assessment': instance.lastAssessment?.toJson(),
      'is_first_load': instance.isFirstLoad,
      'consented': instance.consented,
    };
