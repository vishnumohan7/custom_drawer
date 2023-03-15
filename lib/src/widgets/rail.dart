import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomNavigationRail extends StatefulWidget {
  @override
  _CustomNavigationRailState createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
        minWidth: 75,
        backgroundColor: Colors.blue.shade900,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          // Handle navigation here
        },
        labelType: NavigationRailLabelType.all,
        destinations: [
          NavigationRailDestination(
              icon: Icon(Icons.ac_unit),
              label:  Text("test"),
              ),
          NavigationRailDestination(
              icon: Icon(Icons.ac_unit),
              label:  Text("test"),
              ),
        ]);
  }
}


