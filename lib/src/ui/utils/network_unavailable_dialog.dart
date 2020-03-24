import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NetworkUnavailableDialog {
  static Future<void> show(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).appBarTheme.color,
          contentPadding: EdgeInsets.all(20),
          contentTextStyle: Theme.of(context).dialogTheme.contentTextStyle,
          titleTextStyle: Theme.of(context).dialogTheme.titleTextStyle,
          shape: Theme.of(context).dialogTheme.shape,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FaIcon(
                Icons.network_check,
                color: Colors.white,
                size: 80,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Network Unavailable',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .apply(color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Please check your network settings and try again.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .dialogTheme
                      .contentTextStyle
                      .apply(color: Colors.white),
                ),
              ),
              RaisedButton(
                child: const Text('Open Network Preferences'),
                onPressed: () async => await AppSettings.openWIFISettings(),
              )
            ],
          ),
        );
      },
    );
  }
}
