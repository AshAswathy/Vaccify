import 'package:flutter/material.dart';
import 'package:flutter_google_maps_clusters/covidcases.dart';
import 'package:flutter_google_maps_clusters/vitalert1.dart';
import 'jasaprofile.dart';
import 'mainmap.dart';
import 'vitalert1.dart';
import 'covidcases.dart';
import 'Vaccratio.dart';


void main() {
  runApp(Profile());
}


class Profile extends StatelessWidget {
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
                      image: new AssetImage('assets/images/bg2.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  )
                  ),
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: new Container(
                    child: Text(
                      'Vaccify',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontFamily:"Roboto",
                        fontWeight: FontWeight.bold,

                      ),
                      textAlign: TextAlign.center,
                    )
                ),
              ),
              Positioned(
                top: 110,
                left: 0,
                right: 0,
                child: new Container(
                  child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/pic.png', width: 100, height: 100),
                      ]
                  ),),
              ),
              Positioned(
                top: 230,
                left: 0,
                right: 0,
                child: new Container(
                  child: Text(
                    'Hello Jason !',
                    style: TextStyle(

                      fontSize: 25,
                      color: Colors.white,
                      fontFamily:"Roboto",
                      fontWeight: FontWeight.bold,

                    ),
                    textAlign: TextAlign.center,
                  )
                ),
              ),
              Positioned(
                top: 350,
                left: 20,
                right: 240,
                child: new Container(
                    child: Column(
                        children:[
                          ElevatedButton(
                              onPressed:() {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.date_range_rounded,size: 40,),
                                  Text("\n BOOK YOUR SLOT",
                                    style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                  ), textAlign: TextAlign.center,)
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(95, 120),
                                primary: Color.fromRGBO(17, 25, 63, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)
                                ),
                              )
                          )]

                    ),
                ),
              ),

              Positioned(
                top: 350,
                left: 50,
                right: 50,
                child: new Container(
                  child: Column(
                      children:[
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Mainmap()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.location_on_rounded,size: 40,),
                                Text("\n VMAP",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                  ), textAlign: TextAlign.center,)
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(95,120),
                              primary: Color.fromRGBO(17, 25, 63, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)
                              ),
                            )
                        )]

                  ),
                ),
              ),

              Positioned(
                top: 350,
                left: 240,
                right: 20,
                child: new Container(
                  child: Column(
                      children:[
                        ElevatedButton(
                            onPressed: () { },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.medical_services_rounded,size: 40,),
                                Text("\nCHECK THE AVAILABILITY",
                                  style: TextStyle(
                                    fontSize: 9.5,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                  ), textAlign: TextAlign.center,)
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(95,120),
                              primary: Color.fromRGBO(17, 25, 63, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)
                              ),
                            )
                        )]

                  ),
                ),
              ),

              Positioned(
                top: 490,
                left: 19,
                right: 6,
                child: new Container(
                  child: Row(
                      children:[
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Vitalert1()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.group_rounded,size: 35,),
                                Text(" VITALERT - SAFER PUBLIC ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ), textAlign: TextAlign.center,),
                                Icon(Icons.lock,size: 35,),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(317, 85),
                              primary: Color.fromRGBO(17, 25, 63, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)
                              ),
                            )
                        )]

                  ),
                ),
              ),

              Positioned(
                top: 590,
                left: 25,
                right: 200,
                child: new Container(
                  child: Column(
                      children:[
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Covid()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Covid Cases",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ), textAlign: TextAlign.center,)
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(179, 65),
                              primary: Color.fromRGBO(117,122,150,1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)
                              ),
                            )
                        )]

                  ),
                ),
              ),

              Positioned(
                top: 590,
                left: 200,
                right: 25,
                child: new Container(
                  child: Column(
                      children:[
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Vcovid()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Vaccination \nRatio",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ), textAlign: TextAlign.center,)
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(179, 65),
                              primary: Color.fromRGBO(117,122,150,1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)
                              ),
                            )
                        )]

                  ),
                ),
              ),

              Positioned(
                top: 700,
                left: 0,
                right: 0,
                child: new Container(
                  child: Row(
                      children:[
                        ElevatedButton(
                            onPressed: () { },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("PublicDen \t",
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ), textAlign: TextAlign.center,),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(245, 57),
                              primary: Color.fromRGBO(17, 25, 63, 1),
                            )
                        )]

                  ),
                ),
              ),

              Positioned(
                top: 700,
                left: 240,
                right: 0,
                child: new Container(
                  child: Row(
                      children:[
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyApp()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Profile",
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Color.fromRGBO(17, 25, 63, 1),
                                    fontWeight: FontWeight.bold,
                                  ), textAlign: TextAlign.center,),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(115, 57),
                              primary: Colors.white70,
                                side: BorderSide(width: 5.0, color: Color.fromRGBO(17, 25, 63, 1),)
                            ),

                        )]

                  ),
                ),
              ),





            ]));
  }
}