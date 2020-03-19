import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

export 'package:flutter_xlider/flutter_xlider.dart';

class SimpleSlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final Function(int handlerIndex, dynamic lowerValue, dynamic upperValue)
      onChange;
  final List<FlutterSliderHatchMarkLabel> labels;
  final Widget startIcon;
  final Widget endIcon;

  const SimpleSlider({
    @required this.value,
    @required this.min,
    @required this.max,
    this.onChange,
    this.labels,
    this.startIcon,
    this.endIcon,
  });

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
      labels: widget.labels,
      labelBox: FlutterSliderSizedBox(
        width: 100,
        height: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(_value);
    return DefaultTextStyle(
      style: TextStyle(color: Colors.white),
      child: Row(
        children: <Widget>[
          if (widget.startIcon != null)
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: widget.startIcon,
            ),
          Expanded(
            child: FlutterSlider(
              min: widget.min,
              max: widget.max,
              onDragging: _setValue,
              onDragCompleted: _setValue,
              values: [_value],
              handler: FlutterSliderHandler(
                child: Text(
                  (_value.round() + 1).toString(),
                  style: TextStyle(color: Colors.black),
                ),
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
          if (widget.endIcon != null)
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: widget.endIcon,
            ),
        ],
      ),
    );
  }
}
