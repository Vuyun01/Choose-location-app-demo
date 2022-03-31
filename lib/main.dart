
import 'package:flutter/material.dart';
import 'package:basic_project_1/pages/initLocation.dart';
import 'package:basic_project_1/pages/location.dart';
import 'package:basic_project_1/pages/favorite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => InitLocations(),
        '/location' : (context) => Locations(),
        '/favorite' : (context) => Favorite(),
      },
    );
  }
}