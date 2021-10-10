import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class customer extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("customer"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('customer').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Card(
                  child: ListTile(
                    //title: //Text(doc.data()!["name"]),
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}