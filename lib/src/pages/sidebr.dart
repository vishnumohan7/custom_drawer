import 'package:custom_drawer/src/pages/fragment1.dart';
import 'package:custom_drawer/src/pages/fragment2.dart';
import 'package:custom_drawer/src/pages/fragment3.dart';
import 'package:custom_drawer/src/pages/fragment4.dart';
import 'package:custom_drawer/src/widgets/custom_listtile.dart';
import 'package:flutter/material.dart';
import 'package:tuanis_sidebar/tuanis_sidebar.dart';

class Example extends StatefulWidget {
  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    List<Widget> fragments = [
      Fragment1(),
      Fragment2(),
      Fragment3(),
      Fragment4()
    ];
    int selectedIndex = 0;

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TuanisSidebar(
            backgroundColor: Colors.blue.shade900,
            iconColor: Colors.white,
            selectedColor: Colors.white,
            collapseItemBackgroundColor: Colors.white,
            textColor: Colors.white,
            tileColor: Colors.blue.shade900,
            selectedTileColor: Colors.blue.shade900,
            sectionsAligment: MainAxisAlignment.spaceBetween,
            selectedItemId: 'settings',
            sections: [
              TuanisSidebarSection(
                title: Text(
                  'DC',
                  style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                items: [
                  TuanisSidebarItem(
                    id: 'dashboard',
                    tile: ListTile(
                      leading: Icon(Icons.dashboard),
                      title: Text('Dashboard'),
                    ),
                    items: [
                      TuanisSidebarItem(
                          id: 'dashboard_1',
                          tile: CustomListTile(
                              onPressed: (int index) {
                                setState(() {
                                  selectedIndex = index;
                                });
                                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Fragment1()));
                              },
                              title: "title",index: selectedIndex,))
                    ],
                  ),
                  TuanisSidebarItem(
                    id: 'Racks',
                    tile: ListTile(
                      title: Text('Racks'),
                      leading: Icon(Icons.developer_board_rounded),
                    ),
                    items: [
                      TuanisSidebarItem(
                        id: 'dashboard_1',
                        tile: ListTile(
                          leading: Icon(Icons.abc),
                          title: Text('Child of Dashboard'),
                        ),
                      ),
                      TuanisSidebarItem(
                        id: 'dashboard_1',
                        tile: ListTile(
                          leading: Icon(Icons.abc),
                          title: Text('Child of Dashboard'),
                        ),
                      )
                    ],
                  ),
                  TuanisSidebarItem(
                    id: 'Devices',
                    tile: ListTile(
                      title: Text('Devices'),
                      leading: Icon(Icons.monitor),
                    ),
                    items: [
                      TuanisSidebarItem(
                        id: 'dashboard_1',
                        tile: ListTile(
                          leading: Icon(Icons.abc),
                          title: Text('Child of Dashboard'),
                        ),
                      ),
                      TuanisSidebarItem(
                        id: 'dashboard_1',
                        tile: ListTile(
                          leading: Icon(Icons.abc),
                          title: Text('Child of Dashboard'),
                        ),
                      )
                    ],
                  ),
                  TuanisSidebarItem(
                    id: 'Networks',
                    tile: ListTile(
                      title: Text('Networks'),
                      leading: Icon(Icons.monitor),
                    ),
                    items: [
                      TuanisSidebarItem(
                        id: 'dashboard_1',
                        tile: ListTile(
                          leading: Icon(Icons.abc),
                          title: Text('Child of Dashboard'),
                        ),
                      ),
                      TuanisSidebarItem(
                        id: 'dashboard_1',
                        tile: ListTile(
                          leading: Icon(Icons.abc),
                          title: Text('Child of Dashboard'),
                        ),
                      )
                    ],
                  )
                ],
              ),
              TuanisSidebarSection(
                backgroundColor: Colors.blue.shade900,
                borderColor: Colors.blue.shade900,
                items: [
                  TuanisSidebarItem(
                    id: 'logout',
                    tooltip: const Text(
                      'Salir de aqui',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    tile: ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Logout'),
                      onTap: () {
                        print('Logout');
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
          Expanded(child: fragments[selectedIndex])
        ],
      ),
    );
  }
}
