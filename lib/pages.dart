import 'package:bealert/History/View/main_history.dart';
import 'package:bealert/Home/View/main_home.dart';
import 'package:bealert/Settings/View/main_settings.dart';
import 'package:bealert/Statistics/View/main_statistics.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

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
  static final List<Widget> _pages = <Widget>[
    const MainHome(),
    const MainHistory(),
    const MainRecord(),
    const MainStatistics(),
    const MainSettings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

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
          print("selectedIndex: ${screenwidth * 0.155}");
          selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: const Icon(UniconsLine.estate),
            title:
                Text('Home', style: TextStyle(fontSize: screenwidth * 0.025)),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
          FlashyTabBarItem(
            icon: const Icon(UniconsLine.history),
            title: Text('History',
                style: TextStyle(fontSize: screenwidth * 0.025)),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
          FlashyTabBarItem(
            icon: const Icon(UniconsLine.record_audio),
            title: Text(
              'Record',
              style: TextStyle(fontSize: screenwidth * 0.025),
            ),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
          FlashyTabBarItem(
            icon: const Icon(UniconsLine.comparison),
            title: Text('Statistics',
                style: TextStyle(fontSize: screenwidth * 0.025)),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.settings),
            title: Text('Settings',
                style: TextStyle(fontSize: screenwidth * 0.025)),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
