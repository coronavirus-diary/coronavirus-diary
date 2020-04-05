import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'questions.g.dart';

abstract class Question {
  const Question();

  String get id;
  String get title;
  String get subtitle;

  factory Question.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case ScaleQuestion.TYPE:
        return ScaleQuestion.fromJson(json);
      case TextFieldQuestion.TYPE:
        return TextFieldQuestion.fromJson(json);
      case TemperatureQuestion.TYPE:
        return TemperatureQuestion.fromJson(json);
      case CompositeQuestion.TYPE:
        return CompositeQuestion.fromJson(json);
      default:
        return UnknownQuestion.fromJson(json);
    }
  }
  Map<String, dynamic> toJson() => throw UnimplementedError();
}

class CompositeQuestion extends Question {
  static const TYPE = 'composite';

  CompositeQuestion({
    @required this.children,
    @required this.answers,
  })  : assert(children != null),
        assert(children.isNotEmpty),
        assert(answers.length == children.length - 1);

  String get id => children[0].id;
  String get title => children[0].title;
  String get subtitle => children[0].subtitle;

  final List<Question> children;
  // A list of answers, matching the answer needed for the previous question to
  // reveal the next.
  // There must be one fewer answer than the number of questions.
  final List<dynamic> answers;

  factory CompositeQuestion.fromJson(Map<String, dynamic> json) {
    List<Question> children = <Question>[];
    List<dynamic> answers = <String>[];
    int childCount = json['num_children'];
    for (int i = 0; i < childCount; ++i) {
      children.add(Question.fromJson(json['child_$i']));
      if (i < childCount - 1) {
        answers.add(json['answer_$i']);
      }
    }
    return CompositeQuestion(
      children: children,
      answers: answers,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {'type': TYPE};
    json['num_children'] = children.length;
    for (int i = 0; i < children.length; ++i) {
      json['child_$i'] = children[i].toJson();
    }
    json['id'] = '';
    json['title'] = '';
    json['subtitle'] = '';
    return json;
  }
}

// Returns null if the input value is valid, and a localized error string if it
// is not valid,
typedef TextFieldQuestionValidator = String Function(String value);

@JsonSerializable()
class TextFieldQuestion extends Question {
  static const TYPE = 'text_field';

  final String id;
  final String title;
  final String subtitle;
  final String initialValue;

  TextFieldQuestion({
    @required this.id,
    @required this.title,
    this.subtitle,
    this.initialValue,
  })  : assert(id != null),
        assert(title != null),
        assert(title.isNotEmpty);

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

  final String id;
  final String title;
  final String subtitle;
  final double initialValue;

  TemperatureQuestion({
    @required this.id,
    @required this.title,
    this.subtitle,
    this.initialValue,
  })  : assert(id != null),
        assert(title != null),
        assert(title.isNotEmpty);

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

  final String id;
  final String title;
  final String subtitle;
  final String initialValue;
  final List<String> values;
  final List<String> labels;
  final List<String> semanticLabels;
  final bool vertical;

  ScaleQuestion({
    @required this.id,
    @required this.title,
    this.subtitle,
    this.initialValue,
    this.values,
    @required this.labels,
    @required this.semanticLabels,
    this.vertical = false,
  })  : assert(id != null),
        assert(title != null),
        assert(title.isNotEmpty),
        assert(labels != null),
        assert(semanticLabels != null),
        assert(vertical != null);

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

  String get id => 'unknown';
  String get title => 'unknown title';
  String get subtitle => 'unknown subtitle';

  UnknownQuestion({
    @required this.type,
  });

  factory UnknownQuestion.fromJson(Map<String, dynamic> json) =>
      _$UnknownQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$UnknownQuestionToJson(this);
}
