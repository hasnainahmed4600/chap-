
import 'package:flutter/material.dart';
import 'package:kite_flutter/models/user.dart';
import 'package:kite_flutter/screens/home/search.dart';
import 'package:kite_flutter/screens/home/share.dart';
import 'package:kite_flutter/services/auth.dart';
import 'package:kite_flutter/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  BuildContext context;
  Home({this.context});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  FirebaseUser loggeduser;
  CurrentUser user;

  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUserInfo();
    
  }

  getCurrentUserInfo() async {
    loggeduser = await AuthService.getCurrentUser();
    print(loggeduser.uid);
    // Firestore.instance
    //        .collection('users')
    //        .document(loggedInUser.uid)
    //        .get()
    //        .then((DocumentSnapshot ds) {
    //      setState(() {
    //        var fname = ds.data["fname"];
    //        var lname = ds.data["lname"];
    //        var phone = ds.data["phone"];
    //        var email = ds.data["email"];
    //      });

    Firestore.instance.collection('users').document(loggeduser.uid).get()
    .then((DocumentSnapshot ds){
      setState(() {
        user = CurrentUser(email: ds.data["email"], uid: ds.data["uid"], username: ds.data["username"], profilePhotoUrl: ds.data["profilePhotoUrl"]);
        print(user.email);
      });
    }
    );
  }  

  Future<void> _clickSearch() async {
  return showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        title: Text('Search options'),
        message: Text('Please select the best way from the options below.'),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text('Explore'),
            onPressed: () { 
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Search'),
            onPressed: () { 
              Navigator.pop(context);
               Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Search()),
                            );
             },
          ),
          
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          child: Text('Cancel'),
          onPressed: () { 
            Navigator.pop(context);
           },
        ),
      );
    },
  );
}

  Future<void> _clickBarcode() async {
  return showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        title: Text('Barcode options'),
        message: Text('Please select the best way from the options below.'),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text('Scan'),
            onPressed: () { 
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: Text('KiteTag'),
            onPressed: () { 
              Navigator.pop(context);              
             },
          ),
           CupertinoActionSheetAction(
            child: Text('Kite+ Flyer'),
            onPressed: () { 
              Navigator.pop(context);              
             },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          child: Text('Cancel'),
          onPressed: () { 
            Navigator.pop(context);
           },
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: DrawerWidget(),
      //  drawerEdgeDragWidth:0.0,
      //   drawerDragStartBehavior: DragStartBehavior.down,
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 16),
                      InkWell(
                        onTap: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child: Container(
                          child: Image.asset('assets/images/List.png',
                              height: 38, width: 38),
                        ),
                      ),
                      SizedBox(width: 150),
                      SizedBox(width: 16),
                      Spacer(flex: 1),
                      Row(children: <Widget>[
                        InkWell(
                          onTap: (){
                            _clickBarcode();
                          },
                                                  child: Container(
                            child: Image.asset('assets/images/QR.png',
                                height: 25, width: 25),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        InkWell(
                          onTap: (){                            
                            _clickSearch();
                          },
                          child: Container(
                                               child: Image.asset('assets/images/OnBoardSearch.png',
                                height: 20, width: 20),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Share()),
                            );
                          },
                          child: Container(
                                               child: Image.asset('assets/images/OnBoardNewKite.png',
                                height: 20, width: 20),
                          ),
                        ),
                        SizedBox(width: 16)
                      ])
                    ]),
              ),
              HomeBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 8, left: 16),
            child: Text(
              "Kite",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: height * 0.80,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: _card(context, width),
                    // child: _card(context),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _card(context, width) => InkWell(
        onTap: () {},
        child: Card(
            margin: const EdgeInsets.all(2),
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(right: 16, top: 8),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 16),
                      Spacer(
                        flex: 1,
                      ),
                      Text("2 mins ago", textAlign: TextAlign.end),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 2, 16, 16),
                  child: Row(children: <Widget>[
                    Container(
                      child: Image.asset('assets/images/Confirm.png',
                          height: 20, width: 20),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      child: Image.asset('assets/images/Avatar1.png',
                          height: 47, width: 47),
                    ),
                    SizedBox(width: 16),
                    Container(
                      width: width * 0.55,
                      child: Column(children: <Widget>[
                        Text(
                          "John Rambi Did Accept Your Request",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          " You can connect to each other now",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ]),
                    ),
                  ]),
                )
              ],
            )),
      );
}
