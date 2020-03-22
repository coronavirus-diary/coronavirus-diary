import 'package:covidnearme/src/blocs/preferences/preferences.dart';

import 'screens/assessment/assessment.dart';
import 'screens/checkup/checkup.dart';
import 'screens/home/home.dart';
import 'screens/tutorial/tutorial.dart';

export 'screens/assessment/assessment.dart';
export 'screens/checkup/checkup.dart';
export 'screens/home/home.dart';
export 'screens/tutorial/tutorial.dart';

var appRoutes = {
  AssessmentScreen.routeName: (context) => AssessmentScreen(),
  CheckupScreen.routeName: (context) => CheckupScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  TutorialScreen.routeName: (context) => TutorialScreen(),
};

String getInitialRoute(PreferencesState preferencesState) {
  if (!preferencesState.preferences.completedTutorial) {
    return TutorialScreen.routeName;
  } else {
    return HomeScreen.routeName;
  }
}
