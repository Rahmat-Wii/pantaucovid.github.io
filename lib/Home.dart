import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:hello/model.dart';
import 'package:hello/provider/corona_pro.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final formatCurrency = new NumberFormat("#,###");

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final List<String> banner = [
    'banner1.jpg',
    'banner2.jpg',
    'banner3.jpg'
  ];
  final data;

  _MyHomePageState({this.data});

  final CarouselSlider autoPlayImage = CarouselSlider(
    items: banner.map((fileImage) {
      return Container(
        margin: EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            'images/slider/${fileImage}',
            width: 10000,
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList(),
    height: 150,
    autoPlay: true,
    enlargeCenterPage: true,
    aspectRatio: 3.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
              child: Image.asset(
            'images/slider/banner.jpg',
            width: 10000,
            fit: BoxFit.cover,
          )),
          Stack(
            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(left: 10.0),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Image.asset(
//                      'images/slider/download.png',
//                      width: 100,
//                    ),
//
//                  ],
//                ),
//              ),
            ],
          ),
          ListView(
            children: <Widget>[
              SizedBox(height: 162.0),
              Padding(
                padding: EdgeInsets.only(left: 40.0),
              ),
              SizedBox(height: 6.0),
              Container(
                height: MediaQuery.of(context).size.height - 15.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(75.0)),
                ),
                child: ListView(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 35, left: 20),
                        child: Text(
                          "Yuk Bantu Cegah Corona Dengan Cara:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Container(
                      child: autoPlayImage,
                      margin: EdgeInsets.only(left: 25.0, right: 20.0),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        "Kasus Positif Hari Ini:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    RefreshIndicator(
                      onRefresh: () =>
                          Provider.of<CoronaProvider>(context, listen: false)
                              .getData(),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: FutureBuilder(
                          future: Provider.of<CoronaProvider>(context,
                                  listen: false)
                              .getData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Consumer<CoronaProvider>(
                              builder: (context, data, _) {
                                return Column(
                                  children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              100.0,
                                      child: ListView(
                                        children: [
                                          SummaryCard(
                                              total: formatCurrency.format(data.summary.confirmed),
                                              label: "Positif",
                                              gambar: Image.asset(
                                                "icon/sick.webp",
                                                width: 75,
                                                height: 75,
                                              ),
                                              color: null,
                                              size: null),
                                          SummaryCard(
                                              total: formatCurrency.format(data.summary.recovered),
                                              label: "Sembuh",
                                              gambar: Image.asset(
                                                "icon/health.png",
                                                width: 75,
                                                height: 75,
                                              ),
                                              color: null,
                                              size: null),
                                          SummaryCard(
                                              total: formatCurrency.format(data.summary.deaths),
                                              label: "Meninggal",
                                              gambar: Image.asset(
                                                "icon/dead.png",
                                                width: 75,
                                                height: 75,
                                              ),
                                              color: null,
                                              size: null),

                                        ],
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//
//Expanded
//(
//child: autoPlayImage,)
//,
//children: [
//Container
//(

//
