import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget button;

  const HomeCard({
    this.leading,
    this.title,
    this.subtitle,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
        side: BorderSide(
          color: Colors.black26,
          width: 1.0,
        ),
      ),
      child: Container(
        color: Colors.white.withOpacity(0.2),
        padding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: leading,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
                child: title,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
                child: subtitle,
              ),
            ),
            Container(
              width: double.infinity,
              child: button,
            ),
          ],
        ),
      ),
    );
  }
}
