import 'package:flutter/material.dart';
import 'loginpage.dart';
void main() {
  runApp(Page3());
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        backgroundColor: const Color(0xff11183f)
      ),
      home: MyCustomForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}



class _MyCustomFormState extends State<MyCustomForm> {
  String ?email;
  String ?password;
  String ?name;
  String ?number;
  bool _obscureText = true;
  final _formkey=GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children:<Widget>[
            new Container(
              height: 100.0,
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
                  Padding(padding: const EdgeInsets.only(top: 90)),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Text(
                        "  Fill your \n  Details !!",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                        ),
                  ),

                  Padding(padding: const EdgeInsets.only(top: 18)),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => name = value,
                      decoration: InputDecoration(
                        contentPadding:EdgeInsets.fromLTRB(10,0,10,0),
                        labelText: "Enter Your Full Name...",
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => email = value,
                      decoration: InputDecoration(
                        contentPadding:EdgeInsets.fromLTRB(10,0,10,0),
                        labelText: "Enter Your Email...",
                        icon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) => number = value,
                      decoration: InputDecoration(
                        contentPadding:EdgeInsets.fromLTRB(10,0,10,0),
                        labelText: "Enter Your Mobile number...",
                        icon: Icon(Icons.call),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextFormField(
                      autocorrect: false,
                      obscureText: _obscureText,
                      onChanged: (value) => password = value,
                      decoration: InputDecoration(
                        contentPadding:EdgeInsets.fromLTRB(10,0,10,0),
                        labelText: "Create Password...",
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
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextFormField(
                      autocorrect: false,
                      obscureText: _obscureText,
                      onChanged: (value) => password = value,
                      decoration: InputDecoration(
                        contentPadding:EdgeInsets.fromLTRB(10,0,10,0),
                        labelText: "Confirm Password...",
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
                  SizedBox(height:45),
                  Button(
                    text: 'Register', callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page4()),
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
      padding: const EdgeInsets.all(6.0),
      child: Material(
        color: Color.fromRGBO(17, 24, 63, 1.0),
        elevation: 6.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 120.0,
          height: 15.0,
          child: Text(text, style: TextStyle(color: Colors.white, fontSize: 17)),
        ),
      ),
    );
  }
}