import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coronavirus_diary/src/blocs/activity/activity.dart';
import 'package:coronavirus_diary/src/ui/widgets/loading_indicator.dart';
import 'activity_list.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coronavirus Diary'),
      ),
      body: BlocProvider(
        create: (BuildContext context) => ActivityBloc(),
        child: BlocBuilder<ActivityBloc, ActivityState>(
          builder: (context, state) {
            if (state is ActivityNotLoaded || state is ActivityLoading) {
              if (state is ActivityNotLoaded) {
                context.bloc<ActivityBloc>().add(RetrieveActivity());
              }
              return LoadingIndicator('Loading activity');
            } else if (state is ActivityLoaded) {
              return ActivityList(state.events);
            } else {
              return Center(
                child: Text('There was an error retrieving activity.'),
              );
            }
          },
        ),
      ),
    );
  }
}
