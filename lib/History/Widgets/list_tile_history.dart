// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:bealert/Common_widgets/textt.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryListTilee extends StatefulWidget {
  final title;
  final trailing;
  const HistoryListTilee({
    super.key,
    required this.title,
    this.trailing,
  });

  @override
  State<HistoryListTilee> createState() => _HistoryListTileeState();
}

class _HistoryListTileeState extends State<HistoryListTilee> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 8),
            ),
          ),
          child: ListTile(
            minVerticalPadding: 15,
            title: Textt(
              text: widget.title,
              color: Theme.of(context).colorScheme.primary,
              size: 28.0,
              font: GoogleFonts.roboto,
              weight: FontWeight.bold,
            ),
            subtitle: Textt(
              text: 'Number of times being drowsy ',
              size: 16.0,
              color: Theme.of(context).secondaryHeaderColor,
              weight: FontWeight.bold,
            ),
            //space between title and subtitle
            trailing: Textt(
              text: '${widget.trailing}',
              size: 58.0,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
