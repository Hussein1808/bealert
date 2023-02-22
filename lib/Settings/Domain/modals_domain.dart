import 'package:flutter/material.dart';

class Modal {
  String title;
  String? mtitle;
  String? mtext;
  IconData icon;
  String? redirection;

  Modal({
    required this.title,
    required this.icon,
    this.redirection,
    this.mtitle,
    this.mtext,
  });
}
