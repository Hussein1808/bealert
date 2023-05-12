// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bealert/Common_widgets/scaffoldd.dart';
import 'package:bealert/Common_widgets/sizedboxx.dart';
import 'package:bealert/Common_widgets/textt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bealert/Common_widgets/containerr.dart';
import 'package:unicons/unicons.dart';

import '../../Const/constants.dart';
import '../Data/auth_data.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  bool _isVisible = false;
  final RegExp emailvalid = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  final RegExp passwordvalid =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

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
            Expanded(
              flex: 8,
              child: Containerr(
                w: screenwidth,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 5.0),
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          //* Login text
                          const Textt(
                            text: 'LOGIN',
                            size: 48.0,
                            font: GoogleFonts.righteous,
                          ),
                          const SizedBoxx(h: 58.0),
                          //* Email field
                          Form(
                            key: formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              focusNode: _focusNode,
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
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).focusColor,
                                ),
                                prefixIcon: Icon(UniconsLine.envelope,
                                    color: _isFocused
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context).focusColor),
                              ),
                            ),
                          ),
                          const SizedBoxx(),
                          //* Password field
                          Form(
                            key: formKey2,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: _passwordcontroller,
                              obscureText: !_isVisible,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                } else if (!passwordvalid.hasMatch(value)) {
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
                                hintText: "Password",
                                hintStyle: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                                prefixIcon: const Icon(
                                  UniconsLine.lock,
                                ),
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
                          const SizedBoxx(h: 120.0),
                          //* Login button
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
                                      onPressed: signIn,

                                      // () async {
                                      //   if (formKey.currentState!.validate() &&
                                      //       formKey2.currentState!.validate()) {
                                      //     signIn();
                                      //     // StreamBuilder<User?>(
                                      //     //     stream: FirebaseAuth.instance
                                      //     //         .authStateChanges(),
                                      //     //     builder: (context, snapshot) {
                                      //     //       if (snapshot.hasData) {
                                      //     //         return SignUp_Page();
                                      //     //       } else {
                                      //     //         return SignUp_Page();
                                      //     //       }
                                      //     //     });
                                      //   }
                                      // },
                                      child: Textt(
                                          text: 'Login',
                                          size: 24.0,
                                          color: Theme.of(context).primaryColor,
                                          weight: FontWeight.bold)),
                                ),
                              )
                            ],
                          ),
                          const SizedBoxx(h: 80.0),
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
                          const SizedBoxx(h: 16.0),
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
                                    size: 22.0,
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

  Future signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailcontroller.text.trim(),
              password: _passwordcontroller.text.trim())
          .then((value) async => getUser(value.user!.uid).then((value) {
                currUser = value;
                // print(value.name);
              }));

      FocusScope.of(context).unfocus();
      GoRouter.of(context).go('/home/0');
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
        errorDialog(context, message);
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
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
