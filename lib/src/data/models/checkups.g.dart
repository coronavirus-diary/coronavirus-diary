// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkups.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checkup _$CheckupFromJson(Map<String, dynamic> json) {
  return Checkup(
    id: json['id'] as String,
    userId: json['user_id'] as String,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    dataContributionPreference: json['data_contribution_preference'],
    location: json['location'] == null
        ? null
        : CheckupLocation.fromJson(json['location'] as Map<String, dynamic>),
    subjectiveResponses: json['subjective_responses'],
    vitalsResponses: json['vitals_responses'],
  );
}

Map<String, dynamic> _$CheckupToJson(Checkup instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'created': instance.created?.toIso8601String(),
      'data_contribution_preference': instance.dataContributionPreference,
      'location': instance.location?.toJson(),
      'subjective_responses':
          instance.subjectiveResponses?.map((e) => e?.toJson())?.toList(),
      'vitals_responses':
          instance.vitalsResponses?.map((e) => e?.toJson())?.toList(),
    };

SubjectiveQuestionResponse _$SubjectiveQuestionResponseFromJson(
    Map<String, dynamic> json) {
  return SubjectiveQuestionResponse(
    id: json['id'] as String,
    response: json['response'],
  );
}

Map<String, dynamic> _$SubjectiveQuestionResponseToJson(
        SubjectiveQuestionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'response': instance.response,
    };

VitalsResponse _$VitalsResponseFromJson(Map<String, dynamic> json) {
  return VitalsResponse(
    id: json['id'] as String,
    response: json['response'],
    dataSource: json['data_source'] as String,
  );
}

Map<String, dynamic> _$VitalsResponseToJson(VitalsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'response': instance.response,
      'data_source': instance.dataSource,
    };

CheckupLocation _$CheckupLocationFromJson(Map<String, dynamic> json) {
  return CheckupLocation(
    postalCode: json['postal_code'] as String,
  );
}

Map<String, dynamic> _$CheckupLocationToJson(CheckupLocation instance) =>
    <String, dynamic>{
      'postal_code': instance.postalCode,
    };
