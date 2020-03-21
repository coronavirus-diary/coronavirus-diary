import 'screens/assessment/assessment.dart';
import 'screens/checkup/checkup.dart';
import 'screens/home/home.dart';

export 'screens/assessment/assessment.dart';
export 'screens/checkup/checkup.dart';
export 'screens/home/home.dart';

var appRoutes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  CheckupScreen.routeName: (context) => CheckupScreen(),
  AssessmentScreen.routeName: (context) => AssessmentScreen(),
};

const initialRoute = HomeScreen.routeName;
