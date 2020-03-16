import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import 'package:coronavirus_diary/src/data/database/database.dart';
import 'activity_cards/index.dart';

class ActivityList extends StatefulWidget {
  final List<ActivityWithLocation> activities;

  const ActivityList([
    this.activities = const [],
  ]);

  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  @override
  Widget build(BuildContext context) {
    if (widget.activities.length == 0) {
      return Center(
        child: Text('No activity found.'),
      );
    }

    return Timeline.builder(
      itemCount: widget.activities.length,
      itemBuilder: (BuildContext context, int index) {
        final ActivityWithLocation activity = widget.activities[index];
        return TimelineModel(LocationCard(activity));
      },
    );
  }
}
