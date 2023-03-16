import 'package:bealert/History/View/main_history.dart';
import 'package:bealert/Trips_details/View/trips_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Edit Profile/View/main_edit_profie.dart';
import '../User/View/login_page.dart';
import '../User/View/signup_page.dart';
import '../User/View/vehicle_info_page.dart';
import '../User/View/your_info_page.dart';
import '../auth.dart';
import '../info.dart';
import '../pages.dart';
import '../start_screen.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => Auth(),
      routes: <GoRoute>[
        GoRoute(
          path: 'info_screen',
          builder: (BuildContext context, GoRouterState state) => Info(),
        ),
        GoRoute(
          path: 'start_screen',
          builder: (BuildContext context, GoRouterState state) => Start(),
        ),
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
        GoRoute(
          path: 'home/:selectedIndex',
          name: 'home',
          builder: (context, state) => HomePage(
            selectedIndex: int.parse(state.params["selectedIndex"]!),
          ),
        ),
        GoRoute(
          path: 'editprofile_page',
          builder: (BuildContext context, GoRouterState state) =>
              MainEditProfile(),
        ),
        GoRoute(
          name: "tripsdetails",
          path: 'tripsdetails/:title/:trailing/:tripdistance',
          builder: (BuildContext context, GoRouterState state) => TripDetails(
              title: state.params["title"]!,
              trailing: int.parse(state.params["trailing"]!),
              tripdistance: int.parse(state.params["tripdistance"]!)),
        ),
      ],
    ),
  ],
);
