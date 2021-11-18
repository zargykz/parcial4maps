import 'dart:async';
import 'package:flutter/material.dart';

import 'homapage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parcial 4',
      theme: ThemeData(
        primaryColor: Color(0xff6200ee),
      ),
      home: HomePage(),
    );
  }
}
