import 'package:flutter/material.dart';

class RadioButtonScale extends StatefulWidget {
  RadioButtonScale({
    Key key,
    this.initialValue,
    @required this.labels,
    @required this.semanticLabels,
    this.onChanged,
  })  : assert(labels != null),
        assert(semanticLabels != null),
        assert(semanticLabels.length == labels.length),
        super(key: key);

  final int initialValue;
  final List<String> labels;
  final List<String> semanticLabels;
  final ValueChanged<int> onChanged;

  @override
  _RadioButtonScaleState createState() => _RadioButtonScaleState();
}

class _RadioButtonScaleState extends State<RadioButtonScale> {
  bool get enabled => widget.onChanged != null;
  int radioValue;

  @override
  void initState() {
    super.initState();
    radioValue = widget.initialValue;
  }

  void _handleRadioChange(int value) {
    setState(() {
      radioValue = value;
      widget.onChanged?.call(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (int index = 0; index < widget.labels.length; ++index)
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Semantics(
                        label: widget.semanticLabels[index],
                        value: '${index + 1}',
                        child: Radio(
                          onChanged: _handleRadioChange,
                          value: index,
                          groupValue: radioValue,
                          activeColor: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      ExcludeSemantics(
                        child: Center(
                          child: Text(
                            widget.labels[index],
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
                for (int index = 0; index < widget.labels.length - 1; ++index)
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
