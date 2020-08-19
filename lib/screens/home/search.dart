import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
   TextEditingController _textEditingController;
   String username = '';
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
          
        ),
        body: Container(             
              child:Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                padding: const EdgeInsets.only(top: 8, left: 16),
                child: Text(
                  "Search",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                 padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
                 child: TextFormField(    
                          controller: _textEditingController,                    
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(234, 234, 234, 1),
                            hintText: 'Search',                            
                            contentPadding:
                                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 13.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            prefixIcon: Icon(Icons.search, ),
                          ), 
                          onChanged: (val) {
                            setState(() {
                              username = val;
                            });
                          },
                        ),
              ),
                  Container(
                    height: height * 0.7,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: ListView.builder(
                        itemCount: 0,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(top: 8),
                            child: _card(context, width),
                          );
                        }),
                  ),
                ],
              ),
        ),
        );  
  }

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