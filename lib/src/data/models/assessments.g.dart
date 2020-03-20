// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Assessment _$AssessmentFromJson(Map<String, dynamic> json) {
  return Assessment(
    processed: json['processed'] == null
        ? null
        : DateTime.parse(json['processed'] as String),
    matchesPuiSymptoms: json['matches_pui_symptoms'] as bool,
  );
}

Map<String, dynamic> _$AssessmentToJson(Assessment instance) =>
    <String, dynamic>{
      'processed': instance.processed?.toIso8601String(),
      'matches_pui_symptoms': instance.matchesPuiSymptoms,
    };
