import 'package:flutter/material.dart';
import 'package:sct/list/list.dart';
import 'package:sct/setting/colors.dart';

class badriya2 extends StatefulWidget {
  @override
  State<badriya2> createState() => _badriya2State();
}

class _badriya2State extends State<badriya2> {
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
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AhotColors.secondary3, AhotColors.primary2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            height: 200,
          ),
        ),
        body: FutureBuilder(
            future: _getimages(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? GridView.builder(
                      padding: const EdgeInsets.all(50),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        List reslist = snapshot.data;
                        return Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: Card(
                                child: Center(
                                  child: Container(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          reslist[index].toString(),
                                          fit: BoxFit.cover,
                                          width: 500,
                                          height: 500,
                                        )),
                                  ),
                                ),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            )
                          ],
                        );
                      })
                  : Center(child: CircularProgressIndicator());
            }));
  }
}
