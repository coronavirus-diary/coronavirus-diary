import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import 'package:coronavirus_diary/src/blocs/checkup/checkup.dart';
import 'package:coronavirus_diary/src/blocs/questions/questions.dart';
import 'package:coronavirus_diary/src/ui/utils/checkups.dart';
import 'steps/index.dart';
import 'checkup_progress_bar.dart';

class CheckupLoadedBody extends StatefulWidget {
  @override
  _CheckupLoadedBodyState createState() => _CheckupLoadedBodyState();
}

class _CheckupLoadedBodyState extends State<CheckupLoadedBody> {
  int currentIndex = 0;
  CheckupStep currentStep = steps[0];

  void _saveCurrentLocation(CheckupStateInProgress checkupState) async {
    final Geolocator geolocator = Geolocator();

    try {
      final Position position = await geolocator.getCurrentPosition(
        locationPermissionLevel: GeolocationPermission.locationWhenInUse,
      );
      final List<Placemark> places = await geolocator.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final String postalCode = places[0].postalCode;

      updateCheckup(
        context: context,
        checkupState: checkupState,
        updateFunction: (Checkup checkup) {
          checkup.location = CheckupLocation(postalCode: postalCode);
          return checkup;
        },
      );
    } catch (e) {
      print(e);
    }
  }

  void _handlePageChange(
    int index,
    CheckupStateInProgress checkupState,
    QuestionsState questionsState,
  ) async {
    // Origin-specific actions
    if (currentIndex == 0) {
      if (checkupState.checkup.dataContributionPreference == true) {
        await _saveCurrentLocation(checkupState);
      }
    } else if (currentIndex > 0 && currentIndex < steps.length - 1) {
      context.bloc<CheckupBloc>().add(UpdateRemoteCheckup());
    }

    setState(() {
      currentIndex = index;
      currentStep = steps[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckupBloc, CheckupState>(
      builder: (context, state) {
        final CheckupState checkupState = state;

        return BlocBuilder<QuestionsBloc, QuestionsState>(
          builder: (context, state) {
            final QuestionsState questionsState = state;

            return Stack(
              children: <Widget>[
                PageView.builder(
                  controller: Provider.of<PageController>(context),
                  onPageChanged: (int index) => _handlePageChange(
                    index,
                    checkupState,
                    questionsState,
                  ),
                  itemCount: steps.length,
                  itemBuilder: (BuildContext context, int index) {
                    return steps[index];
                  },
                ),
                if (currentStep != null && currentIndex > 0)
                  CheckupProgressBar(
                    currentIndex: currentIndex,
                    stepsLength: steps.length,
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
