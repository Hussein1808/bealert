// ignore_for_file: prefer_const_literals_to_create_immutables, unused_local_variable
import 'package:bealert/Settings/Widgets/list_tile_settings.dart';
import 'package:flutter/material.dart';
import '../Data/modals_data.dart';
import '../Data/tiles_data.dart';
import '../Widgets/list_modal_settings.dart';

class BottomSettings extends StatefulWidget {
  const BottomSettings({super.key});

  @override
  State<BottomSettings> createState() => _BottomSettingsState();
}

class _BottomSettingsState extends State<BottomSettings> {
  @override
  Widget build(BuildContext context) {
    //* Screen size
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListView.builder(
              shrinkWrap: true,
              physics:const  NeverScrollableScrollPhysics(),
              itemCount: tiles.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTilee(
                    title: tiles[index].title,
                    icon: tiles[index].icon,
                    redirection: tiles[index].redirection,
                  ),
                );
              }),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: modals.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Modall(
                    title: modals[index].title,
                    icon: modals[index].icon,
                    redirection: modals[index].redirection,
                    mtitle: modals[index].mtitle,
                    mtext: modals[index].mtext,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
