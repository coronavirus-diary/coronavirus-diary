// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preferences _$PreferencesFromJson(Map<String, dynamic> json) {
  return Preferences(
    userId: json['user_id'] as String,
    completedTutorial: json['completed_tutorial'] as bool,
    agreedToTerms: json['agreed_to_terms'] as bool,
    location: json['location'] == null
        ? null
        : UserLocation.fromJson(json['location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'completed_tutorial': instance.completedTutorial,
      'agreed_to_terms': instance.agreedToTerms,
      'location': instance.location?.toJson(),
    };
