import 'package:flutter/material.dart';
import 'profile.dart';
void main() {
  runApp(Vcovid());
}
class Vcovid extends StatelessWidget {
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
      appBar: AppBar(
        title: Text('Vaccination Ratio',textAlign: TextAlign.center),
        backgroundColor: Color.fromRGBO(17, 25, 63, 1),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child:
            new Container(
              child: Column(
                  children: <Widget>[
                    Image.asset('assets/images/1.png', width: 400, height: 400),
                  ]
              ),),),
          Positioned(
            top: 140,
            left: 0,
            right: 0,
            child:
            new Container(
              child: Column(
                  children: <Widget>[
                    Image.asset('assets/images/2.png', width: 450, height: 450),
                  ]
              ),),),
          Positioned(
            top: 310,
            left: 0,
            right: 0,
            child:
            new Container(
              child: Column(
                  children: <Widget>[
                    Image.asset('assets/images/3.png', width: 450, height: 450),
                  ]
              ),),),

          Positioned(
            top: 600,
            left: 20,
            right: 0,
            child: new Container(
              child: Row(
                children:[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("<",
                          textAlign: TextAlign.center,),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(25,25),
                      primary: Color.fromRGBO(17, 25, 63, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
                      ),
                    ),
                  )],

              ),
            ),
          ),
        ],

      ),

    );
  }
}