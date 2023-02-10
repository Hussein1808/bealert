import 'package:flutter/cupertino.dart';

class Tile {
  String title;
  IconData icon;
  String? redirection;

  Tile({required this.title, required this.icon, this.redirection});
}
