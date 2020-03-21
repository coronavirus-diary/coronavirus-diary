import 'package:flutter/material.dart';

class TutorialStep extends StatelessWidget {
  final String text;
  final int number;
  final Widget icon;
  final EdgeInsetsGeometry leadingPadding;
  final Color leadingBackgroundColor;
  final Color numberColor;
  final Color textColor;

  const TutorialStep({
    this.text,
    this.number,
    this.icon,
    this.leadingPadding,
    this.leadingBackgroundColor,
    this.numberColor,
    this.textColor,
  });

  Widget _getLeading(BuildContext context) {
    if (icon == null && number == null) return null;

    Widget leadingChild;
    if (icon != null) {
      leadingChild = icon;
    } else if (number != null) {
      leadingChild = Text(
        number.toString(),
        style: TextStyle(
          fontSize: 14,
          color: numberColor,
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: leadingPadding ?? EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: leadingBackgroundColor ?? Theme.of(context).primaryColor,
      ),
      child: leadingChild,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _getLeading(context),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
