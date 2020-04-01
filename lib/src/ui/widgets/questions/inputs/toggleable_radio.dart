// Modified from the Flutter codebase to add the toggleable attribute so
// that Radios can be toggled off again by just clicking on the selected value.

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

const double _kOuterRadius = 8.0;
const double _kInnerRadius = 4.5;

/// A material design radio button.
///
/// Used to select between a number of mutually exclusive values. When one radio
/// button in a group is selected, the other radio buttons in the group cease to
/// be selected. The values are of type `T`, the type parameter of the [ToggleableRadio]
/// class. Enums are commonly used for this purpose.
///
/// The radio button itself does not maintain any state. Instead, selecting the
/// radio invokes the [onChanged] callback, passing [value] as a parameter. If
/// [groupValue] and [value] match, this radio will be selected. Most widgets
/// will respond to [onChanged] by calling [State.setState] to update the
/// radio button's [groupValue].
///
/// {@tool snippet --template=stateful_widget_scaffold_center}
///
/// Here is an example of Radio widgets wrapped in ListTiles, which is similar
/// to what you could get with the RadioListTile widget.
///
/// The currently selected character is passed into `groupValue`, which is
/// maintained by the example's `State`. In this case, the first `Radio`
/// will start off selected because `_character` is initialized to
/// `SingingCharacter.lafayette`.
///
/// If the second radio button is pressed, the example's state is updated
/// with `setState`, updating `_character` to `SingingCharacter.jefferson`.
/// This causes the buttons to rebuild with the updated `groupValue`, and
/// therefore the selection of the second button.
///
/// Requires one of its ancestors to be a [Material] widget.
///
/// ```dart preamble
/// enum SingingCharacter { lafayette, jefferson }
/// ```
///
/// ```dart
/// SingingCharacter _character = SingingCharacter.lafayette;
///
/// Widget build(BuildContext context) {
///   return Column(
///     children: <Widget>[
///       ListTile(
///         title: const Text('Lafayette'),
///         leading: Radio(
///           value: SingingCharacter.lafayette,
///           groupValue: _character,
///           onChanged: (SingingCharacter value) {
///             setState(() { _character = value; });
///           },
///         ),
///       ),
///       ListTile(
///         title: const Text('Thomas Jefferson'),
///         leading: Radio(
///           value: SingingCharacter.jefferson,
///           groupValue: _character,
///           onChanged: (SingingCharacter value) {
///             setState(() { _character = value; });
///           },
///         ),
///       ),
///     ],
///   );
/// }
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [RadioListTile], which combines this widget with a [ListTile] so that
///    you can give the radio button a label.
///  * [Slider], for selecting a value in a range.
///  * [Checkbox] and [Switch], for toggling a particular value on or off.
///  * <https://material.io/design/components/selection-controls.html#radio-buttons>
class ToggleableRadio<T> extends StatefulWidget {
  /// Creates a material design radio button.
  ///
  /// The radio button itself does not maintain any state. Instead, when the
  /// radio button is selected, the widget calls the [onChanged] callback. Most
  /// widgets that use a radio button will listen for the [onChanged] callback
  /// and rebuild the radio button with a new [groupValue] to update the visual
  /// appearance of the radio button.
  ///
  /// The following arguments are required:
  ///
  /// * [value] and [groupValue] together determine whether the radio button is
  ///   selected.
  /// * [onChanged] is called when the user selects this radio button.
  const ToggleableRadio({
    Key key,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    this.toggleable = true,
    this.activeColor,
    this.focusColor,
    this.hoverColor,
    this.materialTapTargetSize,
    this.focusNode,
    this.autofocus = false,
  })  : assert(autofocus != null),
        super(key: key);

  /// Set to true if this radio is allowed to be returned to a "nothing
  /// selected" state by clicking on it when selected.
  final bool toggleable;

  /// The value represented by this radio button.
  final T value;

  /// The currently selected value for a group of radio buttons.
  ///
  /// This radio button is considered selected if its [value] matches the
  /// [groupValue].
  final T groupValue;

  /// Called when the user selects this radio button.
  ///
  /// The radio button passes [value] as a parameter to this callback. The radio
  /// button does not actually change state until the parent widget rebuilds the
  /// radio button with the new [groupValue].
  ///
  /// If null, the radio button will be displayed as disabled.
  ///
  /// The provided callback will not be invoked if this radio button is already
  /// selected.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// Radio<SingingCharacter>(
  ///   value: SingingCharacter.lafayette,
  ///   groupValue: _character,
  ///   onChanged: (SingingCharacter newValue) {
  ///     setState(() {
  ///       _character = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<T> onChanged;

  /// The color to use when this radio button is selected.
  ///
  /// Defaults to [ThemeData.toggleableActiveColor].
  final Color activeColor;

  /// Configures the minimum size of the tap target.
  ///
  /// Defaults to [ThemeData.materialTapTargetSize].
  ///
  /// See also:
  ///
  ///  * [MaterialTapTargetSize], for a description of how this affects tap targets.
  final MaterialTapTargetSize materialTapTargetSize;

  /// The color for the radio's [Material] when it has the input focus.
  final Color focusColor;

  /// The color for the radio's [Material] when a pointer is hovering over it.
  final Color hoverColor;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  @override
  _ToggleableRadioState<T> createState() => _ToggleableRadioState<T>();
}

