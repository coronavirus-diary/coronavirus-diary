import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'index.dart';

class IntroStep extends StatefulWidget implements CheckupStep {
  @override
  _IntroStepState createState() => _IntroStepState();
}

class _IntroStepState extends State<IntroStep> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: FaIcon(
                FontAwesomeIcons.check,
                color: Colors.white.withOpacity(0.7),
                size: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "It's time for your checkup.",
                style: Theme.of(context).textTheme.title.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "This blurb will prepare you for it and highlight your right to submit only the data that you choose.",
              style: Theme.of(context).textTheme.subtitle.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: RaisedButton(
                onPressed: () =>
                    Provider.of<PageController>(context, listen: false)
                        .nextPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                ),
                child: Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
