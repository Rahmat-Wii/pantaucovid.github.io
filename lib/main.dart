import 'package:flutter/material.dart';
import 'package:hello/provider/corona_pro.dart';
import 'package:hello/uy.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //PROVIDER DIGUNAKAN UNTUK MANAJEMEN STATE, PEMBAHASAN LEBIH LENGKAP ADA DI ARTIKEL BERBEDA
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CoronaProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Halamannav(),
        title: 'Pantau Covid-19',
      ),
    );
  }
}
