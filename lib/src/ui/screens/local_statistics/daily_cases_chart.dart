import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:covidnearme/src/data/models/local_statistics.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';

class DailyCasesChart extends StatefulWidget {
  final List<LocalStatisticsEntry> localStatisticsEntries;

  DailyCasesChart({this.localStatisticsEntries});

  @override
  _DailyCasesChartState createState() => _DailyCasesChartState();
}

class _DailyCasesChartState extends State<DailyCasesChart> {
  ValueNotifier<LocalStatisticsEntry> _selectedStatistics;

  @override
  void initState() {
    super.initState();
    _selectedStatistics = ValueNotifier(null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 360,
          child: charts.TimeSeriesChart(
            _createSeriesList(context),
            animate: false,
            behaviors: [
              charts.SeriesLegend(),
              charts.SelectNearest(
                  eventTrigger: charts.SelectionTrigger.tapAndDrag),
            ],
            selectionModels: [
              charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                changedListener: _onSelectionChanged,
              )
            ],
            defaultRenderer: charts.LineRendererConfig(
              includePoints: true,
            ),
            primaryMeasureAxis: charts.AxisSpec(
              showAxisLine: true,
            ),
          ),
        ),
        if (_selectedStatistics != null)
          ValueListenableBuilder<LocalStatisticsEntry>(
              valueListenable: _selectedStatistics,
              builder: (context, value, child) {
                return value == null ? Container() : _SelectedInfo(value);
              }),
      ],
    );
  }

  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    if (selectedDatum.isNotEmpty) {
      final date = selectedDatum.first.datum.date;
      final dateFormat = DateFormat('yyyy-MM-dd');
      final dateString = dateFormat.format(date);
      print(dateString);
      final statisticByLocation =
          widget.localStatisticsEntries.firstWhere((e) => e.date == dateString);
      _selectedStatistics.value = statisticByLocation;
    }
  }

  List<charts.Series<_TimeSeries, DateTime>> _createSeriesList(
      BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return [
      _createSeries(
        id: localizations.statisticsLabelCases,
        color: Colors.blue,
        data: _createTimeSeriesData((statistics) => statistics.cases),
      ),
      _createSeries(
        id: localizations.statisticsLabelDeaths,
        color: Colors.red,
        data: _createTimeSeriesData((statistics) => statistics.deaths),
      ),
      _createSeries(
        id: localizations.statisticsLabelRecoveries,
        color: Colors.green,
        data: _createTimeSeriesData((statistics) => statistics.recoveries),
      )
    ];
  }

  charts.Series<_TimeSeries, DateTime> _createSeries(
      {String id, Color color, List<_TimeSeries> data}) {
    return charts.Series<_TimeSeries, DateTime>(
      id: id,
      colorFn: (_, __) => charts.Color(
        r: color.red,
        g: color.green,
        b: color.blue,
        a: color.alpha,
      ),
      domainFn: (_TimeSeries timeSeries, _) => timeSeries.date,
      measureFn: (_TimeSeries timeSeries, _) => timeSeries.count,
      data: data,
    );
  }

  List<_TimeSeries> _createTimeSeriesData(
      int valueMapper(LocalStatisticsEntry s)) {
    return widget.localStatisticsEntries
        .map(
          (statisticsByLocation) => _TimeSeries(
            DateTime.parse(statisticsByLocation.date),
            valueMapper(statisticsByLocation),
          ),
        )
        .toList();
  }
}

class _TimeSeries {
  final DateTime date;
  final int count;

  _TimeSeries(this.date, this.count);
}

class _SelectedInfo extends StatelessWidget {
  final LocalStatisticsEntry localStatisticsEntry;

  _SelectedInfo(this.localStatisticsEntry);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Column(
      children: [
        Text(localStatisticsEntry.date),
        Text(
            '${localizations.statisticsLabelCases}: ${localStatisticsEntry.cases}'),
        Text(
            '${localizations.statisticsLabelDeaths}: ${localStatisticsEntry.deaths}'),
        Text(
            '${localizations.statisticsLabelRecoveries}: ${localStatisticsEntry.recoveries}'),
      ],
    );
  }
}
