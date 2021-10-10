import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'form.dart';
void main() {
  runApp(Page2());
}

class Page2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          backgroundColor: const Color(0xff080f28)
      ),
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

  final _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children:<Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('assets/images/Vaccify1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Form(
              key: _formkey,
              child: ListView(
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(top: 450)),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child:Button(
                      text: 'Login', callback: () { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page4()),
                    ); },
                    )
                  ),

                  Padding(padding: const EdgeInsets.only(top: 4)),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child:Button(
                        text: 'Sign Up', callback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Page3()),
                        );
                      },
                      )
                  ),

                ],
              ),
            ),
          ],
        ));
  }
}

class Button extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const Button({Key ?key, required this.callback, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Color.fromRGBO(17, 24, 63, 1.0),
        elevation: 6.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 190.0,
          height: 30.0,
          child: Text(text, style: TextStyle(color: Colors.white, fontSize: 17)),
        ),
      ),
    );
  }
}