import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

export 'package:flutter_xlider/flutter_xlider.dart';

class SimpleSlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final Function(double value) onChange;
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
    widget.onChange(lowerValue);
  }

  void _onChanged(double value) {
    setState(() {
      _value = value;
    });
    widget.onChange(value);
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
    print(widget.labels);
    List<Widget> bottomLabelsChildren = [];

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            if (widget.startIcon != null)
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: widget.startIcon,
              ),
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 4,
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white.withOpacity(0.3),
                  thumbColor: Colors.white,
                  tickMarkShape: SliderTickMarkShape.noTickMark,
                  trackShape: HatchedTrackShape(),
                  thumbShape: ValuedThumbShape(),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 32),
                  overlayColor: Colors.white12,
                  valueIndicatorColor: Colors.white,
                  valueIndicatorTextStyle: TextStyle(color: Colors.black),
                ),
                child: Slider(
                  min: widget.min,
                  max: widget.max,
                  value: _value,
                  divisions: 4,
                  label: '${_value.round() + 1}',
                  onChanged: _onChanged,
                ),
              ),
//          child: FlutterSlider(
//            min: widget.min,
//            max: widget.max,
//            onDragging: _setValue,
//            onDragCompleted: _setValue,
//            values: [_value],
//            handler: FlutterSliderHandler(
//              child: Text(
//                (_value.round() + 1).toString(),
//                style: TextStyle(color: Colors.black),
//              ),
//            ),
//            hatchMark: _getHatchMark(),
//            tooltip: FlutterSliderTooltip(disabled: true),
//            trackBar: FlutterSliderTrackBar(
//              inactiveTrackBar: BoxDecoration(
//                borderRadius: BorderRadius.circular(20),
//                color: Colors.white.withOpacity(0.4),
//              ),
//              activeTrackBar: BoxDecoration(
//                borderRadius: BorderRadius.circular(4),
//                color: Colors.white,
//              ),
//            ),
//          ),
            ),
            if (widget.endIcon != null)
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: widget.endIcon,
              ),
          ],
        ),
//        Row(
//          children: <Widget>[
//            Expanded(
//              child: widget.labels.firstWhere((e) => e.percent == 0)?.label,
//            ),
//            Expanded(
//              child: widget.labels.firstWhere((e) => e.percent == 25)?.label,
//            ),
//            Expanded(
//              child: widget.labels.firstWhere((e) => e.percent == 50)?.label,
//            ),
//            Expanded(
//              child: widget.labels.firstWhere((e) => e.percent == 75)?.label,
//            ),
//            Expanded(
//              child: widget.labels.firstWhere((e) => e.percent == 100)?.label,
//            ),
//          ],
//        ),
      ],
    );
  }
}

class ValuedThumbShape extends RoundSliderThumbShape {
  static const double _radius = 16;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(_radius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    @required Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    @required SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) {
    labelPainter.layout();
    final double radius = [
      labelPainter.width / 2 * sqrt2,
      labelPainter.height / 2 * sqrt2,
      _radius,
    ].reduce(max);

    final Tween<double> elevationTween = Tween<double>(
      begin: 1,
      end: 6,
    );
    final double evaluatedElevation =
        elevationTween.evaluate(activationAnimation);
    final Path path = Path()
      ..addArc(
        Rect.fromCenter(
          center: center,
          width: 2 * radius,
          height: 2 * radius,
        ),
        0,
        pi * 2,
      );
    context.canvas.drawShadow(path, Colors.black, evaluatedElevation, true);

    context.canvas.drawCircle(
      center,
      radius,
      Paint()..color = sliderTheme.thumbColor,
    );

    labelPainter.paint(
      context.canvas,
      center - Offset(labelPainter.width / 2, labelPainter.height / 2),
    );
  }
}

// Derived from https://github.com/flutter/flutter/blob/d121b5bfa9ff51726aa2af84081653e66ba76d47/packages/flutter/lib/src/material/slider_theme.dart
class HatchedTrackShape extends SliderTrackShape {
  HatchedTrackShape({
    this.divisions = 4,
    this.longHatches = const {0, 4},
  });

  final int divisions;
  final Set<int> longHatches;

  static const double _hatchWidth = 2;
  static const double _hatchHeight = 10;
  static const double _longHatchHeight = 20;

  @override
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double thumbWidth =
        sliderTheme.thumbShape.getPreferredSize(isEnabled, isDiscrete).width;
    final double overlayWidth =
        sliderTheme.overlayShape.getPreferredSize(isEnabled, isDiscrete).width;
    final double trackHeight = sliderTheme.trackHeight;
    assert(overlayWidth >= 0);
    assert(trackHeight >= 0);
    assert(parentBox.size.width >= overlayWidth);
    assert(parentBox.size.height >= trackHeight);

    final double trackLeft = offset.dx + overlayWidth / 2;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth =
        parentBox.size.width - max(thumbWidth, overlayWidth);
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    @required RenderBox parentBox,
    @required SliderThemeData sliderTheme,
    @required Animation<double> enableAnimation,
    @required TextDirection textDirection,
    @required Offset thumbCenter,
    bool isDiscrete = false,
    bool isEnabled = false,
  }) {
    final double additionalActiveTrackHeight = 2;
    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(
        begin: sliderTheme.disabledInactiveTrackColor,
        end: sliderTheme.inactiveTrackColor);
    final Paint activePaint = Paint()
      ..color = activeTrackColorTween.evaluate(enableAnimation);
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation);
    Paint leftTrackPaint;
    Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final Radius activeTrackRadius = Radius.circular(trackRect.height / 2 + 1);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        (textDirection == TextDirection.ltr)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
        bottomLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
      ),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
        bottomRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
      ),
      rightTrackPaint,
    );

    for (int i = 0; i <= divisions; i++) {
      final int index = textDirection == TextDirection.rtl ? divisions - i : i;
      final double x = trackRect.left + index / divisions * trackRect.width;
      context.canvas.drawRect(
        Rect.fromLTWH(
          x - _hatchWidth / 2,
          trackRect.bottom + 4,
          _hatchWidth,
          longHatches.contains(i) ? _longHatchHeight : _hatchHeight,
        ),
        inactivePaint,
      );
    }
  }
}
