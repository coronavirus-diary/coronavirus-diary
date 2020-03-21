// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preferences _$PreferencesFromJson(Map<String, dynamic> json) {
  return Preferences(
    userId: json['user_id'],
    completedTutorial: json['completed_tutorial'],
    agreedToTerms: json['agreed_to_terms'] as bool,
    lastAssessment: json['last_assessment'] == null
        ? null
        : Assessment.fromJson(json['last_assessment'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'completed_tutorial': instance.completedTutorial,
      'agreed_to_terms': instance.agreedToTerms,
      'last_assessment': instance.lastAssessment?.toJson(),
    };
