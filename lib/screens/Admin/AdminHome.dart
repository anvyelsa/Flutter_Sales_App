import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sales/constants.dart';
import 'package:sales/screens/Admin/Admin.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({ Key? key }) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  //String _email= FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) => value.data()!["Email"]) as String;
    

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: const Center(
        child:Text('Welcome Admin!'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Admin"), 
              accountEmail: Text(""),
              currentAccountPicture: CircleAvatar(
                backgroundColor: 
                Theme.of(context).platform==TargetPlatform.iOS? Colors.deepPurple:Colors.white,
                child: Text("A",style: TextStyle(fontSize: 40.0),),
              ), 
            ),
           /*const DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
              ) ,
              child: Text('Admin'),
              ),*/
            ExpansionTile(
              title: Text('SALE INVOICE'),
              expandedAlignment: Alignment.center,
              children: <Widget> [              
                    ListTile(
                      title: Text('NEW INVOICE'),
                      onTap: (){

                      },
                    ),
                    ListTile(
                      title: Text('INVOICES'),
                      onTap: (){

                      },
                    )

              ],
              ),
              ExpansionTile(
                title: Text('REPORT',style: TextStyle(),),
                expandedAlignment: Alignment.centerLeft,
                children: <Widget> [                 
                    ListTile(
                      title: Text('REPORT 1'),
                      onTap: (){

                      },
                    ),
                    ListTile(
                      title: Text('REPORT 2'),
                      onTap: (){

                    },
                  )
                ],
              ),
              ListTile(
                title: Text('ADMIN'),
                onTap: (){

                    Navigator.push(context,MaterialPageRoute(builder: (context)=>admin()));
                },
              )
          ],
          ),
        ),
    );
  }
}