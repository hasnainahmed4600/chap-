
import 'package:flutter/material.dart';
import 'package:kite_flutter/models/user.dart';
import 'package:kite_flutter/screens/splash.dart';
import 'package:kite_flutter/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
       home: SplashScreen(),
      ),
    );
  }
}

