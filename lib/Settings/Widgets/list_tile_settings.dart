// ignore_for_file: prefer_const_constructors
import 'package:bealert/Common_widgets/textt.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bealert/Common_widgets/containerr.dart';

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
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        context.go(widget.redirection);
      },
      child: Containerr(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(40)),
        child: ListTile(
          minLeadingWidth: 10,
          leading: Icon(widget.icon),
          title: Textt(
            text: widget.title,
            color: Theme.of(context).colorScheme.primary,
            size: screenwidth * 0.04,
            weight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
