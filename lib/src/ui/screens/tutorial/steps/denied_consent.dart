import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/ui/widgets/loading_indicator.dart';

class DeniedConsent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        return SafeArea(
          child: FutureBuilder(
            future: rootBundle.loadString('assets/copy/denied_consent.md'),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: <Widget>[
                    Markdown(
                      padding: EdgeInsets.fromLTRB(20, 40, 20, 150),
                      data: snapshot.data,
                      styleSheet:
                          MarkdownStyleSheet.fromTheme(Theme.of(context))
                              .copyWith(
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
                                onPressed: () => Provider.of<PageController>(
                                  context,
                                  listen: false,
                                ).previousPage(
                                    duration: Duration(microseconds: 400),
                                    curve: Curves.easeInOut),
                                child: Text('Go Back'),
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
      },
    );
  }
}
