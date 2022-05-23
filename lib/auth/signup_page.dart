import 'package:flutter/material.dart';
import 'package:school_management/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_management/auth/result.dart';
import 'package:school_management/auth/storage.dart';
import 'package:school_management/page/home/home_screen.dart';

class SchoolSignin extends StatefulWidget {
  SchoolSignin({Key? key}) : super(key: key);

  @override
  State<SchoolSignin> createState() => _SchoolSigninState();
}

class _SchoolSigninState extends State<SchoolSignin> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController conpassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController rollno = TextEditingController();
  TextEditingController section = TextEditingController();
  TextEditingController standard = TextEditingController();

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Sign In'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(children: [
              Container(height: 500, color: Colors.blue),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/signup.png'),
                            fit: BoxFit.contain),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Sign up',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 260.0, right: 50, left: 50),
                child: Container(
                    height: 680,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        biuldtextfield(
                            label: 'Username',
                            hint: ' e.g : Ram',
                            icon: Icons.person,
                            cont: username),
                        buildpasswordtextfield(
                            pass: "Password", cont: password),
                        buildpasswordtextfield(
                            pass: " Confirm Password", cont: conpassword),
                        biuldtextfield(
                            label: 'Email',
                            hint: 'e.g :Ram@gmail.com',
                            icon: Icons.email,
                            cont: email),
                        biuldtextfield(label: 'Section', cont: section),
                        biuldtextfield(label: 'class', cont: standard),
                        biuldtextfield(label: 'Roll no', cont: rollno),
                        SizedBox(height: 40),
                        RaisedButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 100),
                            color: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                              Storage(
                                email: email.text.trim(),
                                rollno: rollno.text.trim(),
                                section: section.text.trim(),
                                username: username.text.trim(),
                                password: password.text.trim(),
                                standard: standard.text.trim(),
                              ).create();
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: email.text.trim(),
                                      password: password.text.trim())
                                  .then((user) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => 
                                    // SchoolHomePage(),
                                    Resultff(),
                                  ),
                                );
                              }).catchError((e) {
                                print(e);
                              });
                            },
                            child: Text('Sign up',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)))
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 828.0, left: 240),
                child: TextButton(
                  onPressed: () {},
                  child: Text('forget password',
                      style: TextStyle(fontStyle: FontStyle.italic)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 928.0, left: 95),
                child: Row(children: [
                  Text("Already have an account "),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SchoolLogIn()));
                      },
                      child: Text('Login'))
                ]),
              )
            ]),
          ),
        ));
  }

  Padding buildpasswordtextfield({pass, cont}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        obscureText: visible ? true : false,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  visible = !visible;
                });
              },
              child: visible
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off)),
          labelText: pass,
          hintText: '********',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        controller: cont,
      ),
    );
  }

  Padding biuldtextfield({label, hint, cont, icon}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: Icon(icon),
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        controller: cont,
      ),
    );
  }
}
