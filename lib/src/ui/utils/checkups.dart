import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/checkup/checkup.dart';

void updateCheckup({
  @required CheckupStateInProgress checkupState,
  @required Checkup Function(Checkup) updateFunction,
  @required BuildContext context,
}) {
  Checkup checkup = checkupState.checkup;
  Checkup updatedCheckup = updateFunction(checkup);
  context
      .bloc<CheckupBloc>()
      .add(UpdateCheckup(updatedCheckup: updatedCheckup));
}
