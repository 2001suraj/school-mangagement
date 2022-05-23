import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Resultff extends StatelessWidget {
  Resultff({Key? key}) : super(key: key);
  final firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('firestore result')),
      body: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
        stream: firebase.collection('school').snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              QueryDocumentSnapshot x = snapshot.data!.docs[index];
            return ListTile(
              title: Text('name ' + x['class']['Bob']),
            );
          });
        }
      )),
    );
  }
}
