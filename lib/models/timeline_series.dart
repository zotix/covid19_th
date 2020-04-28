import 'package:flutter/cupertino.dart';

class TimelineSeries {
  final DateTime time;
  final int confirmed;
  final int recovered;
  final int hospitalized;
  final int deaths;

  TimelineSeries(
      {@required this.time,
      @required this.confirmed,
      @required this.recovered,
      @required this.hospitalized,
      @required this.deaths});
}
