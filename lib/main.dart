import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));

    _iconAnimation = new CurvedAnimation(
        parent: _animationController, curve: Curves.easeOut);

    _iconAnimation.addListener(() {
      this.setState(() {});
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand, //It's cover entire body to fit.
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/img/background.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            //This line and below line both for opacity
            colorBlendMode: BlendMode.darken, //It's for opacity
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(size: _iconAnimation.value * 100,),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark, primarySwatch: Colors.blueGrey,
                      inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(color: Colors.blueGrey,
                        fontSize: 20.0)
                      )),
                  child: new Container(
                    padding: const EdgeInsets.all(20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: new InputDecoration(labelText: "Email"),//Label text for moving hit top. if you use hintText instead of labelText  TextFormField hint not moving.
                        ),
                        new TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(labelText: "Password"),//Label text for moving hit top. if you use hintText instead of labelText  TextFormField hint not moving.
                        ),
                        new SizedBox(height: 20.0,),
                        new MaterialButton(
                            color: Colors.blueGrey,
                            textColor: Colors.white,
                            child: new Text("Login"),
                            onPressed: () =>{})
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
