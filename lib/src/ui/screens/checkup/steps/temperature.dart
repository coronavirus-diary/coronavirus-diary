import 'package:coronavirus_diary/src/ui/widgets/scrollable_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:coronavirus_diary/src/blocs/checkup/checkup.dart';
import 'package:coronavirus_diary/src/ui/widgets/tutorial_step.dart';
import 'package:coronavirus_diary/src/ui/utils/checkups.dart';
import 'index.dart';

class TemperatureStep extends StatefulWidget implements CheckupStep {
  @override
  _TemperatureStepState createState() => _TemperatureStepState();
}

class _TemperatureStepState extends State<TemperatureStep> {
  String _validateTemperature(String value) {
    if (value != '') {
      final double numberValue = double.parse(value);
      if (numberValue > 150) {
        return 'Please enter a value below 150 ℉';
      } else if (numberValue < 70) {
        return 'Please enter a value above 70 ℉';
      }
    }
    return null;
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
          response: value,
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
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'How to take your temperature:',
            style: Theme.of(context).dialogTheme.titleTextStyle,
          ),
          contentPadding: EdgeInsets.all(20),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
        return Padding(
          padding: EdgeInsets.all(40),
          child: ScrollableBody(
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
                TextFormField(
                  initialValue: existingResponse != null
                      ? existingResponse.toString()
                      : '',
                  onChanged: (String value) =>
                      _updateTemperature(double.parse(value), checkupState),
                  decoration: InputDecoration(
                    icon: FaIcon(
                      FontAwesomeIcons.thermometerHalf,
                      color: Colors.white,
                    ),
                    labelText: 'Enter your temperature',
                    hasFloatingPlaceholder: false,
                    suffixText: '℉',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp(r'^\d+\.?\d{0,1}$')),
                  ],
                  autovalidate: true,
                  autofocus: true,
                  validator: _validateTemperature,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
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
