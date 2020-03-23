import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class Bob extends StatefulWidget {
  Bob({
    Key key,
    this.child,
    this.distance,
  }) : super(key: key);

  final Widget child;

  final double distance;

  State<Bob> createState() => _BobState();
}

class _BobState extends State<Bob> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      lowerBound: 0.0,
      upperBound: math.pi * 2.0,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).disableAnimations) {
      return widget.child;
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(0.0, math.sin(_controller.value) * widget.distance),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
