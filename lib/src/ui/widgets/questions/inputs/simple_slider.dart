import 'dart:math' as math;

import 'package:flutter/material.dart';

class SimpleSlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final Function(double value) onChange;
  final Map<String, String> labels;
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

  void _onChanged(double value) {
    setState(() {
      _value = value;
    });
    widget.onChange(value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final int divisions = widget.max.round();
    Set<int> longLabels = widget.labels == null
        ? const <int>{}
        : Set.from(widget.labels.keys.map(int.parse));
    List<Widget> bottomLabelsChildren = [];
    final labels = widget.labels == null ? Map() : widget.labels;
    for (int i = 0; i <= divisions; i++) {
      String label = labels[i.toString()];
      if (label == null) {
        bottomLabelsChildren.add(Spacer(
          flex: 9,
        ));
      } else {
        bottomLabelsChildren.add(
          Expanded(
            flex: 10,
            child: Center(
                child: Text(
              label,
              textAlign: TextAlign.center,
            )),
          ),
        );
      }
    }

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
                  activeTrackColor: Theme.of(context).colorScheme.onSurface,
                  inactiveTrackColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                  thumbColor: Theme.of(context).primaryColor,
                  tickMarkShape: SliderTickMarkShape.noTickMark,
                  trackShape: _HatchedTrackShape(
                    hatchCount: divisions + 1,
                    longHatches: longLabels,
                  ),
                  thumbShape: _ValuedThumbShape(
                    valuePainter: TextPainter()
                      ..text = TextSpan(
                        style: TextStyle(
                          fontSize: 16,
                          color: theme.colorScheme.onSecondary,
                        ),
                        text: '${_value.round() + 1}',
                      )
                      ..textDirection = Directionality.of(context)
                      ..textScaleFactor =
                          MediaQuery.of(context).textScaleFactor,
                  ),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 32),
                  overlayColor: Colors.white12,
                  valueIndicatorShape: _RectangularSliderValueIndicatorShape(),
                  valueIndicatorColor: Color.alphaBlend(
                    theme.colorScheme.onSurface.withOpacity(0.60),
                    theme.colorScheme.surface.withOpacity(0.90),
                  ),
                  valueIndicatorTextStyle: TextStyle(
                    fontSize: 16,
                    color: theme.colorScheme.surface,
                  ),
                ),
                child: Slider(
                  min: widget.min,
                  max: widget.max,
                  value: _value,
                  divisions: divisions,
                  label: '${_value.round() + 1}',
                  onChanged: _onChanged,
                  semanticFormatterCallback: (double value) {
                    return '${value.round() + 1} of ${widget.max.round() + 1}';
                  },
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
        Row(
          children: bottomLabelsChildren,
        ),
      ],
    );
  }
}

// The following shapes are derived from the latest Material Slider from
// https://github.com/flutter/flutter/blob/d121b5bfa9ff51726aa2af84081653e66ba76d47/packages/flutter/lib/src/material/slider_theme.dart
// They have been modified to fit the theme of this app.

class _ValuedThumbShape extends RoundSliderThumbShape {
  static const double _radius = 20;

  _ValuedThumbShape({this.valuePainter});

  final TextPainter valuePainter;

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
    valuePainter.layout();
    final double radius = [
      labelPainter.width / 2 * math.sqrt2,
      labelPainter.height / 2 * math.sqrt2,
      _radius,
    ].reduce(math.max);

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
        math.pi * 2,
      );
    context.canvas.drawShadow(path, Colors.black, evaluatedElevation, true);

    context.canvas.drawCircle(
      center,
      radius,
      Paint()..color = sliderTheme.thumbColor,
    );

    if (activationAnimation.value == 0) {
      valuePainter.paint(
        context.canvas,
        center - Offset(labelPainter.width / 2, labelPainter.height / 2),
      );
    }
  }
}

class _HatchedTrackShape extends SliderTrackShape {
  _HatchedTrackShape({
    this.hatchCount = 5,
    this.longHatches = const {},
  });

  final int hatchCount;
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
        parentBox.size.width - math.max(thumbWidth, overlayWidth);
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

    for (int i = 0; i < hatchCount; i++) {
      final int index = textDirection == TextDirection.rtl ? hatchCount - i : i;
      final double x =
          trackRect.left + index / (hatchCount - 1) * trackRect.width;
      context.canvas.drawRect(
        Rect.fromLTWH(
          x - _hatchWidth / 2,
          trackRect.bottom + 2, // Leave a small gap from the track.
          _hatchWidth,
          longHatches.contains(i) ? _longHatchHeight : _hatchHeight,
        ),
        inactivePaint,
      );
    }
  }
}

