import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/scroll_more_indicator.dart';
import 'package:covidnearme/src/ui/widgets/tutorial_step.dart';

import 'entry_field.dart';

@immutable
class TemperatureField extends StatefulWidget {
  TemperatureField({
    Key key,
    this.initialValue,
    this.onChanged,
    this.label,
    this.helperText,
    this.minHeight = 100,
    this.autofocus = false,
  })  : assert(autofocus != null),
        super(key: key);

  final double initialValue;
  final String helperText;

  // Always returns values in fahrenheit.
  final ValueChanged<double> onChanged;

  final String label;
  final double minHeight;
  final bool autofocus;

  @override
  _TemperatureFieldState createState() => _TemperatureFieldState();
}

class _TemperatureFieldState extends State<TemperatureField> {
  static const double _celsiusMax = 65.5;
  static const double _celsiusMin = 21.1;
  static const double _fahrenheitMax = 150.0;
  static const double _fahrenheitMin = 70.0;

  bool get _isCelsius =>
      _degrees != null && _degrees <= _celsiusMax && _degrees >= _celsiusMin;

  bool get _isFahrenheit =>
      _degrees != null &&
      _degrees <= _fahrenheitMax &&
      _degrees >= _fahrenheitMin;

  bool get _isValid => _degrees != null && (_isCelsius || _isFahrenheit);

  double _degrees;
  double _reportedDegrees;

  @override
  void initState() {
    super.initState();
    _degrees = widget.initialValue;
  }

  double _toFahrenheit(double value) {
    if (_isFahrenheit) return value;
    return value * (9.0 / 5.0) + 32.0;
  }

  String _validateTemperature(String value, AppLocalizations localizations) {
    if (value.isNotEmpty) {
      final double degrees = double.parse(value);
      if (degrees < _celsiusMin ||
          degrees > _fahrenheitMax ||
          (degrees < _fahrenheitMin && degrees > _celsiusMax)) {
        return localizations.temperatureStepTemperatureOutOfRangeError;
      }
    }
    return null;
  }

  void _onChanged(String value) {
    final double degrees = double.parse(value);
    if (_degrees == degrees) {
      return;
    }
    setState(() {
      _degrees = degrees;
    });
    if (!_isValid || _degrees == _reportedDegrees) {
      return;
    }
    _reportedDegrees = degrees;
    widget.onChanged?.call(_toFahrenheit(_reportedDegrees));
  }

  Future<void> _showInstructions(BuildContext context) async {
    final categoryFontStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

    ScrollController controller = ScrollController();

    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final AppLocalizations localizations = AppLocalizations.of(context);
        final ThemeData theme = Theme.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              localizations.temperatureStepHowToDialogTitle,
              style: theme.textTheme.headline
                  .copyWith(color: theme.colorScheme.onBackground),
              textAlign: TextAlign.center,
            ),
          ),
          body: ScrollMoreIndicator(
            controller: controller,
            child: ListView(
              controller: controller,
              padding: EdgeInsets.all(20),
              children: <Widget>[
                Text(
                  localizations.temperatureStepWhenHeading,
                  style: categoryFontStyle,
                ),
                SizedBox(height: 10),
                _InstructionStep(
                  text: localizations.temperatureStepWait30Minutes,
                  number: 1,
                ),
                _InstructionStep(
                  text: localizations.temperatureStepWait6Hours,
                  number: 2,
                ),
                Text(
                  localizations.temperatureStepHowHeading,
                  style: categoryFontStyle,
                ),
                SizedBox(height: 10),
                _InstructionStep(
                  text: localizations.temperatureStepHowToDialogStep1,
                  number: 1,
                ),
                _InstructionStep(
                  text: localizations.temperatureStepHowToDialogStep2,
                  number: 2,
                ),
                _InstructionStep(
                  text: localizations.temperatureStepHowToDialogStep3,
                  number: 3,
                ),
                _InstructionStep(
                  text: localizations.temperatureStepHowToDialogStep4,
                  number: 4,
                ),
                _InstructionStep(
                  text: localizations.temperatureStepHowToDialogStep5,
                  number: 5,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                    child: RaisedButton(
                      onPressed: () => Navigator.pop(context),
                      child:
                          Text(localizations.temperatureStepHowToDialogReturn),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: EntryField(
            initialValue: widget.initialValue?.toStringAsFixed(1),
            onChanged: _onChanged,
            label: widget.label,
            suffix: _isValid ? (_isCelsius ? '℃' : '℉') : null,
            keyboardType: TextInputType.number,
            inputFormatters: [
              WhitelistingTextInputFormatter(RegExp(r'^\d+\.?\d?$')),
            ],
            minHeight: widget.minHeight,
            autofocus: widget.autofocus,
            validator: (String value) =>
                _validateTemperature(value, localizations),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10.0, top: 10.0),
            child: RaisedButton(
              onPressed: () => _showInstructions(context),
              child: Text(localizations.temperatureStepHelp),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
            ),
          ),
        ),
      ],
    );
  }
}

class _InstructionStep extends StatelessWidget {
  const _InstructionStep({Key key, this.text, this.number}) : super(key: key);

  final String text;
  final int number;

  @override
  Widget build(BuildContext context) {
    return TutorialStep(
      text: text,
      number: number,
      fontSize: 16.0,
      leadingBackgroundColor: Theme.of(context).colorScheme.secondary,
      numberColor: Theme.of(context).colorScheme.onSecondary,
    );
  }
}
