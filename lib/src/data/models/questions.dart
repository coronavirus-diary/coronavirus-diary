import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'questions.g.dart';

abstract class Question {
  final String id;
  final String title;
  final String subtitle;

  Question({
    @required this.id,
    @required this.title,
    this.subtitle,
  })  : assert(id != null),
        assert(title != null),
        assert(title.isNotEmpty);

  factory Question.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case ScaleQuestion.TYPE:
        return ScaleQuestion.fromJson(json);
      case TextFieldQuestion.TYPE:
        return TextFieldQuestion.fromJson(json);
      case TemperatureQuestion.TYPE:
        return TemperatureQuestion.fromJson(json);
      default:
        return UnknownQuestion.fromJson(json);
    }
  }
  Map<String, dynamic> toJson() => throw UnimplementedError();
}

// Returns null if the input value is valid, and a localized error string if it
// is not valid,
typedef TextFieldQuestionValidator = String Function(String value);

@JsonSerializable()
class TextFieldQuestion extends Question {
  static const TYPE = 'text_field';

  final String initialValue;

  TextFieldQuestion({
    @required String id,
    @required String title,
    String subtitle,
    this.initialValue,
  }) : super(
          id: id,
          title: title,
          subtitle: subtitle,
        );

  factory TextFieldQuestion.fromJson(Map<String, dynamic> json) =>
      _$TextFieldQuestionFromJson(json);
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$TextFieldQuestionToJson(this);
    json['type'] = TYPE;
    return json;
  }
}

@JsonSerializable()
class TemperatureQuestion extends Question {
  static const TYPE = 'temperature';

  final double initialValue;

  TemperatureQuestion({
    @required String id,
    @required String title,
    String subtitle,
    this.initialValue,
  }) : super(
          id: id,
          title: title,
          subtitle: subtitle,
        );

  factory TemperatureQuestion.fromJson(Map<String, dynamic> json) =>
      _$TemperatureQuestionFromJson(json);
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$TemperatureQuestionToJson(this);
    json['type'] = TYPE;
    return json;
  }
}

@JsonSerializable()
class ScaleQuestion extends Question {
  static const TYPE = 'scale';

  final int initialValue;
  final List<String> labels;
  final List<String> semanticLabels;
  final bool vertical;

  ScaleQuestion({
    @required String id,
    @required String title,
    String subtitle,
    this.initialValue,
    @required this.labels,
    @required this.semanticLabels,
    this.vertical = false,
  })  : assert(labels != null),
        assert(semanticLabels != null),
        assert(vertical != null),
        super(
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
    @required id,
    @required title,
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
