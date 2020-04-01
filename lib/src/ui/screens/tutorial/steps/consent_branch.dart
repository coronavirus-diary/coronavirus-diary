import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/ui/screens/tutorial/steps/denied_consent.dart';
import 'package:covidnearme/src/ui/screens/tutorial/steps/location.dart';

class ConsentBranchStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        final bool agreed = state.preferences.agreedToTerms != null &&
            state.preferences.agreedToTerms;
        if (agreed) {
          return TutorialLocationStep();
        } else {
          return DeniedConsent();
        }
      },
    );
  }
}
