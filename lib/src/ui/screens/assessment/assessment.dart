import 'package:flutter/material.dart';

import 'package:covidnearme/src/data/models/assessments.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/network_unavailable_banner.dart';
import 'assessments/index.dart';

class AssessmentScreenArguments {
  final Assessment assessment;

  AssessmentScreenArguments({this.assessment});
}

class AssessmentScreen extends StatelessWidget {
  static const routeName = '/assessment';

  @override
  Widget build(BuildContext context) {
    final AssessmentScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).assessmentScreenTitle),
      ),
      body: NetworkUnavailableBanner.wrap(
        getAssessmentView(args.assessment),
      ),
    );
  }
}
