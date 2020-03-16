import 'package:flutter/material.dart';

import 'package:coronavirus_diary/src/data/database/database.dart';

class LocationCard extends StatelessWidget {
  final ActivityWithLocation activity;

  const LocationCard([this.activity]);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Location update',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Text('Latitude: ${activity.location.lat}'),
            Text('Longitude: ${activity.location.long}'),
            Text('Participants: ${activity.activity.participants}'),
          ],
        ),
      ),
    );
  }
}
