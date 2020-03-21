import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hud/flutter_hud.dart';

import 'package:coronavirus_diary/src/blocs/checkup/checkup.dart';
import 'assessments/index.dart';
import 'share.dart';

class AssessmentScreen extends StatelessWidget {
  static const routeName = '/assessment';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckupBloc, CheckupState>(
      builder: (context, state) {
        Widget body;
        if (state is CheckupStateInProgress) {
          context.bloc<CheckupBloc>().add(CompleteCheckup());
        } else if (state is CheckupStateCompleted) {
          switch (state.assessment.matchesPuiSymptoms) {
            case true:
              body = PositiveAssessment();
              break;
            case false:
              body = NegativeAssessment();
              break;
          }
        }
        return WidgetHUD(
          showHUD: state is CheckupStateCompleting,
          hud: HUD(label: 'Loading your assessment'),
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Your Personalized Assessment'),
              ),
              body: body,
            );
          },
        );
      },
    );
  }
}
