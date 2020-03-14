import 'package:flutter/material.dart';

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
    return ListView.builder(
      itemCount: widget.events.length,
      itemBuilder: (BuildContext context, int index) {
        final Event event = widget.events[index];
        switch (event.runtimeType) {
          case LocationEvent:
            return LocationCard(event);
          default:
            return null;
        }
      },
    );
  }
}
