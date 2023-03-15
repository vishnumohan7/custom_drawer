import 'package:custom_drawer/src/widgets/navigation_drawer_widget.dart';
import 'package:flutter/cupertino.dart';

class Fragment1 extends StatefulWidget {
  const Fragment1({Key? key}) : super(key: key);

  @override
  State<Fragment1> createState() => _Fragment1State();
}

class _Fragment1State extends State<Fragment1> {
  @override
  Widget build(BuildContext context) {
    return  Center(child: Text("fragment1"),);
  }
}
