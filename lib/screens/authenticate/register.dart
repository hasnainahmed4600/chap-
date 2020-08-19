
import 'package:flutter/material.dart';
import 'package:kite_flutter/services/auth.dart';
import 'package:kite_flutter/services/service.dart';
import 'package:kite_flutter/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  File _image;  
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  bool loading = false;
  //text field state
  String email = '';
  String password = '';
  String username = '';
  String error = '';
  String profilePhotoUrl ='https://firebasestorage.googleapis.com/v0/b/kite-flutter.appspot.com/o/RoundedKiteLogoPurp.png?alt=media&token=12c64b65-2f31-43db-a02b-6b47be8b8b00';

  initState() {
    super.initState();   
  }

  void setError(dynamic error) {
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(error.toString())));
    setState(() {
    });
  }

  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('Image Path $_image');
      uploadPic();
    });
  }
  
  Future uploadPic() async {
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    profilePhotoUrl = dowurl.toString();

    
    setState((){
      print("Profile Picture uploaded");
      print(profilePhotoUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
           resizeToAvoidBottomPadding:true,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,            
              leading: Container(),          
              actions: <Widget>[
                FlatButton(
                 child: Image.asset('assets/images/OK.png'),               
                  onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                              loading = true;
                            });
                            bool result = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);                            
                            if (result == null || result == false) {
                              setState(() {
                                loading = false;
                                error = 'Please supply a valid email';
                              });
                            } else {
                              final result = await _auth.registerWithemailAndPassword(
                                email, password); 
                                print(result.uid);                 
                                Service().addCard(username, email, password, result.uid, profilePhotoUrl);                                 
                               
                            }
                      }
                  },
                )
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric( horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                       Container(                       
                        child: Text("Sign Up", style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),)),
                      SizedBox(height: 20,),
                      Container(
                        // child: Image.asset('assets/images/KiteLogoPurp.png', width: 150,height: 150,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 80,
                              backgroundColor: Color.fromRGBO(0, 79, 255, 0.45),
                              child: ClipOval(
                                child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child:(_image != null)? Image.file(_image, fit:BoxFit.fill) 
                                  :Image.network("https://firebasestorage.googleapis.com/v0/b/kite-flutter.appspot.com/o/RoundedKiteLogoPurp.png?alt=media&token=12c64b65-2f31-43db-a02b-6b47be8b8b00", fit: BoxFit.fill,),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top:100.0),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.camera_alt,
                                    size: 30.0,
                                    ),
                                  onPressed: (){
                                    getImage();
                                  },
                                ),
                              )
                          ],
                        )
                      ),
                      SizedBox(height: 50.0),                                        
                      TextFormField(
                        textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(234, 234, 234, 1),
                            hintText: 'Username',
                            contentPadding:
                                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 13.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            prefixIcon: Icon(Icons.supervised_user_circle, ),
                          ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an Username' : null,
                        onChanged: (val) {
                          setState(() {
                            username = val;
                          });
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                       textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(234, 234, 234, 1),
                            hintText: 'Email',
                            contentPadding:
                                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 13.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            prefixIcon: Icon(Icons.email, ),
                          ),
                       
                        validator: (val) => val.length < 6
                            ? 'Enter an Email'
                            : null,
                        onChanged: (val) {
                          email= val;
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                       textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(234, 234, 234, 1),
                            hintText: 'Password',
                            contentPadding:
                                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 13.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            prefixIcon: Icon(Icons.verified_user, ),
                          ),
                       validator: (val) => val.length < 6
                            ? 'Enter an password 6+ chars long'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      
                      SizedBox(height: 20.0),
                      SizedBox(
                        height: 45,
                          child: RaisedButton(
                          color: Color.fromRGBO(113, 119, 249, 1),
                          shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
                          child: Text(
                            'Already a Member?',
                            style: TextStyle(color: Colors.white),
                          ),
                          elevation: 4,
                          onPressed: (){                         
                            widget.toggleView();
                          },
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Text(error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0))
                    ],
                  ),
                )),
          );
  }



}


