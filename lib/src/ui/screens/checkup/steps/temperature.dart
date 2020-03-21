import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:coronavirus_diary/src/ui/widgets/tutorial_step.dart';
import 'index.dart';

class TemperatureStep extends StatefulWidget implements CheckupStep {
  @override
  _TemperatureStepState createState() => _TemperatureStepState();
}

class _TemperatureStepState extends State<TemperatureStep> {
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
    return Padding(
      padding: EdgeInsets.all(40),
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
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            autovalidate: true,
            validator: (String value) {
              if (value != '') {
                final double numberValue = double.parse(value);
                if (numberValue > 150) {
                  return 'Please enter a value below 150 ℉';
                } else if (numberValue < 70) {
                  return 'Please enter a value above 70 ℉';
                }
              }
              return null;
            },
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
    );
  }
}
