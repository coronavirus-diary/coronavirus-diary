// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextFieldQuestion _$TextFieldQuestionFromJson(Map<String, dynamic> json) {
  return TextFieldQuestion(
    id: json['id'] as String,
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    initialValue: json['initial_value'] as String,
  );
}

Map<String, dynamic> _$TextFieldQuestionToJson(TextFieldQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'initial_value': instance.initialValue,
    };

TemperatureQuestion _$TemperatureQuestionFromJson(Map<String, dynamic> json) {
  return TemperatureQuestion(
    id: json['id'] as String,
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    initialValue: (json['initial_value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TemperatureQuestionToJson(
        TemperatureQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'initial_value': instance.initialValue,
    };

ScaleQuestion _$ScaleQuestionFromJson(Map<String, dynamic> json) {
  return ScaleQuestion(
    id: json['id'] as String,
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    initialValue: json['initial_value'] as String,
    values: (json['values'] as List)?.map((e) => e as String)?.toList(),
    labels: (json['labels'] as List)?.map((e) => e as String)?.toList(),
    semanticLabels:
        (json['semantic_labels'] as List)?.map((e) => e as String)?.toList(),
    vertical: json['vertical'] as bool,
  );
}

Map<String, dynamic> _$ScaleQuestionToJson(ScaleQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'initial_value': instance.initialValue,
      'values': instance.values,
      'labels': instance.labels,
      'semantic_labels': instance.semanticLabels,
      'vertical': instance.vertical,
    };

UnknownQuestion _$UnknownQuestionFromJson(Map<String, dynamic> json) {
  return UnknownQuestion(
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$UnknownQuestionToJson(UnknownQuestion instance) =>
    <String, dynamic>{
      'type': instance.type,
    };
