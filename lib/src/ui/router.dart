import 'package:covidnearme/src/blocs/preferences/preferences.dart';

import 'screens/home/home.dart';
import 'screens/local_statistics/local_statistics.dart';
import 'screens/misc/safety_tips.dart';
import 'screens/symptom_report/consent_denied.dart';
import 'screens/symptom_report/symptom_report.dart';
import 'screens/symptom_report/thankyou.dart';
import 'screens/tutorial/tutorial.dart';

export 'screens/home/home.dart';
export 'screens/local_statistics/local_statistics.dart';
export 'screens/misc/safety_tips.dart';
export 'screens/symptom_report/consent_denied.dart';
export 'screens/symptom_report/symptom_report.dart';
export 'screens/symptom_report/thankyou.dart';
export 'screens/tutorial/tutorial.dart';

var appRoutes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  LocalStatisticsScreen.routeName: (context) => LocalStatisticsScreen(),
  SafetyTipsScreen.routeName: (context) => SafetyTipsScreen(),
  SymptomReportConsentDeniedScreen.routeName: (context) =>
      SymptomReportConsentDeniedScreen(),
  SymptomReportScreen.routeName: (context) => SymptomReportScreen(),
  ThankYouScreen.routeName: (context) => ThankYouScreen(),
  TutorialScreen.routeName: (context) => TutorialScreen(),
};

String getInitialRoute(PreferencesState preferencesState) {
  if (!preferencesState.preferences.completedTutorial) {
    return TutorialScreen.routeName;
  } else {
    return HomeScreen.routeName;
  }
}
