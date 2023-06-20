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
  final RegExp namevalid = RegExp(r'(^[a-zA-Z]+$)');
  final bloodGroupRegex = RegExp(r'^(A|B|AB|O)[+-]$');
  final RegExp nationalIdRegex = RegExp(r'^[0-9]{1,}$');
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
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
      usernamecontroller.text = userr.username!;
      fullnamecontroller.text = userr.fullname!;
      addresscontroller.text = userr.address!;
      nationalIDcontroller.text = userr.nationalID.toString();
      phonenumbercontroller.text = userr.phonenumber!;
      emergencycontactcontroller.text = userr.emergencycontact!;
      bloodgroupcontroller.text = userr.bloodgroup!;
    });

  }

  @override
  Widget build(BuildContext context) {

    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Edit Profile',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: screenwidth * 0.06),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            GoRouter.of(context).go('/home/4');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                userr.username = usernamecontroller.text;
                userr.fullname = fullnamecontroller.text;
                userr.address = addresscontroller.text;
                userr.nationalID = int.parse(nationalIDcontroller.text);
                userr.phonenumber = phonenumbercontroller.text;
                userr.emergencycontact = emergencycontactcontroller.text;
                userr.bloodgroup = bloodgroupcontroller.text;
                await editUser( userr);
              }
            },
          ),
        ],
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required';
                } else if (!namevalid.hasMatch(value) &&
                    !RegExp(r"\s").hasMatch(value)) {
                  return 'Name must be alphabets';
                } else if (value.length < 3) {
                  return 'Name must be atleast 3 characters';
                } else {
                  return null;
                }
              },
              controller: usernamecontroller,
              decoration: InputDecoration(
                labelText: 'Username',
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 3.0,
                  ),
                ),
                errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required';
                } else {
                  return null;
                }
              },
              controller: fullnamecontroller,
              decoration: InputDecoration(
                labelText: 'Full name',
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 3.0,
                  ),
                ),
                errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required';
                } else {
                  return null;
                }
              },
              controller: addresscontroller,
              decoration: InputDecoration(
                labelText: 'Address',
                focusColor: Colors.red,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 3.0,
                  ),
                ),
                errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required';
                } else if (!nationalIdRegex.hasMatch(value)) {
                  return 'Invalid National ID format';
                } else {
                  return null;
                }
              },
              controller: nationalIDcontroller,
              decoration: InputDecoration(
                labelText: 'National ID',
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 3.0,
                  ),
                ),
                errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required';
                } else {
                  return null;
                }
              },
              controller: phonenumbercontroller,
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 3.0,
                  ),
                ),
                errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required';
                } else {
                  return null;
                }
              },
              controller: emergencycontactcontroller,
              decoration: InputDecoration(
                labelText: 'Emergency Contact',
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 3.0,
                  ),
                ),
                errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (!bloodGroupRegex.hasMatch('$value')) {
                  return 'Invalid blood group format';
                }
                return null;
              },
              controller: bloodgroupcontroller,
              decoration: InputDecoration(
                labelText: 'Blood Group',
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 3.0,
                  ),
                ),
                errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
