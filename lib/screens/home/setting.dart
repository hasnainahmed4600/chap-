import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
   final _formKey = GlobalKey<FormState>();
   TextEditingController _textEditingController = TextEditingController(text: "test");
  //text field state
  String username = '';
  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;   
   
    return Scaffold(
            resizeToAvoidBottomPadding:true,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,            
              leading: InkWell(
                onTap: (){
                 Navigator.pop(context);
                },
                child: Image.asset('assets/images/Back.png')
                ),              
              actions: <Widget>[
                FlatButton(
                 child: Image.asset('assets/images/OK.png'),               
                  onPressed: () async {
                    Navigator.pop(context);
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
                        height: height * 0.1,
                         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                        child: Text("Settings", style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),)),
                      SizedBox(height: 20,),
                      Container(
                         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),                  
                   
                        width: 150,
                        height: 150,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage('assets/images/Avatar1.png'),
                            )),
                      ),
                   
                      SizedBox(height: height * 0.07),  
                      Container(
                        height: height * 0.3,
                         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                        child: TextFormField(    
                          controller: _textEditingController,                    
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(234, 234, 234, 1),                            
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
                              val.isEmpty ? 'Enter an Username' : null,
                          onChanged: (val) {
                            setState(() {
                              username = val;
                            });
                          },
                        ),
                      ), 
                      
                       Container(
                         height: height * 0.12,
                          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                         child: SizedBox(
                          height: 45,
                            child: RaisedButton(
                            color: Color.fromRGBO(252, 72, 77, 1),
                            shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(25.7),
                                  ),
                            child: Text(
                              'Delete Account',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: (){                         
                             
                            },
                          ),
                      ),
                       ),
                    ],
                  ),
                )),
          );
  }
}