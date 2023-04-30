import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Const/constants.dart';
import '../../User/Data/UserData.dart';
import '../../User/Data/auth_data.dart';

class BottomEditProfile extends StatefulWidget {
  const BottomEditProfile({super.key});

  @override
  State<BottomEditProfile> createState() => _BottomEditProfileState();
}

class _BottomEditProfileState extends State<BottomEditProfile> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController nationalIDcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController emergencycontactcontroller = TextEditingController();
  TextEditingController bloodgroupcontroller = TextEditingController();
  String uid = ' ';
  // Userr a= await getUser(uid);

  @override
  void initState() {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        // GoRouter.of(context).go('/login');
        context.go('/login_page');
      } else {
        // setState(() {
        uid = user.uid;

        // });

        print('User is signed in!');
        usernamecontroller.text = currUser!.username;
        fullnamecontroller.text = currUser!.fullname;
        addresscontroller.text = currUser!.address;
        nationalIDcontroller.text = currUser!.nationalID.toString();
        phonenumbercontroller.text = currUser!.phonenumber;
        emergencycontactcontroller.text = currUser!.emergencycontact;
        bloodgroupcontroller.text = currUser!.bloodgroup;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Edit Profile',
          style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontSize: screenwidth * 0.05),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          onPressed: () {
            GoRouter.of(context).go('/home/4');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Form(
        child: ListView(
          children: [
            TextFormField(
              controller: usernamecontroller,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextFormField(
              controller: fullnamecontroller,
              decoration: const InputDecoration(
                labelText: 'Full name',
              ),
            ),
            TextFormField(
              controller: addresscontroller,
              decoration: const InputDecoration(
                labelText: 'Address',
                focusColor: Colors.red,
              ),
            ),
            TextFormField(
              controller: nationalIDcontroller,
              decoration: const InputDecoration(
                labelText: 'National ID',
              ),
            ),
            TextFormField(
              controller: phonenumbercontroller,
              decoration: const InputDecoration(
                labelText: 'Mobile Number',
              ),
            ),
            TextFormField(
              controller: emergencycontactcontroller,
              decoration: const InputDecoration(
                labelText: 'Emergency Contact',
              ),
            ),
            TextFormField(
              controller: bloodgroupcontroller,
              decoration: const InputDecoration(
                labelText: 'Blood Group',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
