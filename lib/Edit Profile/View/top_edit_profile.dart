import 'package:flutter/material.dart';


import '../../Common_widgets/containerr.dart';


class TopEditProfile extends StatefulWidget {
  const TopEditProfile({super.key});

  @override
  State<TopEditProfile> createState() => _TopEditProfileState();
}

class _TopEditProfileState extends State<TopEditProfile> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    
    return Containerr(
      w: screenwidth,
      h: screenheight * 0.3,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Containerr(
                w: screenwidth * 0.359,
                h: screenheight * 0.17,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(150)),
                  image:
                      DecorationImage(image: AssetImage('assets/settings.png')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
