import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:coronavirus_diary/src/ui/widgets/loading_indicator.dart';

class ConsentStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: rootBundle.loadString('assets/copy/consent.md'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: <Widget>[
                Markdown(
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 100),
                  data: snapshot.data,
                  styleSheet:
                      MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                    blockSpacing: 20,
                    h1Align: WrapAlignment.center,
                    p: TextStyle(fontSize: 18),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor.withOpacity(0.6),
                          Theme.of(context).primaryColor.withOpacity(0),
                        ],
                        stops: <double>[0, 0.8, 1.0],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () => {},
                            child: Text('No'),
                          ),
                          RaisedButton(
                            onPressed: () => {},
                            child: Text('I agree'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return LoadingIndicator('Loading...');
          }
        },
      ),
    );
  }
}
