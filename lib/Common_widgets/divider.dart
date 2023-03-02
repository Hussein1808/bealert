import 'package:flutter/material.dart';

class Div extends StatelessWidget {
  const Div({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 20.0,
      endIndent: 20.0,
      color: Theme.of(context).dividerColor,
      thickness: 1.0,
    );
  }
}
