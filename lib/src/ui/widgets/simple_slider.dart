import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class Label {
  final Widget child;
  final double percent;

  const Label({
    @required this.child,
    @required this.percent,
  });
}

class SimpleSlider extends StatefulWidget {
  final double value;
  final Function(int handlerIndex, dynamic lowerValue, dynamic upperValue)
      onChange;
  final List<Label> labels;

  const SimpleSlider({@required this.value, this.onChange, this.labels});

  @override
  _SimpleSliderState createState() => _SimpleSliderState();
}

class _SimpleSliderState extends State<SimpleSlider> {
  double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  void _setValue(int handlerIndex, dynamic lowerValue, dynamic upperValue) {
    setState(() {
      _value = lowerValue;
    });
  }

  FlutterSliderHatchMark _getHatchMark() {
    if (widget.labels == null) return null;

    return FlutterSliderHatchMark(
      smallLine: FlutterSliderSizedBox(
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.4)),
        width: 2,
        height: 10,
      ),
      bigLine: FlutterSliderSizedBox(
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.4)),
        width: 2,
        height: 20,
      ),
      density: 0.04,
      labels: widget.labels
          .where((Label label) => label.percent != 0 && label.percent != 100)
          .map((Label label) {
        return FlutterSliderHatchMarkLabel(
          percent: label.percent,
          label: label.child,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Label firstLabel =
        widget.labels.firstWhere((Label label) => label.percent == 0);
    Label lastLabel =
        widget.labels.firstWhere((Label label) => label.percent == 100);

    return Row(
      children: <Widget>[
        if (firstLabel != null)
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: firstLabel.child,
          ),
        Expanded(
          child: FlutterSlider(
            min: 1,
            max: 5,
            onDragging: _setValue,
            onDragCompleted: _setValue,
            values: [_value],
            handler: FlutterSliderHandler(
              child: Text(_value.round().toString()),
            ),
            hatchMark: _getHatchMark(),
            tooltip: FlutterSliderTooltip(disabled: true),
            trackBar: FlutterSliderTrackBar(
              inactiveTrackBar: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.4),
              ),
              activeTrackBar: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
            ),
          ),
        ),
        if (lastLabel != null)
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: lastLabel.child,
          ),
      ],
    );
  }
}
