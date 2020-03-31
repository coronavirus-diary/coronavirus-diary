import 'package:flutter/material.dart';

@immutable
class RadioButtonScale extends StatelessWidget {
  const RadioButtonScale({
    Key key,
    this.value,
    @required this.labels,
    @required this.semanticLabels,
    this.onChanged,
    this.axis = Axis.horizontal,
  })  : assert(labels != null),
        assert(semanticLabels != null),
        assert(semanticLabels.length == labels.length),
        assert(axis != null),
        _isScale = labels.length > 2,
        super(key: key);

  final int value;
  final List<String> labels;
  final List<String> semanticLabels;
  final ValueChanged<int> onChanged;
  final Axis axis;
  final bool _isScale;
  bool get enabled => onChanged != null;

  @override
  Widget build(BuildContext context) {
    switch (axis) {
      case Axis.horizontal:
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
                      child: Column(
                        children: <Widget>[
                          Semantics(
                            explicitChildNodes: false,
                            label: semanticLabels[index],
                            value: '${index + 1}',
                            child: Radio<int>(
                              onChanged: onChanged,
                              value: index,
                              groupValue: value,
                              activeColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          ExcludeSemantics(
                            child: GestureDetector(
                              onTap: () => onChanged(index),
                              child: Center(
                                child: Text(
                                  labels[index],
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
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
      case Axis.vertical:
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for (int index = 0; index < labels.length; ++index)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Semantics(
                          explicitChildNodes: false,
                          label: semanticLabels[index],
                          value: '${index + 1}',
                          child: Radio<int>(
                            onChanged: onChanged,
                            value: index,
                            groupValue: value,
                            activeColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        ExcludeSemantics(
                          child: GestureDetector(
                            onTap: () => onChanged(index),
                            child: Center(
                              child: Text(
                                labels[index],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        );
    }
    assert(false, 'Axis $axis not handled.');
    return null;
  }
}
