import 'package:flutter/material.dart';
import 'package:sct/view/screenbadriya1.dart';
import 'package:sct/view/screenbadriya2.dart';
import 'package:sct/view/screenbadriya1.dart';

class dashboard extends StatefulWidget {
  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  int _currentIndex = 0;
  List _screens = [Badriya3(), badriya2()];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue.shade50,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (_updateIndex),
        selectedItemColor: Colors.blue.shade700,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "people",
            icon: Icon(
              Icons.group,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "list",
            icon: Icon(
              Icons.list,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
