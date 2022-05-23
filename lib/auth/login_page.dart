import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_management/auth/signup_page.dart';
import 'package:school_management/page/home/home_screen.dart';

class SchoolLogIn extends StatefulWidget {
  SchoolLogIn({Key? key}) : super(key: key);

  @override
  State<SchoolLogIn> createState() => _SchoolLogInState();
}

class _SchoolLogInState extends State<SchoolLogIn> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Login'),
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
                      width: 300,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/login.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Login',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 328.0, right: 50, left: 50),
                child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.person),
                              labelText: 'E-mail',
                              hintText: 'username@gmail.com',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            controller: username,
                          ),
                        ),
                        Padding(
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
                              labelText: 'password',
                              hintText: '********',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            controller: password,
                          ),
                        ),
                        SizedBox(height: 40),
                        RaisedButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 100),
                            color: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: username.text.trim(),
                                      password: password.text.trim())
                                  .then((user) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SchoolHomePage()));
                              }).catchError((e) {
                                print(e);
                              });
                            },
                            child: Text('Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)))
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 488.0, left: 240),
                child: TextButton(
                  onPressed: () {},
                  child: Text('forget password',
                      style: TextStyle(fontStyle: FontStyle.italic)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 588.0, left: 95),
                child: Row(children: [
                  Text("Don't have an account "),
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SchoolSignin()));
                  }, child: Text('Register'))
                ]),
              )
            ]),
          ),
        ));
  }
}