class _ToggleableRadioState<T> extends State<ToggleableRadio<T>>
    with TickerProviderStateMixin {
  bool get enabled => widget.onChanged != null;
  Map<LocalKey, ActionFactory> _actionMap;

  @override
  void initState() {
    super.initState();
    _actionMap = <LocalKey, ActionFactory>{
      SelectAction.key: _createAction,
      if (!kIsWeb) ActivateAction.key: _createAction,
    };
  }

  void _actionHandler(FocusNode node, Intent intent) {
    if (widget.onChanged != null) {
      widget.onChanged(widget.value);
    }
    final RenderObject renderObject = node.context.findRenderObject();
    renderObject.sendSemanticsEvent(const TapSemanticEvent());
  }

  Action _createAction() {
    return CallbackAction(
      SelectAction.key,
      onInvoke: _actionHandler,
    );
  }

  bool _focused = false;
  void _handleHighlightChanged(bool focused) {
    if (_focused != focused) {
      setState(() {
        _focused = focused;
      });
    }
  }

  bool _hovering = false;
  void _handleHoverChanged(bool hovering) {
    if (_hovering != hovering) {
      setState(() {
        _hovering = hovering;
      });
    }
  }

  Color _getInactiveColor(ThemeData themeData) {
    return enabled ? themeData.unselectedWidgetColor : themeData.disabledColor;
  }

  void _handleChanged(bool selected) {
    if (selected == null) {
      widget.onChanged(null);
      return;
    }
    if (selected) {
      widget.onChanged(widget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    final ThemeData themeData = Theme.of(context);
    Size size;
    switch (widget.materialTapTargetSize ?? themeData.materialTapTargetSize) {
      case MaterialTapTargetSize.padded:
        size = const Size(
            2 * kRadialReactionRadius + 8.0, 2 * kRadialReactionRadius + 8.0);
        break;
      case MaterialTapTargetSize.shrinkWrap:
        size = const Size(2 * kRadialReactionRadius, 2 * kRadialReactionRadius);
        break;
    }
    final BoxConstraints additionalConstraints = BoxConstraints.tight(size);
    return FocusableActionDetector(
      actions: _actionMap,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      enabled: enabled,
      onShowFocusHighlight: _handleHighlightChanged,
      onShowHoverHighlight: _handleHoverChanged,
      child: Builder(
        builder: (BuildContext context) {
          return _RadioRenderObjectWidget(
            toggleable: widget.toggleable,
            selected: widget.value == widget.groupValue,
            activeColor: widget.activeColor ?? themeData.toggleableActiveColor,
            inactiveColor: _getInactiveColor(themeData),
            focusColor: widget.focusColor ?? themeData.focusColor,
            hoverColor: widget.hoverColor ?? themeData.hoverColor,
            onChanged: enabled ? _handleChanged : null,
            additionalConstraints: additionalConstraints,
            vsync: this,
            hasFocus: _focused,
            hovering: _hovering,
          );
        },
      ),
    );
  }
}

class _RadioRenderObjectWidget extends LeafRenderObjectWidget {
  const _RadioRenderObjectWidget({
    Key key,
    @required this.selected,
    @required this.activeColor,
    @required this.inactiveColor,
    @required this.focusColor,
    @required this.hoverColor,
    @required this.additionalConstraints,
    this.onChanged,
    @required this.toggleable,
    @required this.vsync,
    @required this.hasFocus,
    @required this.hovering,
  })  : assert(selected != null),
        assert(activeColor != null),
        assert(inactiveColor != null),
        assert(vsync != null),
        super(key: key);

  final bool selected;
  final bool hasFocus;
  final bool hovering;
  final Color inactiveColor;
  final Color activeColor;
  final Color focusColor;
  final Color hoverColor;
  final ValueChanged<bool> onChanged;
  final bool toggleable;
  final TickerProvider vsync;
  final BoxConstraints additionalConstraints;

  @override
  _RenderRadio createRenderObject(BuildContext context) => _RenderRadio(
        value: selected,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        onChanged: onChanged,
        tristate: toggleable,
        vsync: vsync,
        additionalConstraints: additionalConstraints,
        hasFocus: hasFocus,
        hovering: hovering,
      );

  @override
  void updateRenderObject(BuildContext context, _RenderRadio renderObject) {
    renderObject
      ..value = selected
      ..activeColor = activeColor
      ..inactiveColor = inactiveColor
      ..focusColor = focusColor
      ..hoverColor = hoverColor
      ..onChanged = onChanged
      ..tristate = toggleable
      ..additionalConstraints = additionalConstraints
      ..vsync = vsync
      ..hasFocus = hasFocus
      ..hovering = hovering;
  }
}

class _RenderRadio extends RenderToggleable {
  _RenderRadio({
    bool value,
    Color activeColor,
    Color inactiveColor,
    Color focusColor,
    Color hoverColor,
    ValueChanged<bool> onChanged,
    bool tristate,
    BoxConstraints additionalConstraints,
    @required TickerProvider vsync,
    bool hasFocus,
    bool hovering,
  }) : super(
          value: value,
          tristate: tristate,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          onChanged: onChanged,
          additionalConstraints: additionalConstraints,
          vsync: vsync,
          hasFocus: hasFocus,
          hovering: hovering,
        );

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;

    paintRadialReaction(canvas, offset, size.center(Offset.zero));

    final Offset center = (offset & size).center;
    final Color radioColor = onChanged != null ? activeColor : inactiveColor;

    // Outer circle
    final Paint paint = Paint()
      ..color = Color.lerp(inactiveColor, radioColor, position.value)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawCircle(center, _kOuterRadius, paint);

    // Inner circle
    if (!position.isDismissed) {
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(center, _kInnerRadius * position.value, paint);
    }
  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);
    config
      ..isInMutuallyExclusiveGroup = true
      ..isChecked = value == true;
  }
}
