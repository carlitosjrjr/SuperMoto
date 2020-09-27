import 'package:flutter/material.dart';
import 'package:supermoto_app/src/pages/principal_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Super Moto',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => PrincipalPage(),
      },
    );
  }
}
