import 'package:covidnearme/src/ui/widgets/questions/inputs/labeled_radio.dart';
import 'package:flutter/material.dart';

abstract class RadioButtonScale extends StatelessWidget {
  const RadioButtonScale._({Key key}) : super(key: key);

  factory RadioButtonScale({
    Key key,
    int value,
    @required List<String> labels,
    @required List<String> semanticLabels,
    ValueChanged<int> onChanged,
    Axis axis = Axis.horizontal,
  }) {
    switch (axis) {
      case Axis.horizontal:
        return _HorizontalButtonScale(
          key: key,
          value: value,
          labels: labels,
          semanticLabels: semanticLabels,
          onChanged: onChanged,
        );
      case Axis.vertical:
        return _VerticalButtonScale(
          key: key,
          value: value,
          labels: labels,
          semanticLabels: semanticLabels,
          onChanged: onChanged,
        );
    }
    return null;
  }

  int get value;
  List<String> get labels;
  List<String> get semanticLabels;
  ValueChanged<int> get onChanged;
  bool get enabled => onChanged != null;
}

class _HorizontalButtonScale extends RadioButtonScale {
  const _HorizontalButtonScale({
    Key key,
    this.value,
    @required this.labels,
    @required this.semanticLabels,
    this.onChanged,
  })  : assert(labels != null),
        assert(semanticLabels != null),
        assert(semanticLabels.length == labels.length),
        _isScale = labels.length > 2,
        super._(key: key);

  final int value;
  final List<String> labels;
  final List<String> semanticLabels;
  final ValueChanged<int> onChanged;
  final bool _isScale;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (int index = 0; index < labels.length; ++index)
                Expanded(
                  flex: 2,
                  child: LabeledRadio(
                    label: labels[index],
                    semanticsLabel: semanticLabels[index],
                    semanticsValue: '${index + 1}',
                    onChanged: () => onChanged(index),
                    value: index,
                    groupValue: value,
                    axis: Axis.vertical,
                  ),
                ),
            ],
          ),
          if (_isScale)
            Positioned(
              top: 19,
              left: 0,
              right: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(flex: 1),
                  for (int index = 0; index < labels.length - 1; ++index)
                    Expanded(
                        flex: 2,
                        child: Divider(
                          height: 10,
                          thickness: 5.0,
                          endIndent: 14,
                          indent: 14,
                          color: Colors.black38,
                        )),
                  Spacer(flex: 1),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _VerticalButtonScale extends RadioButtonScale {
  const _VerticalButtonScale({
    Key key,
    this.value,
    @required this.labels,
    @required this.semanticLabels,
    this.onChanged,
  })  : assert(labels != null),
        assert(semanticLabels != null),
        assert(semanticLabels.length == labels.length),
        super._(key: key);

  final int value;
  final List<String> labels;
  final List<String> semanticLabels;
  final ValueChanged<int> onChanged;
  bool get enabled => onChanged != null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (int index = 0; index < labels.length; ++index)
                LabeledRadio(
                  label: labels[index],
                  semanticsLabel: semanticLabels[index],
                  semanticsValue: '${index + 1}',
                  onChanged: () => onChanged(index),
                  value: index,
                  groupValue: value,
                  axis: Axis.horizontal,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
