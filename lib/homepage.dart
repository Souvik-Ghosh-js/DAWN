
import 'package:app/firstpage.dart';
import 'package:app/secondpage.dart';
import 'package:app/thirdpage.dart';
import 'package:app/fourthpage.dart';

import 'package:flutter/material.dart';




class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning




  @override

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    firstpage(),
    secondpage(),
    thirdpage(),
    fourthpage(),


  ];

  bool _showBottomNavBar = true;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    return Scaffold(
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          if (notification.scrollDelta! < 0) {
            setState(() {
              _showBottomNavBar = true;
            });
          } else if (notification.scrollDelta! > 0) {
            // Scroll up, hide the bottom navigation bar
            setState(() {
              _showBottomNavBar = false;
            });
          }
          return true;
        },
        child :_pages[_currentIndex],
      ),
      bottomNavigationBar: _showBottomNavBar ?
      BottomNavigationBar(
        backgroundColor: Colors.teal, // Set the background color here
        currentIndex: _currentIndex,
        selectedItemColor: Colors.teal, // Set the selected item color
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      )
          : null,

    );







  }
}