import 'package:covidnearme/src/ui/assets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/checkup/checkup.dart';
import 'package:covidnearme/src/blocs/questions/questions.dart';
import 'package:covidnearme/src/ui/router.dart';
import 'package:covidnearme/src/ui/utils/checkups.dart';
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
    bool showLocationFallback = true;
    String postalCode;
    try {
      final Geolocator geolocator = Geolocator();
      final GeolocationStatus permission =
          await geolocator.checkGeolocationPermissionStatus(
              locationPermission: GeolocationPermission.locationWhenInUse);
      if (permission == GeolocationStatus.granted ||
          permission == GeolocationStatus.restricted) {
        final Position position = await geolocator.getCurrentPosition(
          locationPermissionLevel: GeolocationPermission.locationWhenInUse,
        );
        final List<Placemark> places =
            await geolocator.placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        final String postalCode = places[0].postalCode;
        showLocationFallback = false;
      }
    } catch (e) {
      print(e.toString());
    }
    if (showLocationFallback) {
      //This returns a String, but putting an explicit type here fails.
      final result =
          await Navigator.pushNamed(context, GetZipCodeScreen.routeName);
      if (result != null) {
        postalCode = result;
      }
    }
    if (postalCode != null) {
      updateCheckup(
        context: context,
        checkupState: checkupState,
        updateFunction: (Checkup checkup) {
          checkup.location = CheckupLocation(postalCode: postalCode);
          return checkup;
        },
      );
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
