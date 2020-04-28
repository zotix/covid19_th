import 'package:covid19th/screens/overviewTh_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//void main() {
//  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//  runApp(new MyApp());
//}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Loading...';

  @override
  Widget build(BuildContext context) {
//    SystemChrome.setPreferredOrientations(
//      [DeviceOrientation.portraitUp],
//    );
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
//      home: NavigationScreen(),
      home: Scaffold(
        body: SafeArea(child: OverviewThScreen()),
      ),
    );
  }
}
