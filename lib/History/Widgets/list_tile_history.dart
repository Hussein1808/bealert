// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:bealert/Common_widgets/textt.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HistoryListTilee extends StatefulWidget {
  final date;
  final distance;
  final time;
  final drowsinesstimes;

  const HistoryListTilee({
    super.key,
    required this.date,
    required this.distance,
    required this.time,
    required this.drowsinesstimes,
  });

  @override
  State<HistoryListTilee> createState() => _HistoryListTileeState();
}

class _HistoryListTileeState extends State<HistoryListTilee> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    String formatteddate = DateFormat.MMMd().format(widget.date);
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed('tripsdetails', params: {
          'title': formatteddate,
          'date':  '${widget.date}',
          'trailing': '${widget.drowsinesstimes}',
          'tripdistance': '${widget.distance}'
        });
      },
      child: Card(
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
                text: formatteddate.toString(),
                color: Theme.of(context).colorScheme.primary,
                size: screenwidth * 0.04,
                font: GoogleFonts.roboto,
                weight: FontWeight.bold,
              ),
              subtitle: Textt(
                text: 'Number of times being drowsy ',
                size: screenwidth * 0.03,
                color: Theme.of(context).secondaryHeaderColor,
                weight: FontWeight.bold,
              ),
              //space between title and subtitle
              trailing: Textt(
                text: '${widget.drowsinesstimes}',
                size: screenwidth * 0.1,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
