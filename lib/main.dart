// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'Pages/start_screen.dart';


class BeAlert extends StatelessWidget {
  //* Application routing
  final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => Start(),
        routes: <GoRoute>[
          // GoRoute(
          //   path: 'addtask',
          //   builder: (BuildContext context, GoRouterState state) => AddTask(),
          // ),
          
          // GoRoute(
          //     path: 'home/:selectedIndex',
          //   name: 'home',
          //   builder: (context, state) => HomePage(
          //       selectedIndex: int.parse(state.params["selectedIndex"]!),

          // ),
          // ),
        ],
      ),
    ],
  );
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
        primaryColor: Color.fromARGB(255, 255, 255, 255),
        scaffoldBackgroundColor: Color.fromARGB(255, 243, 243, 243),
        colorScheme: ColorScheme.light(
            primary: Color.fromARGB(255, 0, 0, 0),
            secondary: Color.fromARGB(255, 71, 181, 255)),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}

void main() {
  runApp(BeAlert());}

