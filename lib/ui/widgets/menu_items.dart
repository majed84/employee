import 'package:flutter/material.dart';

class Menuitems extends StatelessWidget {
  const Menuitems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("الموقع"),
        ),
      ],
    );
  }
}
