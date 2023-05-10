// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

import '../../Common_widgets/containerr.dart';
import '../../Common_widgets/scaffoldd.dart';
import '../../Common_widgets/sizedboxx.dart';
import '../../Common_widgets/textt.dart';
import '../../Const/constants.dart';
import 'package:bealert/User/Data/auth_data.dart';

class Vehicle_Info_Page extends StatefulWidget {
  String userName;
  String email;
  String password;
  String fullName;
  String address;
  int nationalID;
  String phoneNumber;
  String emergencyContact;
  String bloodGroup;

  Vehicle_Info_Page(
      {required this.userName,
      required this.email,
      required this.password,
      required this.fullName,
      required this.address,
      required this.nationalID,
      required this.phoneNumber,
      required this.emergencyContact,
      required this.bloodGroup,
      super.key});

  @override
  State<Vehicle_Info_Page> createState() => _Vehicle_Info_PageState();
}

class _Vehicle_Info_PageState extends State<Vehicle_Info_Page> {
  static GlobalKey<FormState> formKey7 = GlobalKey<FormState>();
  static GlobalKey<FormState> formKey8 = GlobalKey<FormState>();
  static GlobalKey<FormState> formKey9 = GlobalKey<FormState>();
  static GlobalKey<FormState> formKey10 = GlobalKey<FormState>();
  static GlobalKey<FormState> formKey11 = GlobalKey<FormState>();

  final TextEditingController ownername = TextEditingController();
  final TextEditingController brand = TextEditingController();
  final TextEditingController color = TextEditingController();
  final TextEditingController platenumbers = TextEditingController();
  final TextEditingController plateletters = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    final RegExp namevalid = RegExp(r'(^[a-zA-Z]+$)');

    final RegExp number = RegExp(r'^\d{1,4}$');
    return Scaffoldd(
        bcolor: Theme.of(context).colorScheme.secondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 8,
            child: Containerr(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 30.0, 35.0, 5.0),
                child: Center(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: (() => GoRouter.of(context)
                                      .go('/your_info_page')),
                                  icon: Icon(
                                    UniconsLine.angle_left,
                                  ),
                                  iconSize: 50,
                                ),
                                Textt(
                                  text: 'Vehicle Info',
                                  size: 48.0,
                                  font: GoogleFonts.righteous,
                                ),
                              ]),
                              SizedBoxx(h: 30.0),
                          //* Owner's name
                          Form(
                            key: formKey7,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: ownername,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                } else if (!namevalid.hasMatch(value) &&
                                    !RegExp(r"\s").hasMatch(value)) {
                                  return 'Name must be alphabets';
                                } else if (value.length < 3) {
                                  return 'Name must be atleast 3 characters';
                                } else {
                                  return null;
                                }
                              },
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
