import 'package:flutter/material.dart';
import 'ui/pages/loginpage.dart';
import 'ui/pages/homepage.dart';
import 'routes.dart';
class MyApp extends StatefulWidget {
  final isLoggedIn;

  MyApp(this.isLoggedIn);
  
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      routes: routes,
      initialRoute: widget.isLoggedIn?HomePage.routeName:LoginPage.routeName,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
