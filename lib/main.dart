import 'package:employee/themes/theme.dart';
import 'package:employee/ui/screens/myhomepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'حساب الايام',
      theme: mythemedata,
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'حساب الأيام'),
      },
    );
  }
}
