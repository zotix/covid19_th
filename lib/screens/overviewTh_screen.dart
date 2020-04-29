import 'package:covid19th/components/reusable_card.dart';
import 'package:covid19th/components/timeline_chart.dart';
import 'package:covid19th/constants.dart';
import 'package:covid19th/models/covid19_th.dart';
import 'package:covid19th/models/covid19_th_data.dart';
import 'package:covid19th/models/timeline_series.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

Covid19Th data = Covid19Th();
Data todayData;
List<TimelineSeries> chartData = [];

class OverviewThScreen extends StatefulWidget {
  @override
  _OverviewThScreenState createState() => _OverviewThScreenState();
}

class _OverviewThScreenState extends State<OverviewThScreen> {
  void getData() async {
    print('Get Data!');
    try {
      data = await Covid19ThData().getData();
      todayData = data.data.last;

      chartData = [];
//      for (Data time in data.data) {
      for (int index = 45; index < data.data.length; index++) {
        Data time = data.data.elementAt(index);
        var inputFormat = DateFormat("MM/dd/yyyy");
//        print(time.date);
        var tempTime = inputFormat.parse(time.date);
//        print(tempTime);
        TimelineSeries c = TimelineSeries(
          time: tempTime,
          confirmed: time.confirmed,
          recovered: time.recovered,
          hospitalized: time.hospitalized,
          deaths: time.deaths,
        );
        chartData.add(c);
      }
      setState(() {
        _selectedIndex = 1;
      });
//      print(data.source);
    } catch (e) {
      print('try get data');
      print(e);
    }
  }

  void initState() {
    print(data.updateDate);
    super.initState();
    if (data.updateDate == null) {
      print('Try loading data..');
      getData();
    } else {
      // Changing to Display widget
      _selectedIndex = 1;
    }
  }

  // Start Loading widget
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Center(
      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 200,
      ),
    ),
    Display(
      data: data,
    ),
    Text(
      'Coming soon!',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return _widgetOptions.elementAt(_selectedIndex);
  }
}

class Display extends StatefulWidget {
  Display({this.data});
  final data;

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Visibility(
          visible: MediaQuery.of(context).orientation == Orientation.portrait,
          child: Column(
            children: <Widget>[
              SizedBox(height: 5.0),
              Header(),
              TodaySection(),
              SizedBox(height: 5.0),
            ],
          ),
        ),
        Text('กราฟแสดงตามช่วงเวลา (เริ่มตั้งแต่วันที่ 15/02/20)'),
        Expanded(
          child: TimelineChart(
            data: chartData,
          ),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'รายงานสถานการณ์ โควิด-19',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('MOPH อัพเดทข้อมูลล่าสุด : ${data.updateDate}'),
      ],
    );
  }
}

class TodaySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ReusableCard(
          colour: Colors.red,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'ติดเชื้อสะสม',
                textAlign: TextAlign.center,
                style: kLabelTextStyle,
              ),
              Text(
                '${todayData.confirmed}',
                textAlign: TextAlign.center,
                style: kNumberTextStyle,
              ),
              Text(
                todayData.newConfirmed != 0
                    ? '[+เพิ่มขึ้น  ${todayData.newConfirmed} ]'
                    : 'ไม่พบผู้ติดเชื้อ',
                textAlign: TextAlign.center,
                style: kSubLabelTextStyle,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                colour: Colors.green,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'หายแล้ว',
                      textAlign: TextAlign.center,
                      style: kLabelTextStyle,
                    ),
                    Text(
                      '${todayData.recovered}',
                      textAlign: TextAlign.center,
                      style: kNumberTextStyle,
                    ),
                    Text(
                      '[+เพิ่มขึ้น  ${todayData.newRecovered} ]',
                      textAlign: TextAlign.center,
                      style: kSubLabelTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: Colors.orange,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'อยู่ รพ.',
                      textAlign: TextAlign.center,
                      style: kLabelTextStyle,
                    ),
                    Text(
                      '${todayData.hospitalized}',
                      textAlign: TextAlign.center,
                      style: kNumberTextStyle,
                    ),
                    Text(
                      todayData.newHospitalized >= 0
                          ? '[+เพิ่มขึ้น  ${todayData.newHospitalized} ]'
                          : '[-ลดลง  ${-todayData.newHospitalized} ]',
                      textAlign: TextAlign.center,
                      style: kSubLabelTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: Colors.brown,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'เสียชีวิต',
                      textAlign: TextAlign.center,
                      style: kLabelTextStyle,
                    ),
                    Text(
                      '${todayData.deaths}',
                      textAlign: TextAlign.center,
                      style: kNumberTextStyle,
                    ),
                    Text(
                      todayData.newDeaths > 0
                          ? '[เพิ่มขึ้น ${todayData.newDeaths}]'
                          : '',
                      textAlign: TextAlign.center,
                      style: kSubLabelTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
