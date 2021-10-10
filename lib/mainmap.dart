import 'package:flutter/material.dart';
import 'Homepage.dart';

void main() => runApp(Mainmap());

class Mainmap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps Cluster Example',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
