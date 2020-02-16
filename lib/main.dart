import 'package:finance_web/pages/dashboard.dart';
import 'package:finance_web/pages/new.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
      ),
      routes: {
        '/dashboard': (context) => DashboardPage(),
        '/new': (context) => NewPage(),
      },
      home: DashboardPage(),
    );
  }
}
