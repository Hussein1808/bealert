

import 'package:flutter/material.dart';


class FormFieldd extends StatefulWidget {
  final hint;
  final icon;
  final color;
  final sicon;
  final scolor;
  final obsecured;

  const FormFieldd(
      {super.key,
      required this.hint,
      this.icon,
      this.color = Colors.black,
      this.sicon,
      this.scolor,
      this.obsecured = false});

  @override
  State<FormFieldd> createState() => _FormFielddState();
}

class _FormFielddState extends State<FormFieldd> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      // key: formKey,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          //-Validation for email
          // validator: (value) {
          //   if (value != null && value.length < 7) {
          //     return 'Enter minmum 7 characters';
          //   } else {
          //     return null;
          //   }
          // },
          obscureText: widget.obsecured,
          style:const  TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              widget.icon,
              color: widget.color,
            ),
            border: InputBorder.none,
            hintText: widget.hint,
            suffixIcon: Icon(
              widget.sicon,
              color: widget.scolor,
            ),
          ),
        ),
      ),
    );
  }
}
