import 'package:flutter/material.dart';

class SentRequests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width; 
      double height = MediaQuery.of(context).size.height;   
    return  Scaffold(
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
              
            ),
            body:Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 8, left: 16),
            child: Text(
              "Requests",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: height * 0.8,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: _card(context, width),                
                  );
                }),
          ),
        ],
      ),
    )
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                 
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Row(                   
                        children: <Widget>[
                        
                        Container(
                          child: Image.asset('assets/images/Avatar2.png',
                              height: 47, width: 47),
                        ),
                        SizedBox(width: 16),
                        Container(
                         
                           child:Text(
                              "John Rambi",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                        ),
                        Spacer(flex:1),
                        Container(
                           child: Image.asset('assets/images/RoundedDecline.png',
                              height: 35, width: 35),
                        ),
                        SizedBox(width: 16),
                        Container(
                           child: Image.asset('assets/images/RoundedConfirm.png',
                              height: 35, width: 35),
                        ),
                       
                      ]),
                    ),
              ],
            )
              ),
      );
}