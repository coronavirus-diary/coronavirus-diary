import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:covidnearme/src/blocs/utils.dart';
import 'src/app.dart';

Future<void> main() async {
  await DotEnv().load('.env');
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await AppHydratedBlocDelegate.build();

  runApp(Phoenix(
    child: App(),
  ));
}
