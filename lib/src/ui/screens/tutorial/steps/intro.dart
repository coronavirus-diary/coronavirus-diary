import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:coronavirus_diary/src/ui/widgets/tutorial_step.dart';

class IntroStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 20),
            child: FaIcon(
              FontAwesomeIcons.bookMedical,
              color: Colors.white,
              size: 80,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 40),
            child: Text(
              "Welcome to Coronavirus Diary",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 40),
            child: Column(
              children: <Widget>[
                TutorialStep(
                  text: 'Complete a daily health checkup.',
                  icon: FaIcon(
                    FontAwesomeIcons.check,
                    color: Colors.white,
                    size: 30,
                  ),
                  leadingBackgroundColor: Colors.white.withOpacity(0.2),
                  leadingPadding: EdgeInsets.all(20),
                ),
                TutorialStep(
                  text: 'Receive a personalized health assessment.',
                  icon: FaIcon(
                    FontAwesomeIcons.heartbeat,
                    color: Colors.white,
                    size: 30,
                  ),
                  leadingBackgroundColor: Colors.white.withOpacity(0.2),
                  leadingPadding: EdgeInsets.all(20),
                ),
                TutorialStep(
                  text: 'Aid COVID-19 response efforts.',
                  icon: FaIcon(
                    FontAwesomeIcons.handHoldingHeart,
                    color: Colors.white,
                    size: 30,
                  ),
                  leadingBackgroundColor: Colors.white.withOpacity(0.2),
                  leadingPadding: EdgeInsets.all(20),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 40),
            child: RaisedButton(
              onPressed: () => {
                Provider.of<PageController>(context, listen: false).nextPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                )
              },
              child: Text('Click here to learn more'),
            ),
          ),
        ],
      ),
    );
  }
}
