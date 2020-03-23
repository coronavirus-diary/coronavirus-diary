import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class DeferringScrollController extends ChangeNotifier
    implements ScrollController {
  DeferringScrollController({this.debugLabel});

  @override
  final String debugLabel;

  ScrollController get parent => _parent;
  ScrollController _parent;
  set parent(ScrollController value) {
    if (parent != null && position != null) {
      parent.detach(position);
    }
    _parent = value;
    if (parent != null && position != null) {
      parent.attach(position);
    }
  }

  @override
  double get initialScrollOffset => parent.initialScrollOffset;

  @override
  bool get keepScrollOffset => parent.keepScrollOffset;

  @override
  ScrollPosition get position => _position;
  ScrollPosition _position;

  @override
  Iterable<ScrollPosition> get positions => <ScrollPosition>[
        if (position != null) position,
      ];

  @override
  bool get hasClients => position != null;

  @override
  void attach(ScrollPosition position) {
    assert(this.position == null);
    _position = position;
    position.addListener(notifyListeners);
    parent?.attach(position);
  }

  @override
  void detach(ScrollPosition position) {
    assert(this.position == position);
    _position = null;
    position.removeListener(notifyListeners);
    parent?.detach(position);
  }

  @override
  double get offset => position.pixels;

  @override
  ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition oldPosition,
  ) {
    assert(parent != null);
    return parent.createScrollPosition(physics, context, oldPosition);
  }

  @override
  Future<void> animateTo(
    double offset, {
    @required Duration duration,
    @required Curve curve,
  }) =>
      position.animateTo(offset, duration: duration, curve: curve);

  @override
  Future<void> jumpTo(double value) async {
    position.jumpTo(value);
  }

  @override
  void dispose() {
    if (position != null) {
      position.removeListener(notifyListeners);
    }
    super.dispose();
  }

  @override
  void debugFillDescription(List<String> description) {}

  @override
  String toString() {
    return '${describeIdentity(this)}($debugLabel; parented to $parent)';
  }
}
