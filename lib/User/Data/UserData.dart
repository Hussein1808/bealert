import 'dart:convert';
class Userr{
  Userr({required this.username,required this.fullname,required this.address,required this.nationalID, required this.phonenumber,required this.emergencycontact,required this.bloodgroup});
  String username;
  String fullname;
  String address;
  int nationalID;
  String phonenumber;
  String emergencycontact;
  String bloodgroup;


  Map<String, dynamic> toMap() {
    return {
      'Username': username,
      // 'uid': uid,
      'Fullname': fullname,
      'Address': address,
      'NationalID': nationalID,
      'PhoneNumber': phonenumber,
      'EmergencyContact': emergencycontact,
      'BloodGroup': bloodgroup,
    };
  }

  factory Userr.fromMap(Map<String, dynamic> map) {
    return Userr(
        username: map['Username'] ?? 'not specified',
        fullname: map['Fullname'] ?? "not specified",
        address: map['Address'] ?? 'not specified',
        nationalID: map['NationalID'] ?? "not specified",
        phonenumber: map['PhoneNumber'] ?? "not specified",
        emergencycontact: map['EmergencyContact']??'not specified',
        bloodgroup: map['BloodGroup']??'not specified'
    );
  }

  factory Userr.fromJson(String data) {
    return Userr.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}