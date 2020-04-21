import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:covidnearme/src/data/models/local_statistics.dart';
import 'package:covidnearme/src/ui/screens/local_statistics/daily_case_chart.dart';
import 'package:covidnearme/src/ui/screens/local_statistics/totals_area.dart';
import 'package:covidnearme/src/ui/router.dart';

class LocalStatisticsBody extends StatefulWidget {
  final List<LocalStatisticsEntry> localStatisticsEntries;

  const LocalStatisticsBody({this.localStatisticsEntries});

  @override
  _LocalStatisticsBodyState createState() => _LocalStatisticsBodyState();
}

class _LocalStatisticsBodyState extends State<LocalStatisticsBody> {
  ValueNotifier<LocalStatisticsEntry> _selectedEntry;

  @override
  void initState() {
    super.initState();
    _selectedEntry = ValueNotifier(widget.localStatisticsEntries[0]);
  }

  void _onDateSelected(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    if (selectedDatum.isNotEmpty) {
      _selectedEntry.value = widget.localStatisticsEntries
          .firstWhere((e) => e.date == selectedDatum.first.datum.date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<LocalStatisticsEntry>(
      valueListenable: _selectedEntry,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: DailyCaseChart(
          localStatisticsEntries: widget.localStatisticsEntries,
          onDateSelected: _onDateSelected,
        ),
      ),
      builder: (context, value, child) {
        return Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  ),
                ),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                title: Text(
                  value.name,
                  style: Theme.of(context).textTheme.subhead,
                ),
                subtitle: Text(DateFormat.yMMMd().format(value.date),
                    style: Theme.of(context).textTheme.caption),
                trailing: IconButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    LocalStatisticsLocationScreen.routeName,
                  ),
                  icon: Icon(Icons.edit),
                ),
              ),
            ),
            Expanded(
              child: child,
            ),
            TotalsArea(
              localStatisticsEntry: value,
            ),
          ],
        );
      },
    );
  }
}
