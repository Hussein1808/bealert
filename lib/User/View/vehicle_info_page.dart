// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:bealert/Common_widgets/formbuttons.dart';
import 'package:bealert/Common_widgets/formfield.dart';
import 'package:bealert/Common_widgets/scaffoldd.dart';
import 'package:bealert/Common_widgets/sizedboxx.dart';
import 'package:bealert/Common_widgets/textt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bealert/Common_widgets/containerr.dart';
import 'package:unicons/unicons.dart';

import '../Data/auth_data.dart';

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
  static GlobalKey<FormState> formKey7 = new GlobalKey<FormState>();
  static GlobalKey<FormState> formKey8 = new GlobalKey<FormState>();
  static GlobalKey<FormState> formKey9 = new GlobalKey<FormState>();
  static GlobalKey<FormState> formKey10 = new GlobalKey<FormState>();
  static GlobalKey<FormState> formKey11 = new GlobalKey<FormState>();

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
            Expanded(child: SizedBox.shrink()),
            Expanded(
              flex: 8,
              child: Containerr(
                w: screenwidth,
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
                              decoration: InputDecoration(
                                errorMaxLines: 2,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: "Owner's name",
                                hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                                prefixIcon: Icon(
                                  UniconsLine.user,
                                ),
                              ),
                            ),
                          ),
                          SizedBoxx(),
                          //* Brand
                          Form(
                            key: formKey8,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: brand,
                              validator: (value2) {
                                if (value2!.isEmpty) {
                                  return 'Required';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                errorMaxLines: 2,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: "Brand",
                                hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                                prefixIcon: Icon(
                                  UniconsLine.car,
                                ),
                              ),
                            ),
                          ),
                          SizedBoxx(),
                          //* Color
                          Form(
                            key: formKey9,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: color,
                              validator: (value3) {
                                if (value3!.isEmpty) {
                                  return 'Required';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                errorMaxLines: 2,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: "Color",
                                hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                                prefixIcon: Icon(
                                  UniconsLine.palette,
                                ),
                              ),
                            ),
                          ),
                          SizedBoxx(),
                          Row(
                            children: [
                              Textt(
                                text: 'License plate',
                                size: 20.0,
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBoxx(),
                          //* Numbers
                          Form(
                            key: formKey10,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: platenumbers,
                              keyboardType: TextInputType.number,
                              validator: (value4) {
                                if (value4!.isEmpty) {
                                  return 'Required';
                                } else if (!number.hasMatch(value4)) {
                                  return 'The number must have up to 4 digits and contain only numeric digits';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                errorMaxLines: 2,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: "Numbers",
                                hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                                prefixIcon: Icon(
                                  Icons.numbers,
                                ),
                              ),
                            ),
                          ),
                          SizedBoxx(),
                          //* Letters
                          Form(
                            key: formKey11,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: plateletters,
                              validator: (value5) {
                                if (value5!.isEmpty) {
                                  return 'Required';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                errorMaxLines: 2,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: "Letters",
                                hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                                prefixIcon: Icon(
                                  UniconsLine.letter_english_a,
                                ),
                              ),
                            ),
                          ),
                          SizedBoxx(h: 32.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: screenheight * 0.07,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Theme.of(context).splashColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      onPressed: signUp,
                                      child: Textt(
                                          text: 'Finish',
                                          size: 24.0,
                                          color: Theme.of(context).primaryColor,
                                          weight: FontWeight.bold)),
                                ),
                              )
                            ],
                          ),
                          SizedBoxx(h: 46.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email,
        password: widget.password,
      );
      User updateUser = FirebaseAuth.instance.currentUser!;
      userSetup(
          widget.userName,
          widget.fullName,
          widget.address,
          widget.nationalID,
          widget.phoneNumber,
          widget.emergencyContact,
          widget.bloodGroup,
          // ownername.text,
          ownername.text.trim(),
          brand.text.trim(),
          color.text.trim(),
          plateletters.text.trim(),
          int.parse(platenumbers.text));
      // vehicleUpdate(ownername.text.trim(), brand.text.trim(), color.text.trim(),
      //     plateletters.text.trim(), int.parse(platenumbers.text));
      // var collection = FirebaseFirestore.instance.collection('Users');
      // var snapshots = await collection.get();
      // for (var doc in snapshots.docs) {
      //   await doc.reference.delete();
      // }
      GoRouter.of(context).go('/Login_page');
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
