
import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  addCard(username, email, password, uid, profilePhotoUrl) { 
    print("OK");
      Firestore.instance
          .collection('users')
          .document(uid)
          .setData({
            'uid': uid,
            'username': username,
            'email': email,
            'password': password,
            'profilePhotoUrl': profilePhotoUrl,
          });
    }
  }



