import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class ShareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _shareApp() {
      Share.share(
        'Worried that you might have COVID-19? '
        'Download this app to check up on your health and support your community: APP_LINK',
      );
    }

    return Container(
      color: Colors.white.withOpacity(0.2),
      padding: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: FaIcon(
              FontAwesomeIcons.heartbeat,
              color: Colors.red,
              size: 40,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Protect Your Community",
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              "Share this app with your friends, coworkers, and family (especially grandparents).",
              style: Theme.of(context).textTheme.body1.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          RaisedButton(
            onPressed: _shareApp,
            child: Text('Share now'),
          ),
        ],
      ),
    );
  }
}
