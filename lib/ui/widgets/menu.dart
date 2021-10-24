import 'package:flutter/material.dart';
import 'menu_items.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Container(
        color: Theme.of(context).accentColor,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Majed Jemmieh"),
              accountEmail: Text("mjemmieh@hotmail.com"),
            ),
            // Menuitems(),
          ],
        ),
      ),
    );
  }
}
