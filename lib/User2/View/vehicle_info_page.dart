// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
    static GlobalKey<FormState> formKey7 =  GlobalKey<FormState>();
  static GlobalKey<FormState> formKey8 =  GlobalKey<FormState>();
  static GlobalKey<FormState> formKey9 =  GlobalKey<FormState>();
  static GlobalKey<FormState> formKey10 =  GlobalKey<FormState>();
  static GlobalKey<FormState> formKey11 =  GlobalKey<FormState>();

  final TextEditingController ownername = TextEditingController();
  final TextEditingController brand = TextEditingController();
  final TextEditingController color = TextEditingController();
  final TextEditingController platenumbers = TextEditingController();
  final TextEditingController plateletters = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
