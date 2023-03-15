import 'package:custom_drawer/src/pages/fragment1.dart';
import 'package:custom_drawer/src/widgets/drawer_item.dart';
import 'package:custom_drawer/src/widgets/drawer_items.dart';
import 'package:custom_drawer/src/widgets/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigateTo = (page) => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));
    final safeArea = EdgeInsets.only(top: 20);
    final provider = Provider.of<NavigationProvider>(context);
    final isCollapsed = provider.isCollapsed;
    return Container(
      width: isCollapsed ? 70 : null,
      child: Drawer(
        width: 245,
        child: Container(
          color: Colors.blue.shade900,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 24).add(safeArea),
                  width: double.infinity,
                  color: Colors.white12,
                  child: buildHeader(isCollapsed)),
              ListView(
                shrinkWrap: true,
                children: [
                  ExpansionTile(
                    title: Text("User management"),
                    children: <Widget>[
                      TextButton(onPressed: (){
                        navigateTo(Fragment1());
                      }, child: Text("Racks")),
                      TextButton(onPressed: (){

                      }, child: Text("Devices")),
                      TextButton(onPressed: (){}, child: Text("Networks")),
                    ],
                  ),
                  ExpansionTile(
                    title: Text("User management"),
                    children: <Widget>[Text("Users"),
                      Text("Add user"),
                      Text("Migrate users")
                    ],
                  ),


                ],
              ),
              // buildList(items: itemsFirst, isCollapsed: isCollapsed),
              Spacer(),
              buildCollapseIcon(context, isCollapsed),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }


  buildList({required List<DrawerItem> items, required bool isCollapsed}) =>
      ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return buildMenuItem(
            isCollapsed: isCollapsed,
            text: item.title,
            icon: item.icon,
            onClicked: () => selectedItem(context, index),
          );
        },
      );

  void selectedItem(BuildContext context, int index) {
    final navigateTo = (page) => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));
    switch (index) {
      case 0:
        navigateTo(Fragment1());
        break;
    }
  }

  buildMenuItem(
      {required bool isCollapsed,
      required String text,
      required IconData icon,
      VoidCallback? onClicked}) {
    final color = Colors.white;
    final leading = Icon(
      icon,
      color: color,
    );

    return Material(
        color: Colors.transparent,
        child: isCollapsed
            ? ListTile(
                title: leading,
                onTap: onClicked,
              )
            : ExpansionTile(
                leading: leading,
                title: Text(
                  text,
                  style: TextStyle(color: color, fontSize: 16),
                ),
                initiallyExpanded: false,
                iconColor: Colors.white,
                children: [
                  ListTile(
                    title: Text(
                      text,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    onTap: onClicked,
                  )
                ],
                // onTap: onClicked,
              ));
  }

  buildCollapseIcon(BuildContext context, bool isCollapsed) {
    final double size = 52;
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = EdgeInsets.only(right: 16);

    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            width: size,
            height: size,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          onTap: () {
            final provider =
                Provider.of<NavigationProvider>(context, listen: false);

            provider.toggleIsCollapsed();
          },
        ),
      ),
    );
  }

  Widget buildHeader(bool isCollapsed) => isCollapsed
      ? FlutterLogo(
          size: 48,
        )
      : Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            FlutterLogo(
              size: 48,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              "Flutter",
              style: TextStyle(fontSize: 32, color: Colors.white),
            )
          ],
        );
}
