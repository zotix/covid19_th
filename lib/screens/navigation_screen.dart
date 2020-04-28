import 'package:covid19th/screens/news_screen.dart';
import 'package:covid19th/screens/overviewTh_screen.dart';
import 'package:covid19th/screens/world_screen.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 1;

  List<BottomNavigationBarItem> _barItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.public),
      title: Text('World'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
//      activeIcon: Icon(Icons.email),
      title: Text('Thailand'),
    ),
//    BottomNavigationBarItem(
//      icon: Icon(Icons.home),
//      title: Text('Detail'),
//    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.new_releases),
      title: Text('News'),
    ),
  ];

  List<Widget> _widgetOptions = <Widget>[
    WorldScreen(),
    OverviewThScreen(),
    NewsScreen(),
    Text(
      'Coming soon!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID19 TH Update'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _barItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}