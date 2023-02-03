// ignore_for_file: prefer_const_constructors
import 'package:bealert/Common_widgets/scaffoldd.dart';
import 'package:bealert/Common_widgets/sizedboxx.dart';
import 'package:bealert/Common_widgets/textt.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bealert/Common_widgets/containerr.dart';
import 'package:unicons/unicons.dart';

class ListTilee extends StatefulWidget {
  final title;
  final icon;
  final redirection;
  const ListTilee({
    super.key,
    required this.title,
    this.icon,
    this.redirection,
  });

  @override
  State<ListTilee> createState() => _ListTileeState();
}

class _ListTileeState extends State<ListTilee> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Containerr(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(25)),
      child: ListTile(
        minLeadingWidth: 10,
        leading: Icon(widget.icon),
        title: Textt(
            text: widget.title, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
