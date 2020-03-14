import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import 'package:coronavirus_diary/src/data/models/event.dart';
import 'activity_cards/index.dart';

class ActivityList extends StatefulWidget {
  final List<Event> events;

  const ActivityList([
    this.events = const [],
  ]);

  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  @override
  Widget build(BuildContext context) {
    return Timeline.builder(
      itemCount: widget.events.length,
      itemBuilder: (BuildContext context, int index) {
        final Event event = widget.events[index];
        switch (event.runtimeType) {
          case LocationEvent:
            return TimelineModel(LocationCard(event));
          default:
            return null;
        }
      },
    );
  }
}
