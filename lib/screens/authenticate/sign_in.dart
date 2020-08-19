
import 'package:flutter/material.dart';
import 'package:kite_flutter/services/auth.dart';
import 'package:kite_flutter/shared/loading.dart';


class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  void setError(dynamic error) {
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(error.toString())));
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding:true,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,            
              leading: InkWell(
                onTap: (){
                  widget.toggleView();
                },
                child: Image.asset('assets/images/Back.png')
                ),              
              actions: <Widget>[
                FlatButton(
                 child: Image.asset('assets/images/OK.png'),               
                  onPressed: () async {
                     if (_formKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth
                                .signInWithemailAndPassword(email, password);

                            if (result == null || result == false) {
                              setState(() {
                                loading = false;
                                error =
                                    'Could not sign in with those credentials';
                              });
                            }
                     }
                  },
                )
              ],
            ),
            body: Container(
               
                height: height,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      Container(
                         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                        child: Text("Sign In", style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),)),
                      SizedBox(height: 20,),
                      Container(
                        child: Image.asset('assets/images/KiteLogoPurp.png', width: 150,height: 150,),
                      ),
                      SizedBox(height: 50.0),  
                      Container(
                         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                        child: TextFormField(                        
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
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                      ),                     
                      Container(
                         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                        child: TextFormField(
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
                            prefixIcon: Icon(Icons.verified_user),
                          ),
                          obscureText: true,
                          validator: (val) => val.length < 6
                              ? 'Enter an password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            password = val;
                          },
                        ),
                      ),
                     
                      SizedBox(height: 12.0),
                      Text(error,
                          style: TextStyle(color: Colors.red, fontSize: 18.0))
                    ],
                  ),
                )),
          );
  }
}
