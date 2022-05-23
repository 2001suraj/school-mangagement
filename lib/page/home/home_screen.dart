import 'package:flutter/material.dart';
import 'package:school_management/screen/Drawer_Screen.dart';

import '../../screen/home_body_screen.dart';
import '../Notifications/notification.dart';

class SchoolHomePage extends StatelessWidget {
  const SchoolHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text("School Management System"),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SchoolNotification(),
                      ));
                },
                icon: const Icon(Icons.notifications),
              ),
              const Positioned(
                top: 11,
                left: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 5,
                ),
              ),
            ],
          )
        ],
      ),
      drawer:  SchoolDrawer(),
      body: const SchoolHomePageBodyPart(),
    );
  }
}
