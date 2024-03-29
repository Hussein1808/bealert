// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:bealert/Common_widgets/scaffoldd.dart';
import 'package:bealert/Common_widgets/sizedboxx.dart';
import 'package:bealert/Common_widgets/textt.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bealert/Common_widgets/containerr.dart';
import 'package:unicons/unicons.dart';

class SignUp_Page extends StatefulWidget {
  const SignUp_Page({super.key});

  @override
  State<SignUp_Page> createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  bool _isVisible = false;
  final bool _isVisible2 = false;
  final RegExp namevalid = RegExp(r'(^[a-zA-Z]+$)');
  final RegExp emailvalid = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  final RegExp passwordvalid =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final TextEditingController pw = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffoldd(
        bcolor: Theme.of(context).colorScheme.secondary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(child: SizedBox.shrink()),
            Flexible(
              flex: 10,
              child: Containerr(
                h: screenheight * 0.85,
                w: screenwidth,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 5.0),
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          //* Sign up text
                          Textt(
                            text: 'Sign up',
                            size: screenwidth * 0.1,
                            font: GoogleFonts.righteous,
                          ),
                          const SizedBoxx(h: 40.0),
                          //* Name field
                          Form(
                            key: formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: _usernamecontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                } else if (!namevalid.hasMatch(value) &&
                                    !RegExp(r"\s").hasMatch(value)) {
                                  return 'Userame must be alphabets';
                                } else if (value.length < 3) {
                                  return 'Username must be atleast 3 characters';
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                  decoration: TextDecoration.none),
                              decoration: dec(context,
                                  hint: "Username", icon: UniconsLine.user),
                            ),
                          ),
                          const SizedBoxx(),
                          //* Email field
                          Form(
                            key: formKey2,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: _emailcontroller,
                              validator: (value2) {
                                if (value2!.isEmpty) {
                                  return 'Required';
                                } else if (!emailvalid.hasMatch(value2)) {
                                  return 'Invalid email format';
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                  decoration: TextDecoration.none),
                              decoration: dec(context,
                                  hint: "Email", icon: UniconsLine.envelope),
                            ),
                          ),
                          SizedBoxx(),
                          //* Password field
                          Form(
                            key: formKey3,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: pw,
                              obscureText: !_isVisible,
                              validator: (value3) {
                                if (value3!.isEmpty) {
                                  return 'Required';
                                } else if (!passwordvalid.hasMatch(value3)) {
                                  return 'Password must contain atleast 1 uppercase, 1 lowercase, 1 number and 1 special character';
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                  decoration: TextDecoration.none),
                              decoration: dec(
                                context,
                                hint: "Password",
                                icon: UniconsLine.lock_alt,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isVisible = !_isVisible;
                                    });
                                  },
                                  icon: _isVisible
                                      ? const Icon(
                                          Icons.visibility,
                                          color: Colors.black,
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          SizedBoxx(),
                          //* Confirm Password field
                          Form(
                            key: formKey4,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              obscureText: !_isVisible2,
                              validator: (value4) {
                                if (value4 != pw.text) {
                                  return 'Password does not match';
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                  decoration: TextDecoration.none),
                              decoration: dec(
                                context,
                                hint: "Password",
                                icon: UniconsLine.lock_alt,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isVisible = !_isVisible;
                                    });
                                  },
                                  icon: _isVisible
                                      ? const Icon(
                                          Icons.visibility,
                                          color: Colors.black,
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBoxx(h: 30.0),
                          //* Sign up button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // SizedBox(
                              //   height: 60,
                              //   width: 180,
                              //   child: ElevatedButton(
                              //       style: ElevatedButton.styleFrom(
                              //         backgroundColor:
                              //             Theme.of(context).splashColor,
                              //         shape: RoundedRectangleBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(30.0),
                              //         ),
                              //       ),
                              //       onPressed: () {},
                              //       child: Textt(
                              //           text: 'Auto fill',
                              //           size: 24.0,
                              //           color: Theme.of(context).primaryColor,
                              //           weight: FontWeight.bold)),
                              // ),
                              SizedBox(
                                height: 60.0,
                                width: 90,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).splashColor,
                                      shape: CircleBorder(),
                                    ),
                                    onPressed:
                                        // signUp,
                                        () {
                                      if (formKey.currentState!.validate() &&
                                          formKey2.currentState!.validate() &&
                                          formKey3.currentState!.validate() &&
                                          formKey4.currentState!.validate()) {
                                        GoRouter.of(context).pushNamed(
                                            'your_info_page',
                                            params: {
                                              'username': _usernamecontroller
                                                  .text
                                                  .trim(),
                                              'email':
                                                  _emailcontroller.text.trim(),
                                              'password': pw.text.trim(),
                                            });
                                      }
                                    },
                                    child: const Center(
                                      child: Icon(
                                        UniconsLine.arrow_right,
                                        size: 42.0,
                                      ),
                                    )),
                              )
                            ],
                          ),
                          SizedBoxx(h: 30.0),
                          //* Already have an account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Textt(
                                text: "Already have an account ?",
                                color: Theme.of(context).colorScheme.primary,
                                size: screenwidth * 0.04,
                              )
                            ],
                          ),
                          const SizedBoxx(h: 8.0),
                          //* login button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    GoRouter.of(context).go('/login_page');
                                  },
                                  child: Textt(
                                    text: 'Login from here',
                                    color: Theme.of(context).splashColor,
                                    size: screenwidth * 0.04,
                                    weight: FontWeight.bold,
                                  ))
                            ],
                          ),
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

  InputDecoration dec(BuildContext context,
      {String? hint, IconData? icon, Widget? suffixIcon}) {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.all(12),

      errorMaxLines: 4,
      border: InputBorder.none,
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(
          color: Theme.of(context).focusColor,
          width: 3.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(
          color: Theme.of(context).focusColor,
          width: 3.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(
          color: Colors.black,
          width: 3.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(
          color: Colors.red,
          width: 3.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(
          color: Colors.red,
          width: 3.0,
        ),
      ),
      errorStyle: TextStyle(
          color: Colors.red, fontSize: 14.0, fontWeight: FontWeight.bold),
      hintText: "$hint",
      hintStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).focusColor,
      ),
      prefixIcon: Icon(icon),
      suffixIcon: suffixIcon,
      // IconButton(
      //   onPressed: () {
      //     setState(() {
      //       _isVisible = !_isVisible;
      //     });
      //   },
      //   icon: _isVisible
      //       ? const Icon(
      //           Icons.visibility,
      //           color: Colors.black,
      //         )
      //       : const Icon(
      //           Icons.visibility_off,
      //           color: Colors.grey,
      //         ),
      // ),
    );
  }

  // Future signUp() async {
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: _emailcontroller.text.trim(),
  //       password: pw.text.trim(),
  //     );
  //     User updateUser = FirebaseAuth.instance.currentUser!;
  //     userSetup(_usernamecontroller.text.trim());
  //     GoRouter.of(context).go('/your_info_page');
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //   }
  // }
}
