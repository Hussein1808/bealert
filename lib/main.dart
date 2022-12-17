// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'Pages/Login_page.dart';
import 'Pages/signup_page.dart';
import 'Pages/start_screen.dart';
import 'Pages/vehicle_info_page.dart';
import 'Pages/your_info_page.dart';

class BeAlert extends StatelessWidget {
  //* Application routing
  final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => Start(),
        routes: <GoRoute>[
          GoRoute(
            path: 'signup_page',
            builder: (BuildContext context, GoRouterState state) =>
                SignUp_Page(),
          ),
          GoRoute(
            path: 'login_page',
            builder: (BuildContext context, GoRouterState state) =>
                Login_Page(),
          ),
          GoRoute(
            path: 'your_info_page',
            builder: (BuildContext context, GoRouterState state) =>
                Your_Info_Page(),
          ),
          GoRoute(
            path: 'vehicle_info_page',
            builder: (BuildContext context, GoRouterState state) =>
                Vehicle_Info_Page(),
          ),

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
        primaryColor: Color.fromARGB(255, 224, 224, 224),
        scaffoldBackgroundColor: Color(0xFFF1F1F1),
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
