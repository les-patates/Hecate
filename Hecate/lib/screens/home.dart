import 'package:Hecate/screens/mapScreen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.map),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text('Profile')
          )
        ],
      ),
    );

  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}