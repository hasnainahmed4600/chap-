import 'package:flutter/material.dart';
import 'package:kite_flutter/models/user.dart';
import 'package:kite_flutter/screens/authenticate/authenticate.dart';
import 'package:kite_flutter/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
   
    //return either Home or Authenticate Widget
    if(user == null){
      return Authenticate();
    }else {
      return Home(); 
    }
  }
}