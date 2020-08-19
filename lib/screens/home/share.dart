import 'package:flutter/material.dart';
import 'package:kite_flutter/screens/home/newKite.dart';

class Share extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/images/Back.png')),
          actions: <Widget>[
            FlatButton(
              child: Image.asset('assets/images/SendKite.png', width: 96, height: 40,),
              onPressed: () async {
               Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewKite()),
                            );
              },
            )
          ],
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 8, left: 16),
                child: Text(
                  "Share",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8, left: 16, right: 24,),
                child: Row(children: <Widget>[
                  Container(
                    child: Text("Select Users"),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: width * 0.48,
                    height: height * 0.1,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,                        
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                           
                            child: _selectedUsers(),
                          );
                        }),
                  ),
                  SizedBox(width: 16,),
                  Container(
                    child: Text("+3", style: TextStyle(fontSize: 16, fontWeight:FontWeight.bold),),
                  ),
                  Spacer(flex:1),
                  Container(
                    child: Image.asset('assets/images/RoundCheck.png', width: 23, height: 23,),
                  )
                ]),
              ),
              Container(
                height: height * 0.7,
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(top: 8),
                        child: _card(context, width),
                      );
                    }),
              ),
            ],
          ),
        ));
  }

  Widget _selectedUsers() => Container(
        width: 33,
        height: 33,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/Avatar1.png'),
            )),
      );

  Widget _card(context, width) => InkWell(
        onTap: () {},
        child: Card(
            margin: const EdgeInsets.all(2),
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Row(children: <Widget>[
                    Container(
                      child: Image.asset('assets/images/Avatar1.png',
                          height: 47, width: 47),
                    ),
                    SizedBox(width: 16),
                    Container(
                      child: Text(
                        "John Rambi",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(flex: 1),
                    Container(
                      child: Icon(Icons.check, color: Color.fromRGBO(114, 121, 249, 1),),
                    ),
                  ]),
                ),
              ],
            )),
      );
}
