import 'package:cloud_firestore/cloud_firestore.dart';

class Storage {
  String email;
  String  rollno;
  String  username;
  String  section;
  String  standard;
  String  password;
Storage({required this.email, required this.password, required this.rollno, required this.section, required this.standard, required this.username});

  create() async {
    await FirebaseFirestore.instance.collection('school').doc(email).set({
      'student_roll_no': rollno,
      'student_name': username,
      'student_section': section,
      "student_email": email,
      'class': standard,
      'password': password
    }).catchError((e) {
      print(e);
    });
  }
}
