// ignore_for_file: prefer_const_constructors
import 'package:bealert/Common_widgets/scaffoldd.dart';
import 'package:bealert/Common_widgets/sizedboxx.dart';
import 'package:bealert/Common_widgets/textt.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bealert/Common_widgets/containerr.dart';

class FormFieldd extends StatelessWidget {
  final hint;
  final icon;
  final color;
  final sicon;
  final scolor;

  const FormFieldd(
      {super.key, required this.hint, this.icon, this.color = Colors.black, this.sicon, this.scolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        //-Validation for email
        validator: (value) {
          if (value != null && value.length < 7) {
            return 'Enter minmum 7 characters';
          } else {
            return null;
          }
        },
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: color,
          ),
          border: InputBorder.none,
          hintText: hint,
          suffixIcon: Icon(
            sicon,
            color: scolor,
          ),
        ),
      ),
    );
  }
}
