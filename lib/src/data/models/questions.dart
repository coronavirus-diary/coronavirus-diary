import 'package:json_annotation/json_annotation.dart';

part 'questions.g.dart';

abstract class Question {
  final String id;
  final String title;
  final String subtitle;

  Question({
    this.id,
    this.title,
    this.subtitle,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case ScaleQuestion.TYPE:
        return ScaleQuestion.fromJson(json);
      default:
        return UnknownQuestion.fromJson(json);
    }
  }
  Map<String, dynamic> toJson() => throw UnimplementedError();
}

@JsonSerializable()
class ScaleQuestion extends Question {
  static const TYPE = 'slider';

  final int initialValue;
  final List<String> labels;
  final List<String> semanticLabels;

  ScaleQuestion({
    String id,
    String title,
    String subtitle,
    this.initialValue,
    this.labels,
    this.semanticLabels,
  }) : super(
          id: id,
          title: title,
          subtitle: subtitle,
        );

  factory ScaleQuestion.fromJson(Map<String, dynamic> json) =>
      _$ScaleQuestionFromJson(json);
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$ScaleQuestionToJson(this);
    json['type'] = TYPE;
    return json;
  }
}

@JsonSerializable()
class UnknownQuestion extends Question {
  final String type;

  UnknownQuestion({
    id,
    title,
    subtitle,
    this.type,
  }) : super(
          id: id,
          title: title,
          subtitle: subtitle,
        );

  factory UnknownQuestion.fromJson(Map<String, dynamic> json) =>
      _$UnknownQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$UnknownQuestionToJson(this);
}
