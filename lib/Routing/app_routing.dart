import 'package:bealert/Record/View/warning.dart';
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
      builder: (BuildContext context, GoRouterState state) => const Auth(),
      routes: <GoRoute>[
        GoRoute(
          path: 'info_screen',
          builder: (BuildContext context, GoRouterState state) => Info(),
        ),
        GoRoute(
          path: 'start_screen',
          builder: (BuildContext context, GoRouterState state) => const Start(),
        ),
        GoRoute(
          path: 'signup_page',
          builder: (BuildContext context, GoRouterState state) =>
              const SignUp_Page(),
        ),
        GoRoute(
          path: 'login_page',
          builder: (BuildContext context, GoRouterState state) =>
              const Login_Page(),
        ),
        GoRoute(
          name: "your_info_page",
          path: 'your_info_page/:username/:email/:password',
          builder: (BuildContext context, GoRouterState state) =>
              Your_Info_Page(
                  userName: state.params["username"]!,
                  email: state.params["email"]!,
                  password: state.params["password"]!),
        ),
        GoRoute(
          name: 'vehicle_info_page',
          path:
              'vehicle_info_page/:username/:email/:password/:fullName/:address/:nationalID/:phoneNumber/:emergencyContact/:bloodGroup',
          builder: (BuildContext context, GoRouterState state) =>
              Vehicle_Info_Page(
            userName: state.params["username"]!,
            email: state.params["email"]!,
            password: state.params["password"]!,
            fullName: state.params["fullName"]!,
            address: state.params["address"]!,
            nationalID: int.parse(state.params["nationalID"]!),
            phoneNumber: state.params["phoneNumber"]!,
            emergencyContact: state.params["emergencyContact"]!,
            bloodGroup: state.params["bloodGroup"]!,
          ),
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
              const MainEditProfile(),
        ),
        GoRoute(
          name: "tripsdetails",
          path: 'tripsdetails/:title/:trailing/:tripdistance',
          builder: (BuildContext context, GoRouterState state) => TripDetails(
              title: state.params["title"]!,
              trailing: int.parse(state.params["trailing"]!),
              tripdistance: double.parse(state.params["tripdistance"]!)),
        ),
        GoRoute(
          path: 'warning',
          builder: (BuildContext context, GoRouterState state) => ColorScreen(),
        ),
      ],
    ),
  ],
);
