import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String total;
  final String label;
  final Color color;
  final int size;
  final Image gambar;

  //HANDLE DATA YANG DIKIRIMKAN
  SummaryCard({
    @required this.total,
    @required this.label,
    @required this.color,
    @required this.size,
    @required this.gambar
  });

  @override
  Widget build(BuildContext context) {

      return Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: InkWell(
              onTap: () {
                // ignore: missing_return
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {}));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Row(children: [
                        Hero(
                            tag: "in",
                            child: gambar),
                        SizedBox(width: 10.0),
                        Column(
                          children: <Widget>[

                          ],
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Text(label,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold)),
                              Text(total,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 19.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
//
//
                            ])
                      ])),
                ],
              )));
    }
  }




