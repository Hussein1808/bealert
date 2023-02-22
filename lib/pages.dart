// ignore_for_file: prefer_const_constructors
import 'package:bealert/History/View/main_history.dart';
import 'package:bealert/Home/View/main_home.dart';
import 'package:bealert/Settings/View/main_settings.dart';
import 'package:bealert/Statistics/View/main_statistics.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'Home/View/top_home.dart';
import 'Record/View/main_record.dart';

class HomePage extends StatefulWidget {
  int selectedIndex;
  HomePage({
    required this.selectedIndex,
    // required this.onTodoChanged,
  }) : super(key: ValueKey(selectedIndex));

  @override
  State<HomePage> createState() => _HomePageState(selectedIndex: selectedIndex);
}

class _HomePageState extends State<HomePage> {
  int selectedIndex;
  _HomePageState({
    required this.selectedIndex,
    // required this.onTodoChanged,
  }) : super();

  // int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    MainHome(),
    MainHistory(),
    MainRecord(),
    MainStatistics(),
    MainSettings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: _pages.elementAt(selectedIndex), //New
      ),
      bottomNavigationBar: FlashyTabBar(
        height: 55,
        iconSize: 25,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedIndex: selectedIndex,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(UniconsLine.estate),
            title: Text('Home'),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
          FlashyTabBarItem(
            icon: Icon(UniconsLine.history),
            title: Text('History'),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
          FlashyTabBarItem(
            icon: Icon(UniconsLine.record_audio),
            title: Text('Record'),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
          FlashyTabBarItem(
            icon: Icon(UniconsLine.comparison),
            title: Text('Statistics'),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
