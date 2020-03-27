import 'package:flutter/material.dart';

@immutable
class RadioButtonScale extends StatelessWidget {
  const RadioButtonScale({
    Key key,
    this.value,
    @required this.labels,
    @required this.semanticLabels,
    this.onChanged,
  })  : assert(labels != null),
        assert(semanticLabels != null),
        assert(semanticLabels.length == labels.length),
        super(key: key);

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
                        child: Radio(
                          onChanged: onChanged,
                          value: index,
                          groupValue: value,
                          activeColor: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      ExcludeSemantics(
                        child: Center(
                          child: Text(
                            labels[index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
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
