import 'package:covid19th/screens/overviewTh_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (orientation == Orientation.landscape) {
            SystemChrome.setEnabledSystemUIOverlays([]);
          } else {
            SystemChrome.setEnabledSystemUIOverlays(
              SystemUiOverlay.values,
            );
          }
//          return NavigationScreen();
          return Scaffold(
              body:
                  ((MediaQuery.of(context).orientation == Orientation.portrait)
                      ? SafeArea(child: OverviewThScreen())
                      : OverviewThScreen()));
        },
      ),

//      home: NavigationScreen(),
//      home: Scaffold(
//        body: SafeArea(child: OverviewThScreen()),
//      ),
    );
  }
}
