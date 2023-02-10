import 'package:flutter/material.dart';

class BottomEditProfile extends StatefulWidget {
  const BottomEditProfile({super.key});

  @override
  State<BottomEditProfile> createState() => _BottomEditProfileState();
}

class _BottomEditProfileState extends State<BottomEditProfile> {
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textcontroller.text = 'This is a test';
    return Container(
      child: Form(
        child: ListView(
          children: [
            TextFormField(
              controller: textcontroller,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextFormField(
              controller: textcontroller,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: textcontroller,
              decoration: InputDecoration(
                labelText: 'Password',
                focusColor: Colors.red,
              ),
            ),
            TextFormField(
              controller: textcontroller,
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Mobile Number',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Emergency Contact',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Blood Group',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
