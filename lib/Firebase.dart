import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> usersetup(String Name)async{
CollectionReference users = FirebaseFirestore.instance.collection('users');

FirebaseAuth auth= FirebaseAuth.instance;
 var uid = auth.currentUser!.uid.toString();
users.add({'Email': Name,'uid': uid,});
 
  return;
}

 //var auth = FirebaseAuth.instance;
 // var userUid = auth.currentUser!.uid;
 // var db = FirebaseFirestore.instance;
 // db.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set({
 ////   'name':Name,
 //   'uid': userUid
 // });