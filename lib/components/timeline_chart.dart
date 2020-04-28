import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19th/models/timeline_series.dart';
import 'package:flutter/cupertino.dart';

class TimelineChart extends StatelessWidget {
  final List<TimelineSeries> data;

  TimelineChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<TimelineSeries, DateTime>> timeline = [
      charts.Series(
        id: "Confirmed",
        data: data,
        domainFn: (TimelineSeries timeline, _) => timeline.time,
        measureFn: (TimelineSeries timeline, _) => timeline.confirmed,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      ),
      charts.Series(
        id: "Recovered",
        data: data,
        domainFn: (TimelineSeries timeline, _) => timeline.time,
        measureFn: (TimelineSeries timeline, _) => timeline.recovered,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      ),
      charts.Series(
        id: "Hospitalized",
        data: data,
        domainFn: (TimelineSeries timeline, _) => timeline.time,
        measureFn: (TimelineSeries timeline, _) => timeline.hospitalized,
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
      ),
      charts.Series(
        id: "Deaths",
        data: data,
        domainFn: (TimelineSeries timeline, _) => timeline.time,
        measureFn: (TimelineSeries timeline, _) => timeline.deaths,
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
      ),
    ];
    return charts.TimeSeriesChart(
      timeline,
      animate: true,
      defaultRenderer: charts.LineRendererConfig(
        includeArea: true,
      ),
    );
  }
}
