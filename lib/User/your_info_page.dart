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

class Your_Info_Page extends StatefulWidget {
  const Your_Info_Page({super.key});

  @override
  State<Your_Info_Page> createState() => _Your_Info_PageState();
}

class _Your_Info_PageState extends State<Your_Info_Page> {
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
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  IconButton(
                    onPressed: (() => GoRouter.of(context).go('/signup_page')),
                    icon: Icon(
                      UniconsLine.angle_left,
                    ),
                    iconSize: 50,
                  ),
                  Textt(
                    text: 'Your Info',
                    size: 48.0,
                    font: GoogleFonts.righteous,
                  ),
                ]),
                SizedBoxx(h: 40.0),
                FormFieldd(hint: 'Full name', icon: UniconsLine.user),
                SizedBoxx(),
                FormFieldd(hint: 'Address', icon: UniconsLine.envelope),
                SizedBoxx(),
                FormFieldd(
                  hint: 'National ID',
                  icon: UniconsLine.credit_card,
                ),
                SizedBoxx(),
                FormFieldd(
                  hint: 'Mobile number',
                  icon: UniconsLine.phone,
                ),
                SizedBoxx(h: 32.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FormButtons(
                      bcolor: Theme.of(context).splashColor,
                      tcolor: Theme.of(context).primaryColor,
                      text: 'Next',
                      redirect: '/vehicle_info_page',
                      border: Border.all(
                          width: 6.0, color: Theme.of(context).splashColor),
                      icon: UniconsLine.angle_right_b,
                      icolor: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ],
                ),
                SizedBoxx(h: 146.0),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
