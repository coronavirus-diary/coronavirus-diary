// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScaleQuestion _$ScaleQuestionFromJson(Map<String, dynamic> json) {
  return ScaleQuestion(
    id: json['id'] as String,
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    initialValue: json['initial_value'] as int,
    labels: (json['labels'] as List)?.map((e) => e as String)?.toList(),
    semanticLabels:
        (json['semantic_labels'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ScaleQuestionToJson(ScaleQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'initial_value': instance.initialValue,
      'labels': instance.labels,
      'semantic_labels': instance.semanticLabels,
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
