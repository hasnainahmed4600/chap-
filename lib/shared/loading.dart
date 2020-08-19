import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/KiteSplash.png"),
            fit: BoxFit.cover,
          ),
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