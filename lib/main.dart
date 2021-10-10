import 'package:flutter/material.dart';
import 'page2.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children:<Widget>[
          new Container(
        decoration: new BoxDecoration(
        image: new DecorationImage(
        image: new AssetImage('assets/images/bg1.PNG'),
        fit: BoxFit.cover,
    ),
    )),
          Positioned(
            top: 160,
            left: 0,
            right: 0,
          child: new Container(
            child: Column(
                children: <Widget>[
            Image.asset('assets/images/logo.png', width: 270, height: 270),
            ]
    ),),
          ),
          Positioned(
          top: 270,
          left: 0,
          right: 0,
          child: new Container(
            child: Column(
                children: <Widget>[
                  Image.asset('assets/images/word.png', width: 300, height: 300),
                ]
            ),),
          ),
          Positioned(
          top: 580,
          left: 0,
          right: 0,
          child: new Container(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Page2()),
                  );
                },
                child: Text('Lets get started'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(270, 50),
                  primary: Color.fromRGBO(17, 25, 63, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)
                ),
              )
              )]

    ),)
          ),
    ]));
  }
}