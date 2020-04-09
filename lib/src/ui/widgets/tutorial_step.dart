import 'package:flutter/material.dart';

class TutorialStep extends StatelessWidget {
  final String text;
  final int number;
  final Widget icon;
  final EdgeInsetsGeometry leadingPadding;
  final Color leadingBackgroundColor;
  final Color numberColor;
  final EdgeInsetsGeometry contentPadding;
  final Color textColor;
  final double fontSize;

  const TutorialStep({
    this.text,
    this.number,
    this.icon,
    this.leadingPadding,
    this.leadingBackgroundColor,
    this.numberColor,
    this.contentPadding,
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
        color: leadingBackgroundColor ?? Theme.of(context).colorScheme.primary,
      ),
      child: leadingChild,
    );
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry contentPaddingCalculated;
    if (contentPadding != null) {
      contentPaddingCalculated = contentPadding;
    } else if (icon != null || number != null) {
      contentPaddingCalculated = EdgeInsets.only(top: 10);
    }

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (icon != null || number != null) _getLeading(context),
          Flexible(
            child: Container(
              padding: contentPaddingCalculated,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
