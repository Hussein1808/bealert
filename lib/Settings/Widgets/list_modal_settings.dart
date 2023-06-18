// ignore_for_file: prefer_const_constructors
import 'package:bealert/Common_widgets/textt.dart';
import 'package:bealert/Const/constants.dart';
import 'package:bealert/Record/Repository/trip_data_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bealert/Common_widgets/containerr.dart';
import 'package:quickalert/quickalert.dart';

class Modall extends StatefulWidget {
  final title;
  final icon;
  final redirection;
  final mtitle;
  final mtext;
  const Modall({
    super.key,
    required this.title,
    this.icon,
    this.redirection,
    this.mtitle,
    this.mtext,
  });

  @override
  State<Modall> createState() => _ModallState();
}

class _ModallState extends State<Modall> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        if (widget.title == 'Clear History') {
          QuickAlert.show(
            context: context,
            title: widget.mtitle,
            text: widget.mtext,
            type: QuickAlertType.warning,
            confirmBtnText: 'yes',
            confirmBtnColor: Theme.of(context).splashColor,
            showCancelBtn: true,
            onConfirmBtnTap: () {
              TripsRepository().deleteTrips();
              Navigator.pop(context);
            },
            onCancelBtnTap: () {
              Navigator.pop(context);
            },
          );
        } else if (widget.title == 'logout') {
          QuickAlert.show(
            context: context,
            title: widget.mtitle,
            text: widget.mtext,
            type: QuickAlertType.confirm,
            confirmBtnText: 'yes',
            onConfirmBtnTap: () {
              Navigator.pop(context);
              FirebaseAuth.instance.signOut();
              currUser=null;
              GoRouter.of(context).go('/login_page');
            },
          );
        }
      },
      child: Containerr(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(25)),
        child: ListTile(
          minLeadingWidth: 10,
          leading: Icon(widget.icon),
          title: Textt(
            text: widget.title,
            color: Theme.of(context).colorScheme.primary,
            weight: FontWeight.w600,
            size: screenwidth * 0.04,
          ),
        ),
      ),
    );
  }
}
