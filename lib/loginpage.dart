import 'package:flutter/material.dart';
import 'profile.dart';
void main() {
  runApp(Page4());
}

class Page4 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          backgroundColor: const Color(0xff11183f)
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
  String ?email;
  String ?password;
  bool _obscureText = true;
  final _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children:<Widget>[
            new Container(
              height: 150.0,
              decoration: new BoxDecoration(
                color:Color.fromRGBO(17, 24, 63, 1.0) ,
                boxShadow: [
                  new BoxShadow(blurRadius: 10.0)
                ],
                borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.elliptical(
                        MediaQuery.of(context).size.width, 50.0)),
              ),
            ),
            Form(
              key: _formkey,
              child: ListView(
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(top: 150)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:Text(
                      "  Hello ! \n  Welcome back..",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => email = value,
                      decoration: InputDecoration(
                        labelText: "Enter Your Email...",
                        icon: Icon(Icons.email),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autocorrect: false,
                      obscureText: _obscureText,
                      onChanged: (value) => password = value,
                      decoration: InputDecoration(
                        labelText: "Enter Your Password...",
                        icon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height:20),
                  Button(
                    text: 'Submit', callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                  )
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
          minWidth: 200.0,
          height: 45.0,
          child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
    );
  }
}