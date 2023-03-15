import 'package:custom_drawer/src/pages/fragment1.dart';
import 'package:custom_drawer/src/pages/fragment2.dart';
import 'package:custom_drawer/src/pages/fragment3.dart';
import 'package:custom_drawer/src/pages/fragment4.dart';
import 'package:custom_drawer/src/widgets/draw.dart';
import 'package:custom_drawer/src/widgets/drawer_item.dart';
import 'package:custom_drawer/src/widgets/navigation_drawer_widget.dart';
import 'package:custom_drawer/src/widgets/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> fragments = [Fragment1(),Fragment2(),Fragment3(),Fragment4()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationDrawerWidget()
        ],
      ),
    );
  }
}


