import 'package:flutter/material.dart';

class TutorialStep extends StatelessWidget {
  final String text;
  final int number;
  final Widget icon;

  const TutorialStep({
    this.text,
    this.number,
    this.icon,
  });

  Widget _getLeading(BuildContext context) {
    if (icon != null) {
      return icon;
    } else if (number != null) {
      return Container(
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: Text(
          number.toString(),
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getLeading(context),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
