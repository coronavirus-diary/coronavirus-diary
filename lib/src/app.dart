import 'package:flutter/material.dart';

import 'ui/router.dart';

class DiaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coronavirus Diary',
      routes: appRoutes,
      initialRoute: initialRoute,
    );
  }
}
