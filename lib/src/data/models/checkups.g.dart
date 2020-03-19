// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkups.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checkup _$CheckupFromJson(Map<String, dynamic> json) {
  return Checkup(
    id: json['id'] as String,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    subjectiveResponses: (json['subjective_responses'] as List)
        ?.map((e) => e == null
            ? null
            : SubjectiveQuestionResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    vitalsResponses: (json['vitals_responses'] as List)
        ?.map((e) => e == null
            ? null
            : VitalsResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CheckupToJson(Checkup instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'subjective_responses':
          instance.subjectiveResponses?.map((e) => e?.toJson())?.toList(),
      'vitals_responses':
          instance.vitalsResponses?.map((e) => e?.toJson())?.toList(),
    };

SubjectiveQuestionResponse _$SubjectiveQuestionResponseFromJson(
    Map<String, dynamic> json) {
  return SubjectiveQuestionResponse(
    id: json['id'] as String,
    response: json['response'] as String,
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
    response: json['response'] as String,
    dataSource: json['data_source'] as String,
  );
}

Map<String, dynamic> _$VitalsResponseToJson(VitalsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'response': instance.response,
      'data_source': instance.dataSource,
    };
