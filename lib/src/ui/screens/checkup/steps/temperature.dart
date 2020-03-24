import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:covidnearme/src/blocs/checkup/checkup.dart';
import 'package:covidnearme/src/ui/widgets/tutorial_step.dart';
import 'package:covidnearme/src/ui/utils/checkups.dart';
import 'index.dart';

class TemperatureStep extends StatefulWidget implements CheckupStep {
  bool readyToContinue() => _state._readyToContinue;

  @override
  String notReadyUserMessage() => _state._validateTemperatureUserMessage;

  final _TemperatureStepState _state = _TemperatureStepState();
  @override
  _TemperatureStepState createState() => _state;
}

class _TemperatureStepState extends State<TemperatureStep> {
  bool _isCelsius = false;

  bool _readyToContinue = false;
  String _validateTemperatureUserMessage;

  String _validateTemperature(String value) {
    _validateTemperatureUserMessage = null;
    if (value == null) {
      _validateTemperatureUserMessage =
          'Please enter your temperature before continuing.';
    } else {
      final double numberValue = double.tryParse(value);
      if (numberValue == null) {
        // We force numeric keyboard, the value should always be parsable to a double unless
        // it is ''. We throw in debug to catch potential bugs.
        // Remove this if the app supports platforms like web and desktops where physical keyboard is the
        // default input method.
        assert(value == '');
        // User might use a physical keyboard even using the mobile app, we will still display an error method in production
        _validateTemperatureUserMessage = 'Please enter a temperature.';
      } else if (numberValue > _upperTemperatureLimit) {
        _validateTemperatureUserMessage =
            'Please enter a value below ${_formatTemperature(_upperTemperatureLimit)}';
      } else if (numberValue < _lowerTemperatureLimit) {
        _validateTemperatureUserMessage =
            'Please enter a value above ${_formatTemperature(_lowerTemperatureLimit)}';
      }
    }
    _readyToContinue = _validateTemperatureUserMessage == null;
    return _validateTemperatureUserMessage;
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
    if (_validateTemperature(value.toString()) != null) return;

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

  Future<void> _showInstructions() async {
    final categoryFontStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'When and how to take your temperature:',
            style: Theme.of(context).dialogTheme.titleTextStyle,
          ),
          contentPadding: EdgeInsets.all(20),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Divider(),
                Text(
                  'When?',
                  style: categoryFontStyle,
                ),
                TutorialStep(
                  text: "Wait 30 minutes after eating, drinking, or exercising",
                  number: 1,
                  textColor: Colors.black,
                ),
                TutorialStep(
                  text:
                      "Wait at least 6 hours after taking medicines that can lower your temperature (like Acetaminophen, Paracetamol, Ibuprofen, and Aspirin)",
                  number: 2,
                  textColor: Colors.black,
                ),
                Divider(),
                Text(
                  'How?',
                  style: categoryFontStyle,
                ),
                TutorialStep(
                  text: "Wash your hands using soap and water",
                  number: 1,
                  textColor: Colors.black,
                ),
                TutorialStep(
                  text:
                      "Wash the tip of your thermometer using soap and warm water or rubbing alcohol. Rinse.",
                  number: 2,
                  textColor: Colors.black,
                ),
                TutorialStep(
                  text:
                      "Put the tip of your thermometer under your tongue and gently close your lips.",
                  number: 3,
                  textColor: Colors.black,
                ),
                TutorialStep(
                  text:
                      "Keep your lips closed and the thermometer under your tongue until you hear a beep.",
                  number: 4,
                  textColor: Colors.black,
                ),
                TutorialStep(
                  text:
                      "Take out your thermometer and record your temperature.",
                  number: 5,
                  textColor: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                    child: RaisedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Return to checkup'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckupBloc, CheckupState>(
      builder: (context, state) {
        final CheckupStateInProgress checkupState = state;
        final VitalsResponse existingResponse =
            checkupState.checkup.vitalsResponses.firstWhere(
          (VitalsResponse response) => response.id == 'temperature',
          orElse: () => null,
        );
        return ScrollableBody(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Container(),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Take your temperature",
                    style: Theme.of(context).textTheme.title.copyWith(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        initialValue: existingResponse != null
                            ? existingResponse.toString()
                            : '',
                        onChanged: (String value) => _updateTemperature(
                            double.parse(value), checkupState),
                        decoration: InputDecoration(
                          errorMaxLines: 2,
                          icon: FaIcon(
                            FontAwesomeIcons.thermometerHalf,
                            color: Colors.white,
                          ),
                          labelText: 'Enter your temperature',
                          hasFloatingPlaceholder: false,
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
                        child: _isCelsius ? const Text('℃') : const Text('℉'),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: RaisedButton(
                    onPressed: _showInstructions,
                    child: Text('Need help? Click for instructions.'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
