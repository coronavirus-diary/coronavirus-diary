import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/ui/screens/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/ui/screens/symptom_report/thankyou.dart';

import 'screens/home/home.dart';
import 'screens/symptom_report/consent_denied.dart';
import 'screens/tutorial/tutorial.dart';

export 'screens/symptom_report/thankyou.dart';
export 'screens/home/home.dart';
export 'screens/symptom_report/consent_denied.dart';
export 'screens/tutorial/tutorial.dart';

var appRoutes = {
  ThankYouScreen.routeName: (context) => ThankYouScreen(),
  SymptomReportConsentDeniedScreen.routeName: (context) =>
      SymptomReportConsentDeniedScreen(),
  SymptomReportScreen.routeName: (context) => SymptomReportScreen(),
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
