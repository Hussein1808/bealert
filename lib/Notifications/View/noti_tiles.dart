// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:bealert/Common_widgets/textt.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NotiTiles extends StatefulWidget {
  final date;
  final tripid;
  final info;

  const NotiTiles({
    super.key,
    required this.date,
    required this.tripid,
    required this.info,
  });

  @override
  State<NotiTiles> createState() => _NotiListTileeState();
}

class _NotiListTileeState extends State<NotiTiles> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    String formatteddate = DateFormat.MMMd().format(widget.date);
    return GestureDetector(
      onTap: () {
        // GoRouter.of(context).pushNamed('tripsdetails', params: {
        //   'title': formatteddate,
        //   'trailing': '${widget.drowsinesstimes}',
        //   'tripdistance': '${widget.distance}'
        // });
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
                text: '${widget.info}',
                size: screenwidth * 0.03,
                color: Theme.of(context).secondaryHeaderColor,
                weight: FontWeight.bold,
              ),
              //space between title and subtitle
            ),
          ),
        ),
      ),
    );
  }
}
