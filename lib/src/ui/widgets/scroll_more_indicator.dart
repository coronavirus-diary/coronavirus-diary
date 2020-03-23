import 'dart:math' as math;
import 'dart:async';

import 'package:flutter/material.dart';

import 'bob.dart';

class ScrollMoreIndicator extends StatefulWidget {
  const ScrollMoreIndicator({
    Key key,
    this.child,
    @required this.controller,
    this.margin = 50.0,
  })  : assert(controller != null),
        super(key: key);

  final Widget child;

  final double margin;

  final ScrollController controller;

  State<ScrollMoreIndicator> createState() => _ScrollMoreIndicatorState();
}

class _ScrollMoreIndicatorState extends State<ScrollMoreIndicator> {
  bool _atBottom = true;
  bool _steadyState = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleControllerUpdate);
    _handleControllerUpdate();
  }

  @override
  void didUpdateWidget(ScrollMoreIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      widget.controller.removeListener(_handleControllerUpdate);
      widget.controller.addListener(_handleControllerUpdate);
      _handleControllerUpdate();
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleControllerUpdate);
    super.dispose();
  }

  void _handleControllerUpdate() {
    if (!widget.controller.hasClients ||
        !widget.controller.position.haveDimensions) {
      return;
    }
    bool atBottom = widget.controller.position.pixels >=
        widget.controller.position.maxScrollExtent - widget.margin;
    if (atBottom != _atBottom) {
      setState(() {
        _atBottom = atBottom;
        _steadyState = false;
      });
    }
  }

  void _handleScrollDown() {
    if (!widget.controller.hasClients ||
        !widget.controller.position.haveDimensions) {
      return;
    }
    widget.controller.animateTo(
      math.min(
        widget.controller.position.pixels +
            widget.controller.position.viewportDimension,
        widget.controller.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color textColor = DefaultTextStyle.of(context).style.color;
    final Color backColor = Theme.of(context).scaffoldBackgroundColor;
    final double iconSize = 48.0 * MediaQuery.of(context).textScaleFactor;
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            scheduleMicrotask(_handleControllerUpdate);
            return widget.child;
          },
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: ExcludeSemantics(
            child: IgnorePointer(
              ignoring: _atBottom,
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      backColor.withOpacity(0.0),
                      backColor.withOpacity(_atBottom ? 0.0 : 1.0),
                    ],
                    stops: <double>[0.0, 0.5],
                  ),
                ),
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                padding: EdgeInsets.only(top: iconSize / 2.0),
                child: AnimatedOpacity(
                  opacity: _atBottom ? 0.0 : 1.0,
                  onEnd: () {
                    setState(() {
                      _steadyState = true;
                    });
                  },
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                  child: TickerMode(
                    enabled: !_atBottom || !_steadyState,
                    child: Center(
                      heightFactor: 1.0,
                      child: GestureDetector(
                        onTap: _handleScrollDown,
                        child: Stack(
                          fit: StackFit.passthrough,
                          alignment: Alignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: iconSize / 2.0),
                              child: Text('SCROLL FOR MORE',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(color: textColor)),
                            ),
                            Positioned(
                              bottom: -iconSize / 4.0,
                              child: Bob(
                                distance: iconSize / 20.0,
                                child: Icon(
                                  Icons.expand_more,
                                  color: textColor,
                                  size: iconSize,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
