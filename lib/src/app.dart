import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:custom_drawer/src/pages/drawer.dart';
import 'package:custom_drawer/src/pages/home_page.dart';
import 'package:custom_drawer/src/pages/sidebr.dart';
import 'package:custom_drawer/src/widgets/draw.dart';
import 'package:custom_drawer/src/widgets/nav_rail.dart';
import 'package:custom_drawer/src/widgets/navigation_drawer_widget.dart';
import 'package:custom_drawer/src/widgets/navigation_provider.dart';
import 'package:custom_drawer/src/widgets/rail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
       providers: [
         ChangeNotifierProvider(create: (context) => NavigationProvider(),),
       ],
      child: MaterialApp(
        theme: ThemeData(

        ),
        home: MyHomePage()
      ),
    );
  }
}
