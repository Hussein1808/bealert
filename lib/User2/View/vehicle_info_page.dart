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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
