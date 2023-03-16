// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
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
        // primaryColor: Color(0xFFF1F1F1),
        primaryColor: Color(0xFFE5E5E5),
        secondaryHeaderColor: Color(0xFF878787),
        // scaffoldBackgroundColor: Color.fromARGB(255, 224, 224, 224),
        scaffoldBackgroundColor: Color(0xFFF4F4F2),
        splashColor: Color(0xFFec2f4b),
        cardColor: Color(0xFFE5E5E5),
        canvasColor: Color(0xFF373B44),

        colorScheme: ColorScheme.light(
            primary: Color.fromARGB(255, 0, 0, 0),
            secondary: Color(0xFF009fff)),
        iconTheme: IconThemeData(
          color: Color(0xFF4286f4),
        ),
      ),
    );
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BeAlert());
}
