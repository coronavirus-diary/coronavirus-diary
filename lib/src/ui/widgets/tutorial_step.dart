import 'package:flutter/material.dart';

class TutorialStep extends StatelessWidget {
  final String text;
  final int number;
  final Widget icon;
  final EdgeInsetsGeometry leadingPadding;
  final Color leadingBackgroundColor;
  final Color numberColor;
  final Color textColor;
  final double fontSize;

  const TutorialStep({
    this.text,
    this.number,
    this.icon,
    this.leadingPadding,
    this.leadingBackgroundColor,
    this.numberColor,
    this.textColor,
    this.fontSize = 18.0,
  }) : assert(icon == null || number == null,
            "Can't specify both icon and number");

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
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (icon != null || number != null) _getLeading(context),
          Flexible(
            child: Column(
              children: <Widget>[
                if (icon != null || number != null) SizedBox(height: 10),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
