import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:coronavirus_diary/src/blocs/checkup/checkup.dart';
import 'package:coronavirus_diary/src/ui/widgets/loading_indicator.dart';
import 'checkup_loaded_body.dart';

class CheckupScreen extends StatefulWidget {
  static const routeName = '/checkup';

  @override
  _CheckupScreenState createState() => _CheckupScreenState();
}

class _CheckupScreenState extends State<CheckupScreen> {
  // Storing the page controller at this level so that we can access it
  // across the entire checkup experience
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Widget _getUnloadedBody(
    CheckupState checkupState,
  ) {
    if (checkupState is CheckupStateNotCreated) {
      context.bloc<CheckupBloc>().add(StartCheckup());
    }
    return LoadingIndicator('Loading your health checkup');
  }

  Widget _getErrorBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          'There was an error retrieving the checkup experience. Please try again later.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _getBody(CheckupState checkupState) {
    if (checkupState is CheckupStateNotCreated ||
        checkupState is CheckupStateCreating) {
      return _getUnloadedBody(checkupState);
    } else if (checkupState is CheckupStateInProgress) {
      return CheckupLoadedBody();
    } else {
      return _getErrorBody();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckupBloc, CheckupState>(
      builder: (context, state) {
        final CheckupState checkupState = state;

        return ChangeNotifierProvider<PageController>(
          create: (context) => _pageController,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Your Health Checkup'),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            body: _getBody(checkupState),
          ),
        );
      },
    );
  }
}
