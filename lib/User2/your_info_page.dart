import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bealert/Common_widgets/containerr.dart';










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
