import 'dart:collection';
import 'package:sct/list/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sct/dashbord/dashbord.dart';
import 'package:sct/list/list.dart';
import 'package:sct/view/screenbadriya2.dart';
import 'package:expandable/expandable.dart';
import 'package:sct/setting/colors.dart';

class Badriya3 extends StatefulWidget {
  @override
  State<Badriya3> createState() => _Badriya3State();
}

class _Badriya3State extends State<Badriya3> {
  var dummy;
  @override
  void initState() {
    super.initState();
    dummy = _getimages();
    print("data ${dummy}");
  }

  _getimages() async {
    var imagelist = await list;
    print(imagelist);
    return imagelist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: AhotColors.primary1,
        //   toolbarHeight: 200,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(
        //       bottom: Radius.circular(50),
        //     ),
        //   ),
        // ),
        body: ListView(physics: ScrollPhysics(), children: [
      Stack(children: [
        Container(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [AhotColors.secondary3, AhotColors.primary2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                height: 200,
              ),
              Icon(Icons.arrow_back)
            ],
          ),
        ),
        SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            ),
            SizedBox(
                width: 500,
                height: 150,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Card(
                        color: AhotColors.primary1,
                        child: Stack(
                          fit: StackFit.expand,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          overflow: Overflow.visible,
                          children: [
                            Positioned(
                              bottom: 60,
                              left: 140,
                              child: CircleAvatar(
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/images/guy.jpg",
                                    width: 300,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                                radius: 50,
                              ),
                            ),
                            Positioned(
                                bottom: 25,
                                left: 120,
                                child: Column(children: [
                                  Text(
                                    "the name of the owner",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text("Mohamed haddad",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                      )),
                                ])),
                            Positioned(
                                bottom: 10,
                                left: 25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Year of Experience: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 160),
                                    Text("Country: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white,
                                        )),
                                  ],
                                )),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 15),
                  ),
                )),
            SingleChildScrollView(
              child: FutureBuilder(
                  future: _getimages(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? Expanded(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                ),
                                Container(
                                  height: 100,
                                  width: 500,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.all(25),
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        List resList = snapshot.data;
                                        return Card(
                                          child: Center(
                                            child: Container(
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Image.asset(
                                                    resList[index].toString(),
                                                    fit: BoxFit.cover,
                                                    width: 50,
                                                    height: 100,
                                                  )),
                                            ),
                                          ),
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          )
                        : Center(child: CircularProgressIndicator());
                  }),
            ),
            ListView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
                Container(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Column(children: <Widget>[
                            ExpandablePanel(
                                header: Text(
                                  "    Name of the Company",
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25),
                                ),
                                expanded: Align(
                                  alignment: Alignment.bottomRight,
                                  child: ListTile(
                                    title: Text(
                                      "name",
                                      softWrap: true,
                                    ),
                                    leading: Icon(Icons.person),
                                  ),
                                ),
                                collapsed: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "See more",
                                      textAlign: TextAlign.center,
                                    ))),
                            Container(
                              padding: const EdgeInsets.only(
                                left: 16,
                                bottom: 16,
                              ),
                              child: ListView(
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: [
                                  ListTile(
                                    title: Text("data 1"),
                                    leading: Icon(Icons.favorite),
                                    subtitle: Text("information 1"),
                                  ),
                                  ListTile(
                                    title: Text("data 2"),
                                    leading: Icon(Icons.library_books_rounded),
                                    subtitle: Text("information 2"),
                                  ),
                                  ListTile(
                                    title: Text("data 3"),
                                    leading: Icon(Icons.ballot_outlined),
                                    subtitle: Text("information 3"),
                                  ),
                                  ListTile(
                                    title: Text("data 4"),
                                    leading: Icon(Icons.air_outlined),
                                    subtitle: Text("information 4"),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                AhotColors.secondary3,
                                AhotColors.primary2
                              ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)),
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 10,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
                Card(
                  color: AhotColors.primary3,
                  child: Column(children: <Widget>[
                    Container(
                      child: Column(children: <Widget>[
                        ExpandablePanel(
                            header: Text(
                              "    Majors",
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 25),
                            ),
                            expanded: ListTile(
                              title: Text(
                                "major",
                                softWrap: true,
                              ),
                              leading: Icon(Icons.file_copy),
                            ),
                            collapsed: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "See more",
                                  textAlign: TextAlign.center,
                                ))),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 16,
                            bottom: 16,
                          ),
                          child: ListView(
                            physics: ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              ListTile(
                                title: Text("data 1"),
                                leading: Icon(Icons.favorite),
                                subtitle: Text("information 1"),
                              ),
                              ListTile(
                                title: Text("data 2"),
                                leading: Icon(Icons.library_books_rounded),
                                subtitle: Text("information 2"),
                              ),
                              ListTile(
                                title: Text("data 3"),
                                leading: Icon(Icons.ballot_outlined),
                                subtitle: Text("information 3"),
                              ),
                              ListTile(
                                title: Text("data 4"),
                                leading: Icon(Icons.air_outlined),
                                subtitle: Text("information 4"),
                              ),
                            ],
                          ),
                        )
                      ]),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        AhotColors.secondary3,
                        AhotColors.primary2
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                    )
                  ]),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                ),
              ],
            )
          ]),
        )
      ]),
    ]));
  }
}
