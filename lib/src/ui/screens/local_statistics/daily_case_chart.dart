import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:covidnearme/src/data/models/local_statistics.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';

class DailyCaseChart extends StatelessWidget {
  final List<LocalStatisticsEntry> localStatisticsEntries;
  final Function(charts.SelectionModel model) onDateSelected;

  DailyCaseChart({
    this.localStatisticsEntries,
    this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: charts.TimeSeriesChart(
        _createSeriesList(context),
        animate: true,
        behaviors: [
          charts.SeriesLegend(),
          charts.SelectNearest(
            eventTrigger: charts.SelectionTrigger.tapAndDrag,
          ),
        ],
        selectionModels: [
          charts.SelectionModelConfig(
            type: charts.SelectionModelType.info,
            changedListener: onDateSelected,
          )
        ],
        defaultRenderer: charts.LineRendererConfig(
          includePoints: true,
        ),
        primaryMeasureAxis: charts.AxisSpec(
          showAxisLine: true,
        ),
      ),
    );
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
    return localStatisticsEntries
        .map(
          (statisticsByLocation) => _TimeSeries(
            statisticsByLocation.date,
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
