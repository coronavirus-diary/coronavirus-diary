import 'screens/activity/activity.dart';
import 'screens/activity/activity_create.dart';
import 'screens/checkup/checkup.dart';
import 'screens/home/home.dart';

export 'screens/activity/activity.dart';
export 'screens/activity/activity_create.dart';
export 'screens/checkup/checkup.dart';
export 'screens/home/home.dart';

var appRoutes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  CheckupScreen.routeName: (context) => CheckupScreen(),
  ActivityScreen.routeName: (context) => ActivityScreen(),
  ActivityCreateScreen.routeName: (context) => ActivityCreateScreen(),
};

const initialRoute = HomeScreen.routeName;
