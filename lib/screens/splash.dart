import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kite_flutter/screens/wrapper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {

  @override
 void initState() {
  super.initState();

  loadData();
}

Future<Timer> loadData() async {
  return new Timer(Duration(seconds: 5), onDoneLoading);
}

onDoneLoading() async {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Wrapper()));
}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/KiteSplash.png'),
            fit: BoxFit.cover
        ) ,
      ),
      child: Center(
        child: SpinKitRipple(
          color: Colors.white,
          size: 200.0,
        ),
      ),
    );
  }
}