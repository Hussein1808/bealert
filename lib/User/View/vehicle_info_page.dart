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
                                  onPressed: (() => GoRouter.of(context).pushNamed(
                                            'your_info_page',
                                            params: {
                                              'username': widget.userName,
                                              'email':
                                                  widget.email,
                                              'password': widget.password,
                                            })),
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
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                  decoration: TextDecoration.none),
                              decoration: InputDecoration(
                                errorMaxLines: 2,
                                border: InputBorder.none,
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).focusColor,
                                    width: 3.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).focusColor,
                                    width: 3.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 3.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 3.0,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 3.0,
                                  ),
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                                hintText: "Owner's name",
                                hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).focusColor,
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
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                  decoration: TextDecoration.none),
                              decoration: InputDecoration(
                                errorMaxLines: 2,
                                border: InputBorder.none,
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).focusColor,
                                    width: 3.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).focusColor,
                                    width: 3.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 3.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 3.0,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 3.0,
                                  ),
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                                hintText: "Brand",
                                hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).focusColor,
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
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                  decoration: TextDecoration.none),
                              decoration: InputDecoration(
                                errorMaxLines: 2,
                                border: InputBorder.none,
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).focusColor,
                                    width: 3.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).focusColor,
                                    width: 3.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 3.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 3.0,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 3.0,
                                  ),
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                                hintText: "Color",
                                hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).focusColor,
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
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                  decoration: TextDecoration.none),
                              decoration: InputDecoration(
                                errorMaxLines: 2,
                                border: InputBorder.none,
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).focusColor,
                                    width: 3.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).focusColor,
                                    width: 3.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 3.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 3.0,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 3.0,
                                  ),
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                                hintText: "Numbers",
                                hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).focusColor,
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
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                  decoration: TextDecoration.none),
                              decoration: InputDecoration(
                                errorMaxLines: 2,
                                border: InputBorder.none,
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).focusColor,
                                    width: 3.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).focusColor,
                                    width: 3.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 3.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 3.0,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 3.0,
                                  ),
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                                hintText: "Letters",
                                hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).focusColor,
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

  Future<String?> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email,
        password: widget.password,
      );
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
          // .then((value) async => getUser(value).then((value) {
          //       currUser = value;
          //     }));
      // vehicleUpdate(ownername.text.trim(), brand.text.trim(), color.text.trim(),
      //     plateletters.text.trim(), int.parse(platenumbers.text));
      // var collection = FirebaseFirestore.instance.collection('Users');
      // var snapshots = await collection.get();
      // for (var doc in snapshots.docs) {
      //   await doc.reference.delete();
      // }

      GoRouter.of(context).go('/Login_page');
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
        errorDialog(context, message);
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
        errorDialog(context, message);
      } else {}
    } catch (e) {
      return e.toString();
    }
  }

  void errorDialog(BuildContext context, String error) => showDialog(
      context: context,
      // context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(error),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
