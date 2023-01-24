// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:bealert/Common_widgets/formbuttons.dart';
import 'package:bealert/Common_widgets/formfield.dart';
import 'package:bealert/Common_widgets/scaffoldd.dart';
import 'package:bealert/Common_widgets/sizedboxx.dart';
import 'package:bealert/Common_widgets/textt.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bealert/Common_widgets/containerr.dart';
import 'package:unicons/unicons.dart';

class Login_Page extends StatelessWidget {
  const Login_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffoldd(
        body: Containerr(
      margin: EdgeInsets.only(top: 100.0),
      w: MediaQuery.of(context).size.width,
      h: 727.0,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 5.0),
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                //* Login text
                Textt(
                  text: 'LOGIN',
                  size: 48.0,
                  font: GoogleFonts.righteous,
                ),
                SizedBoxx(h: 90.0),
                //* Email field
                FormFieldd(hint: 'Email', icon: UniconsLine.envelope),
                SizedBoxx(),
                //* Password field
                FormFieldd(
                  hint: 'Password',
                  icon: UniconsLine.lock,
                  sicon: UniconsLine.eye,
                  obsecured: true,
                ),
                SizedBoxx(h: 120.0),
                //* Login button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FormButtons(
                      width: 320.0,
                      bcolor: Theme.of(context).splashColor,
                      tcolor: Theme.of(context).primaryColor,
                      text: '    Login',
                      redirect: '/home',
                      border: Border.all(
                          width: 6.0, color: Theme.of(context).splashColor),
                    ),
                  ],
                ),
                SizedBoxx(h: 80.0),
                //* Don't have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Textt(
                      text: "Don't have an account ?",
                      color: Theme.of(context).colorScheme.primary,
                      size: 20.0,
                    )
                  ],
                ),
                SizedBoxx(h: 16.0),
                //* Sign up button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          GoRouter.of(context).go('/signup_page');
                        },
                        child: Textt(
                          text: 'Sign up from here',
                          color: Theme.of(context).splashColor,
                          size: 20.0,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
