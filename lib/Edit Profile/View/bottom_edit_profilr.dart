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
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextFormField(
              controller: textcontroller,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: textcontroller,
              decoration:const  InputDecoration(
                labelText: 'Password',
                focusColor: Colors.red,
              ),
            ),
            TextFormField(
              controller: textcontroller,
              decoration:const  InputDecoration(
                labelText: 'Address',
              ),
            ),
            TextFormField(
              decoration:const  InputDecoration(
                labelText: 'Mobile Number',
              ),
            ),
            TextFormField(
              decoration:const  InputDecoration(
                labelText: 'Emergency Contact',
              ),
            ),
            TextFormField(
              decoration:const  InputDecoration(
                labelText: 'Blood Group',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
