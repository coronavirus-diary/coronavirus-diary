import 'dart:ui';

import 'package:covidnearme/src/l10n/app_localizations.dart';
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
    final AppLocalizations localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: IconButton(
          tooltip: localizations.deniedConsentBackButton,
          icon: Icon(Icons.arrow_back),
          onPressed: () => Provider.of<PageController>(
            context,
            listen: false,
          ).previousPage(
            duration: Duration(microseconds: 400),
            curve: Curves.easeInOut,
          ),
        ),
        title: Text('Your Health Checkup'),
      ),
      body: BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (context, state) {
          return SafeArea(
            child: FutureBuilder(
              future: rootBundle.loadString('assets/copy/denied_consent.md'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 48, bottom: 24),
                        child: Icon(
                          Icons.report_problem,
                          size: 100,
                        ),
                      ),
                      Text(
                        'Consent denied',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: Markdown(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.fromLTRB(20, 40, 20, 150),
                            data: snapshot.data,
                            styleSheet:
                                MarkdownStyleSheet.fromTheme(Theme.of(context))
                                    .copyWith(
                              h1Align: WrapAlignment.center,
                              p: Theme.of(context).textTheme.body2.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor,
                            ),
                          ),
                        ),
                      ),
                      Text('Consent denied'),
                    ],
                  );
                } else {
                  return LoadingIndicator('Loading...');
                }
              },
            ),
          );
        },
      ),
    );
  }
}
