import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../User/View/login_page.dart';
import '../User/View/signup_page.dart';
import '../User/View/vehicle_info_page.dart';
import '../User/View/your_info_page.dart';
import '../start_screen.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => Start(),
      routes: <GoRoute>[
        GoRoute(
          path: 'signup_page',
          builder: (BuildContext context, GoRouterState state) => SignUp_Page(),
        ),
        GoRoute(
          path: 'login_page',
          builder: (BuildContext context, GoRouterState state) => Login_Page(),
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
