import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coronavirus_diary/src/blocs/activity/activity.dart';
import 'package:coronavirus_diary/src/ui/screens/activity/activity_list.dart';
import 'package:coronavirus_diary/src/ui/router.dart';
import 'package:coronavirus_diary/src/ui/widgets/loading_indicator.dart';

class ActivityScreen extends StatefulWidget {
  static const routeName = '/activity';

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My activity'),
      ),
      body: BlocBuilder<ActivityBloc, ActivityHistoryState>(
        builder: (context, state) {
          if (state is ActivityHistoryNotLoaded ||
              state is ActivityHistoryLoading) {
            if (state is ActivityHistoryNotLoaded) {
              context.bloc<ActivityBloc>().add(RetrieveActivity());
            }
            return LoadingIndicator('Loading activity');
          } else if (state is ActivityHistoryLoaded) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () => Navigator.pushNamed(
                            context, ActivityCreateScreen.routeName),
                        child: Text('Add an activity'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ActivityList(activities: state.activities),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text('Activity loading failed.'),
            );
          }
        },
      ),
    );
  }
}
