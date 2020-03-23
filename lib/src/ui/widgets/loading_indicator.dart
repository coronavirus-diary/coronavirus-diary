import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final String message;

  LoadingIndicator([this.message]);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: CircularProgressIndicator(),
          ),
          if (message.isNotEmpty)
            Text(
              message,
              style: Theme.of(context).textTheme.headline,
            ),
        ],
      ),
    );
  }
}
