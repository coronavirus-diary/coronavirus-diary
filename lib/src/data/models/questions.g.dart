// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderQuestion _$SliderQuestionFromJson(Map<String, dynamic> json) {
  return SliderQuestion(
    id: json['id'],
    title: json['title'],
    subtitle: json['subtitle'],
    min: (json['min'] as num)?.toDouble(),
    max: (json['max'] as num)?.toDouble(),
    initialValue: (json['initialValue'] as num)?.toDouble(),
    labels: (json['labels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$SliderQuestionToJson(SliderQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'min': instance.min,
      'max': instance.max,
      'initialValue': instance.initialValue,
      'labels': instance.labels,
    };

UnknownQuestion _$UnknownQuestionFromJson(Map<String, dynamic> json) {
  return UnknownQuestion(
    id: json['id'],
    title: json['title'],
    subtitle: json['subtitle'],
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$UnknownQuestionToJson(UnknownQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'type': instance.type,
    };
