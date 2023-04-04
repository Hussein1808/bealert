// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:bealert/Common_widgets/formbuttons.dart';
import 'package:bealert/Common_widgets/formfield.dart';
import 'package:bealert/Common_widgets/scaffoldd.dart';
import 'package:bealert/Common_widgets/sizedboxx.dart';
import 'package:bealert/Common_widgets/textt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bealert/Common_widgets/containerr.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:unicons/unicons.dart';

class Your_Info_Page extends StatefulWidget {
  String userName;
  String email;
  String password;

  Your_Info_Page(
      {required this.userName,
      required this.email,
      required this.password,
      super.key});

  @override
  State<Your_Info_Page> createState() => _Your_Info_PageState(
        userName: userName,
        email: email,
        password: password,
      );
}

class _Your_Info_PageState extends State<Your_Info_Page> {
  String userName;
  String email;
  String password;
  _Your_Info_PageState({
    required this.userName,
    required this.email,
    required this.password,
  });

  bool _isVisible = false;
  bool _isVisible2 = false;
  final RegExp namevalid = RegExp(r'(^[a-zA-Z]+$)');
  final RegExp emailvalid = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  final RegExp passwordvalid =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  final bloodGroupRegex = RegExp(r'^(A|B|AB|O)[+-]$');
  final RegExp nationalIdRegex = RegExp(r'^[0-9]{1,}$');

  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();

  final TextEditingController fullNamecontrolller = TextEditingController();
  final TextEditingController addresscontrolller = TextEditingController();
  final TextEditingController nationalIDcontrolller = TextEditingController();
  final TextEditingController phoneNumbercontrolller = TextEditingController();
  final TextEditingController emergencyContactcontrolller = TextEditingController();
  final TextEditingController bloodGroupcontrolller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
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
                  padding: const EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 5.0),
                  child: Center(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: (() =>
                                      GoRouter.of(context).go('/signup_page')),
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
                          SizedBoxx(
                            h: 30.0,
                          ),
                          //* full name field
                          Form(
                            key: formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: fullNamecontrolller,
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
                                hintText: "Full Name",
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
                          //* Address field
                          Form(
                            key: formKey2,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: addresscontrolller,
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
                                hintText: "Address",
                                hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                                prefixIcon: Icon(
                                  UniconsLine.location_point,
                                ),
                              ),
                            ),
                          ),
                          SizedBoxx(),
                          //* National ID field
                          Form(
                            key: formKey3,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: nationalIDcontrolller,
                              obscureText: !_isVisible,
                              validator: (value3) {
                                if (value3!.isEmpty) {
                                  return 'Required';
                                } else if (!nationalIdRegex.hasMatch(value3)) {
                                  return 'Invalid National ID format';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                errorMaxLines: 2,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: "National ID",
                                hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                                prefixIcon: Icon(
                                  UniconsLine.credit_card,
                                ),
                              ),
                            ),
                          ),
                          SizedBoxx(),
                          //* Mobile number
                          Form(
                            key: formKey4,
                            child: InternationalPhoneNumberInput(
                              textFieldController: phoneNumbercontrolller,
                              onInputChanged: (PhoneNumber number) {},
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value4) {
                                if (value4!.isEmpty) {
                                  return 'Required';
                                } else {
                                  return null;
                                }
                              },
                              selectorConfig: SelectorConfig(
                                selectorType:
                                    PhoneInputSelectorType.BOTTOM_SHEET,
                              ),
                              selectorTextStyle: TextStyle(color: Colors.black),
                              ignoreBlank: false,
                              formatInput: true,
                              keyboardType: TextInputType.number,
                              inputBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBoxx(),
                          //* Emergency contact
                          Form(
                            key: formKey5,
                            child: InternationalPhoneNumberInput(
                              textFieldController: emergencyContactcontrolller,
                              onInputChanged: (PhoneNumber number) {},
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value5) {
                                if (value5!.isEmpty) {
                                  return 'Required';
                                } else {
                                  return null;
                                }
                              },
                              onInputValidated: (bool value) {},
                              selectorConfig: SelectorConfig(
                                selectorType:
                                    PhoneInputSelectorType.BOTTOM_SHEET,
                              ),
                              hintText: 'Emergency Contact',
                              selectorTextStyle: TextStyle(color: Colors.black),
                              ignoreBlank: false,
                              formatInput: true,
                              keyboardType: TextInputType.numberWithOptions(
                                  signed: true, decimal: true),
                              inputBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBoxx(),
                          //* Blood group
                          Form(
                            key: formKey6,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: bloodGroupcontrolller,
                              obscureText: !_isVisible2,
                              validator: (value6) {
                                if (!bloodGroupRegex.hasMatch('$value6')) {
                                  return 'Invalid blood group format';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                errorMaxLines: 2,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: "Blood Group",
                                hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                                prefixIcon: Icon(
                                  UniconsLine.medical_drip,
                                ),
                              ),
                            ),
                          ),
                          SizedBoxx(h: 30.0),
                          //* Sign up button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 180,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).splashColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Textt(
                                        text: 'Auto fill',
                                        size: 24.0,
                                        color: Theme.of(context).primaryColor,
                                        weight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 60.0,
                                width: 90,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).splashColor,
                                      shape: CircleBorder(),
                                    ),
                                    onPressed: () {
                                      // if (formKey.currentState!.validate() &&
                                      //     formKey2.currentState!.validate() &&
                                      //     formKey3.currentState!.validate() &&
                                      //     formKey4.currentState!.validate() &&
                                      //     formKey5.currentState!.validate() &&
                                      //     formKey6.currentState!.validate()) {
                                      GoRouter.of(context).pushNamed(
                                          'vehicle_info_page',
                                          params: {
                                            'username': userName,
                                            'password': password, 
                                            'email': email ,
                                            'fullName': fullNamecontrolller.text.trim() ,
                                            'address': addresscontrolller.text.trim(), 
                                            'nationalID': nationalIDcontrolller.text.trim(),
                                            'phoneNumber': phoneNumbercontrolller.text.trim(),
                                            'emergencyContact':
                                                emergencyContactcontrolller.text.trim() ,
                                            'bloodGroup': bloodGroupcontrolller.text.trim(),
                                          });
                                      // }
                                    },
                                    child: Icon(
                                      UniconsLine.arrow_right,
                                      size: 42.0,
                                    )),
                              )
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
}
