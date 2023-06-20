import 'package:bealert/Common_widgets/containerr.dart';
import 'package:bealert/Const/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiver/time.dart';
import 'package:swipe/swipe.dart';
import '../../Common_widgets/textt.dart';
import '../../User/Data/UserData.dart';
import '../../User/Data/auth_data.dart';

class TopSettings extends StatefulWidget {
  const TopSettings({super.key});

  @override
  State<TopSettings> createState() => _TopSettingsState();
}

class _TopSettingsState extends State<TopSettings> {
  // final DateFormat _dateFormatter = DateFormat.MMMEd();
  // late var months = DateFormat.M().format(DateTime.now());
  late var daysinmonth = daysInMonth(DateTime.now().year, DateTime.now().month);
  String constt = ' ';
  Userr userr=Userr();
  Future<void> _getuser() async {
    final u=await getUser();
    setState(() {
      userr = u;
    });

  }
  @override
  void initState() {
    _getuser().then((value) {
      constt=  userr.fullname!;
    });
    // if (currUser != null) constt = currUser!.fullname;
  }

  @override
  Widget build(BuildContext context) {
    // constt= await userr.fullname!;
    //* Screen size
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Swipe(
        onSwipeUp: () {
          GoRouter.of(context).go('/home/1');
        },
        //* Top blue container
        child: Stack(
          children: [
            Containerr(
              w: screenwidth,
              h: screenheight * 0.3,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(40),
                ),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).splashColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        // Containerr(
                        //   w: screenwidth * 0.21,
                        //   h: screenheight * 0.1,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(100),
                        //     image: const DecorationImage(
                        //         image: AssetImage('assets/settings.png')),
                        //   ),
                        // ),
                        Textt(
                          text: '$constt',
                          weight: FontWeight.bold,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 21.0),
              child: Containerr(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                w: screenwidth * 0.43,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Textt(
                        text: 'Settings',
                        font: GoogleFonts.roboto,
                        color: Theme.of(context).colorScheme.primary,
                        size: screenwidth * 0.05,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
