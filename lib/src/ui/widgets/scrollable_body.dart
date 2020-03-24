import 'package:flutter/material.dart';

import 'scroll_more_indicator.dart';
import 'deferring_scroll_controller.dart';

class ScrollableBody extends StatefulWidget {
  final Widget child;

  const ScrollableBody({this.child});

  State<ScrollableBody> createState() => _ScrollableBodyState();
}

class _ScrollableBodyState extends State<ScrollableBody> {
  DeferringScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DeferringScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.parent = PrimaryScrollController.of(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return ScrollMoreIndicator(
          controller: _controller,
          child: SingleChildScrollView(
            controller: _controller,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: widget.child,
            ),
          ),
        );
      },
    );
  }
}
