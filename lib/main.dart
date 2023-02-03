// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'Routing/app_routing.dart';

class BeAlert extends StatelessWidget {
  //* Application routing

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Todo list',
      // builder: ,
      // home: TodoList(),
      // builder: (context, widget) => SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //* Application colors
        primaryColor: Color(0xFFF1F1F1),
        // primaryColor: Color.fromARGB(255, 224, 224, 224),

        scaffoldBackgroundColor: Color.fromARGB(255, 224, 224, 224),
        // scaffoldBackgroundColor: Color(0xFFF1F1F1),

        splashColor: Color(0xFFF3A953),
        colorScheme: ColorScheme.light(
            primary: Color.fromARGB(255, 0, 0, 0),
            secondary: Color(0xFF007CD7)),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}

void main() {
  runApp(BeAlert());
}
