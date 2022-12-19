import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Home.dart';
import 'package:weather/my_provider.dart';
import 'package:weather/setting.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context){

        return MyProviderApp();
      },
      child:MyApp()));
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.routName,
      routes: {
        Home.routName:(n)=>Home(),
        Setting.routName:(v)=>Setting(),
      },
    );
  }
}


