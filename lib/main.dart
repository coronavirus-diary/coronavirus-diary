import 'package:covidnearme/src/blocs/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await AppHydratedBlocDelegate.build();
  runApp(Phoenix(
    child: App(),
  ));
}
