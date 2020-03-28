import 'package:covidnearme/src/ui/widgets/questions/step_finished_button.dart';
import 'package:covidnearme/src/ui/widgets/scroll_more_indicator.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/checkup/checkup.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/tutorial_step.dart';
import 'package:covidnearme/src/ui/utils/checkups.dart';
import 'index.dart';

class TemperatureStep extends StatefulWidget implements CheckupStep {
  bool get isLastStep => true;

  @override
  _TemperatureStepState createState() => _TemperatureStepState();
}

class _TemperatureStepState extends State<TemperatureStep> {
  bool _isCelsius = false;
  bool _isValid = false;

  String _validateTemperature(String value) {
    if (value != '') {
      final double numberValue = double.parse(value);

      // TODO(hansmuller) l10n
      if (numberValue > _upperTemperatureLimit) {
        return 'Please enter a value below ${_formatTemperature(_upperTemperatureLimit)}';
      } else if (numberValue < _lowerTemperatureLimit) {
        return 'Please enter a value above ${_formatTemperature(_lowerTemperatureLimit)}';
      }
    }
    return null;
  }

  double get _upperTemperatureLimit => _isCelsius ? 65.5 : 150.0;
  double get _lowerTemperatureLimit => _isCelsius ? 21.1 : 70.0;
  String _formatTemperature(double temperature) =>
      "$temperature ${_isCelsius ? '℃' : '℉'}";

  double _toFahrenheit(double value) {
    if (!_isCelsius) return value;
    return value * (9.0 / 5.0) + 32.0;
  }

  void _updateTemperature(
    double value,
    CheckupStateInProgress checkupState,
  ) {
    // Validate before saving
    if (_validateTemperature(value.toString()) != null) {
      if (_isValid) {
        setState(() {
          _isValid = false;
        });
        return;
      }
    } else {
      if (!_isValid) {
        setState(() {
          _isValid = true;
        });
      }
    }

    updateCheckup(
      checkupState: checkupState,
      context: context,
      updateFunction: (Checkup checkup) {
        final VitalsResponse newResponse = VitalsResponse(
          id: 'temperature',
          response: _toFahrenheit(value),
          dataSource: 'MANUAL_INPUT',
        );

        // Check if we have an existing response
        final int existingResponseIndex = checkup.vitalsResponses.indexWhere(
          (VitalsResponse response) => response.id == newResponse.id,
        );

        // Replace or add the new response
        if (existingResponseIndex != -1) {
          checkup.vitalsResponses[existingResponseIndex] = newResponse;
        } else {
          checkup.vitalsResponses.add(newResponse);
        }

        return checkup;
      },
    );
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
          appBar: AppBar(title: Text(
            localizations.temperatureStepHowToDialogTitle,
            style: theme.textTheme.headline.copyWith(color: theme.colorScheme.onBackground),
            textAlign: TextAlign.center,
          ),),
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
                  'How?',
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
    return BlocBuilder<CheckupBloc, CheckupState>(
      builder: (context, state) {
        final CheckupStateInProgress checkupState = state;
        final VitalsResponse existingResponse =
            checkupState.checkup.vitalsResponses.firstWhere(
          (VitalsResponse response) => response.id == 'temperature',
          orElse: () => null,
        );
        return ScrollableBody(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: Text(
                      localizations.temperatureStepTitle,
                      style: Theme.of(context).textTheme.title.copyWith(
                            fontSize: 26,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 100),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            initialValue: existingResponse != null
                                ? existingResponse.response.toString()
                                : '',
                            onChanged: (String value) => _updateTemperature(
                                double.parse(value), checkupState),
                            decoration: InputDecoration(
                              errorMaxLines: 2,
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.transparent,
                              labelText: 'Temperature',
                              hasFloatingPlaceholder: true,
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              WhitelistingTextInputFormatter(
                                  RegExp(r'^\d+\.?\d{0,1}$')),
                            ],
                            autovalidate: true,
                            autofocus: true,
                            validator: _validateTemperature,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(left: 10),
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                _isCelsius = !_isCelsius;
                              });
                            },
                            child:
                                _isCelsius ? const Text('℃') : const Text('℉'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, bottom: 40),
                    child: RaisedButton(
                      onPressed: () => _showInstructions(context),
                      child: Text(localizations.temperatureStepHelp),
                    ),
                  ),
                  StepFinishedButton(
                    isLastStep: true,
                    validated: _isValid,
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
