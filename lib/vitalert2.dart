import 'package:flutter/material.dart';
import 'profile.dart';
void main() {
  runApp(Vitalert2());
}
class Vitalert2 extends StatelessWidget {
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
                      image: new AssetImage('assets/images/range.jpg'),
                      fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                  top: 630,
                  left: 150,
                  right: 20,
                  child: new Container(
                    child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Profile()),
                                );
                              },
                              child: Text('<'),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(25, 25),
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