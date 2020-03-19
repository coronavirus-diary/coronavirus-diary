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
      case SliderQuestion.TYPE:
        return SliderQuestion.fromJson(json);
      default:
        return UnknownQuestion.fromJson(json);
    }
  }
  Map<String, dynamic> toJson() => throw UnimplementedError();
}

@JsonSerializable()
class SliderQuestion extends Question {
  static const TYPE = 'slider';

  final double min;
  final double max;
  final double initialValue;
  final Map<String, String> labels;

  SliderQuestion({
    id,
    title,
    subtitle,
    this.min,
    this.max,
    this.initialValue,
    this.labels,
  }) : super(
          id: id,
          title: title,
          subtitle: subtitle,
        );

  factory SliderQuestion.fromJson(Map<String, dynamic> json) =>
      _$SliderQuestionFromJson(json);
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$SliderQuestionToJson(this);
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