class _RectangularSliderValueIndicatorShape extends SliderComponentShape {
  /// Create a slider value indicator that resembles a rectangular tooltip.
  const _RectangularSliderValueIndicatorShape();

  static const _RectangularSliderValueIndicatorPathPainter _pathPainter =
      _RectangularSliderValueIndicatorPathPainter();

  @override
  Size getPreferredSize(
    bool isEnabled,
    bool isDiscrete,
  ) {
    return _pathPainter.getPreferredSize(isEnabled, isDiscrete);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) {
    final Canvas canvas = context.canvas;
    final double scale = activationAnimation.value;
    _pathPainter.paint(
      parentBox: parentBox,
      canvas: canvas,
      center: center,
      scale: scale,
      labelPainter: labelPainter,
      backgroundPaintColor: sliderTheme.valueIndicatorColor,
    );
  }
}

class _RectangularSliderValueIndicatorPathPainter {
  const _RectangularSliderValueIndicatorPathPainter();

  static const double _triangleHeight = 8.0;
  static const double _labelPadding = 16.0;
  static const double _preferredHeight = 32.0;
  static const double _minLabelWidth = 16.0;
  static const double _bottomTipYOffset = 16.0;
  static const double _preferredHalfHeight = _preferredHeight / 2;
  static const double _upperRectRadius = 4;

  Size getPreferredSize(
    bool isEnabled,
    bool isDiscrete,
  ) {
    return Size(
      _minLabelWidth + _labelPadding * 2,
      _preferredHeight,
    );
  }

  double _upperRectangleWidth(
      TextPainter labelPainter, double scale, double textScaleFactor) {
    final double unscaledWidth =
        math.max(_minLabelWidth * textScaleFactor, labelPainter.width) +
            _labelPadding * 2;
    return unscaledWidth * scale;
  }

  void paint({
    RenderBox parentBox,
    Canvas canvas,
    Offset center,
    double scale,
    TextPainter labelPainter,
    Color backgroundPaintColor,
    Color strokePaintColor,
  }) {
    if (scale == 0.0) {
      // Zero scale essentially means "do not draw anything", so it's safe to just return.
      return;
    }

    labelPainter.layout();
    final double textScaleFactor = labelPainter.height / 16;

    final double rectangleWidth =
        _upperRectangleWidth(labelPainter, scale, textScaleFactor);

    final double rectHeight = labelPainter.height + _labelPadding;
    final Rect upperRect = Rect.fromLTWH(
      -rectangleWidth / 2,
      -_triangleHeight - rectHeight,
      rectangleWidth,
      rectHeight,
    );

    final Path trianglePath = Path()
      ..lineTo(-_triangleHeight, -_triangleHeight)
      ..lineTo(_triangleHeight, -_triangleHeight)
      ..close();
    final Paint fillPaint = Paint()..color = backgroundPaintColor;
    final RRect upperRRect = RRect.fromRectAndRadius(
        upperRect, const Radius.circular(_upperRectRadius));
    trianglePath.addRRect(upperRRect);

    canvas.save();
    // Prepare the canvas for the base of the tooltip, which is relative to the
    // center of the thumb.
    canvas.translate(
        center.dx, center.dy - _bottomTipYOffset * textScaleFactor);
    canvas.scale(scale, scale);
    if (strokePaintColor != null) {
      final Paint strokePaint = Paint()
        ..color = strokePaintColor
        ..strokeWidth = 1.0
        ..style = PaintingStyle.stroke;
      canvas.drawPath(trianglePath, strokePaint);
    }
    canvas.drawPath(trianglePath, fillPaint);

    // The label text is centered within the value indicator.
    final double bottomTipToUpperRectTranslateY =
        -_preferredHalfHeight / 2 - upperRect.height;
    canvas.translate(0, bottomTipToUpperRectTranslateY);
    final Offset boxCenter = Offset(0, upperRect.height / 2);
    final Offset halfLabelPainterOffset =
        Offset(labelPainter.width / 2, labelPainter.height / 2);
    final Offset labelOffset = boxCenter - halfLabelPainterOffset;
    labelPainter.paint(canvas, labelOffset);
    canvas.restore();
  }
}
