import 'package:custom_drawer/src/pages/fragment1.dart';
import 'package:custom_drawer/src/pages/fragment2.dart';
import 'package:custom_drawer/src/pages/fragment3.dart';
import 'package:custom_drawer/src/pages/fragment4.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDesktopBody extends StatefulWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  State<MyDesktopBody> createState() => _MyDesktopBodyState();
}

class _MyDesktopBodyState extends State<MyDesktopBody> {
  List<Widget> _items = [
    ExpansionTile(
      title: Text('Item 2'),
      children: [],
    ),
    ExpansionTile(
      title: Text('Item 3'),
      children: [],
    ),
  ];
  List<Widget> fragments = [Fragment1(), Fragment2(), Fragment3(), Fragment4()];
  bool isExtended = true;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationRail(
              leading: Text(
                "MC",
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              selectedIndex: selectedIndex,
              backgroundColor: Colors.blue.shade900,
              minWidth: 75,
              extended: isExtended,
              unselectedIconTheme: IconThemeData(color: Colors.white70),
              selectedIconTheme: IconThemeData(color: Colors.white),
              onDestinationSelected: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              destinations: List.generate(
                _items.length,
                (index) => NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text("One"),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      isExtended = !isExtended;
                    });
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded))),
          Column(
            children: [
              Container(
                color: Colors.white,
                width: screenSize.width,
                height: 80,
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isExtended = !isExtended;
                            });
                          },
                          icon: Icon(Icons.menu),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Icon(Icons.search),
                        SizedBox(width: 20),
                        Text("Search...")
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.filter_center_focus_sharp)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.dark_mode)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.notifications)),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          height: 80,
                          width: 300,
                          decoration:
                              BoxDecoration(color: Colors.purple.shade100),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI6d9AEtx8OrEHU7lUR61NfzmRv4An4gzFhXawzy7HD9IGBvMT_rNkFkNa8Xa6aLTqQdA&usqp=CAU"),
                                  radius: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("test@codeaweb.com")
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              fragments[selectedIndex]
            ],
          ),
        ],
      ),
    );
  }
}
