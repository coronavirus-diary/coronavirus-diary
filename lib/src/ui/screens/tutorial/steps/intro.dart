import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              FontAwesomeIcons.questionCircle,
              color: Colors.white,
              size: 80,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              "Concerned about your health?",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ],
      ),
    );
  }
}
