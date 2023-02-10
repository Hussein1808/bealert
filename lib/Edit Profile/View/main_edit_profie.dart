// ignore_for_file: prefer_const_literals_to_create_immutables,prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'bottom_edit_profilr.dart';
import 'mid_edit_profile.dart';
import 'top_edit_profile.dart';

class MainEditProfile extends StatefulWidget {
  const MainEditProfile({super.key});

  @override
  State<MainEditProfile> createState() => _MainEditProfileState();
}

class _MainEditProfileState extends State<MainEditProfile> {
  // final DateFormat _dateFormatter = DateFormat.MMMEd();
  // late var months = DateFormat.M().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    //* Screen size
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(
            'Edit Profile',
            style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: screenwidth * 0.05),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            onPressed: () {
              GoRouter.of(context).go('/home/4');
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.check,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: TopEditProfile()),
            // Expanded(flex:1, child: MidEditProfile()),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: BottomEditProfile(),
                ))
          ],
        ),
      ),
    );
  }
}
