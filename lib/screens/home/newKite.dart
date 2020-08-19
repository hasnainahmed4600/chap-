import 'package:flutter/material.dart';

class NewKite extends StatefulWidget {
  @override
  _NewKiteState createState() => _NewKiteState();
}

class _NewKiteState extends State<NewKite> {
   final _formKey = GlobalKey<FormState>();  
  //text field state
  String title = '';
  String message = '';
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
                        child: Text("New Kite", style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),)),
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
                         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                        child: TextFormField( 
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(234, 234, 234, 1),    
                            hintText: "Title",                        
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
                            prefixIcon: Icon(Icons.mode_edit, ),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an title' : null,
                          onChanged: (val) {
                            setState(() {
                              title = val;
                            });
                          },
                        ),
                      ), 

                      Container(                        
                         padding: EdgeInsets.symmetric( horizontal: 50.0),
                        child: TextFormField( 
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(234, 234, 234, 1),
                            hintText: 'Message',                            
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
                            prefixIcon: Icon(Icons.message, ),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an Message' : null,
                          onChanged: (val) {
                            setState(() {
                              message = val;
                            });
                          },
                        ),
                      ), 
                       
                    ],
                  ),
                )),
          );
  }
}