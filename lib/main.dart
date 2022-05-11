import 'package:flutter/material.dart';

import 'package:jobs/screens/profiles.dart';
import 'package:jobs/screens/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: SearchScreen(),
      routes: <String, WidgetBuilder>{
        "Profile": (BuildContext context) => ProfileScreen(),
        "SearchScreen": (BuildContext context) => SearchScreen(),
      },
    );
  }
}
