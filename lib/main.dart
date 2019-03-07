import 'package:flutter/material.dart';
import './ui/pages/home.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(App4());

class App4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'app4',
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: SplashScreen(),
      routes: {"builder": (_) => HomePage()},
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, mainPage);
  }

  void mainPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Image.asset("img/36411.png"),
              SizedBox(
                height: 30.0,
              ),
              SpinKitThreeBounce(
                color: Colors.white,
                size: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
