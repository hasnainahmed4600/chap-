import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:kite_flutter/screens/home/featuredList.dart';
import 'package:kite_flutter/screens/home/mainList.dart';
import 'package:kite_flutter/screens/home/requestList.dart';
import 'package:kite_flutter/screens/home/sentRequests.dart';
import 'package:kite_flutter/screens/home/setting.dart';
import 'package:kite_flutter/services/auth.dart';

class DrawerWidget extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SizedBox(
        width: width * 0.5,
        child: Drawer(
          child: Container(
            color: Color.fromRGBO(13, 13, 13, 1),
            child: Column(children: <Widget>[
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                height: height * 0.15,
                child: Badge(
                  showBadge: true,
                  position: BadgePosition.topRight(top: 10, right: 10),
                  badgeColor: Color.fromRGBO(128, 255, 0, 1),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/Avatar1.png'),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  height: height * 0.05,
                  child: Text(
                    "Test",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              Container(
                  height: height * 0.5,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainList()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(children: <Widget>[
                              Container(
                                child: Image.asset(
                                  'assets/images/MainList.png',
                                  width: 26,
                                  height: 26,
                                ),
                              ),
                              SizedBox(width: 16),
                              Container(
                                  child: Text("Main List",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)))
                            ]),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeaturedList()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(children: <Widget>[
                              Container(
                                child: Image.asset(
                                  'assets/images/FeaturedList.png',
                                  width: 26,
                                  height: 26,
                                ),
                              ),
                              SizedBox(width: 16),
                              Container(
                                  child: Text("Featured List",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)))
                            ]),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RequestList()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(children: <Widget>[
                              Container(
                                child: Image.asset(
                                  'assets/images/RequestBox.png',
                                  width: 26,
                                  height: 26,
                                ),
                              ),
                              SizedBox(width: 16),
                              Container(
                                  child: Text("Request List",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)))
                            ]),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SentRequests()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(children: <Widget>[
                              Container(
                                child: Image.asset(
                                  'assets/images/SentRequest.png',
                                  width: 26,
                                  height: 26,
                                ),
                              ),
                              SizedBox(width: 16),
                              Container(
                                  child: Text("Sent Requests",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)))
                            ]),
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                height: height * 0.2,
                padding: const EdgeInsets.all(8),
                child: Column(children: <Widget>[
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Setting()),
                        );
                      },
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8),
                              Container(
                                  child: Text("Settings",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)))
                            ],
                          )),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        await _auth.signOut();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Sign Out",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
