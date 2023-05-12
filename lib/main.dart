// ignore_for_file: prefer_const_constructors

import 'package:bealert/Record/Providers/distance_providers.dart';
import 'package:bealert/Record/Providers/drowsiness_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Record/Providers/pause_provider.dart';
import 'Record/Providers/time_provider.dart';
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
        primaryColor: const Color(0xFFE5E5E5),
        secondaryHeaderColor: const Color(0xFF878787),
        // scaffoldBackgroundColor: Color.fromARGB(255, 224, 224, 224),
        scaffoldBackgroundColor: const Color(0xFFF4F4F2),
        splashColor: const Color(0xFFec2f4b),
        cardColor: const Color(0xFFE5E5E5),
        canvasColor: const Color(0xFF373B44),
        focusColor: Color.fromARGB(255, 129, 129, 129),
        colorScheme: const ColorScheme.light(
            primary: Color.fromARGB(255, 0, 0, 0),
            secondary: Color.fromARGB(255, 0, 110, 179)),
        iconTheme: const IconThemeData(
          color: Color(0xFF4286f4),
        ),
      ),
    );
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>Distance()),
    ChangeNotifierProvider(create: (_)=>Time()),
    ChangeNotifierProvider(create: (_)=>Pause()),
    ChangeNotifierProvider(create: (_)=>Drowsiness()),



  ],
  child: BeAlert()));
}
