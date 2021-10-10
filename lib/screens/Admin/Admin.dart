import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class admin extends StatefulWidget {
  const admin({ Key? key }) : super(key: key);

  @override
  _adminState createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>
          [// Scaffold(
            //body: 
            Text("Sales Admin",
              style: TextStyle(
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              //fontFamily: 'Raleway-Bold',
              color: Colors.purple[700] 
              ),
            ),
          //),
            
            SizedBox(height: size.height * 0.05),
          
            Container(
              width:size.width* 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  color: kPrimaryColor,
                  onPressed: (){
                    
                    
                  }, 
                  child:Text(
                    "CUSTOMERS",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Container(
              width:size.width* 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  color: kPrimaryColor,
                  onPressed: (){
                    
                    
                  }, 
                  child:Text(
                    "PRODUCTS",
                    style: TextStyle(color: Colors.white),
                    ),
                ),
              ),
            ),
          
          ]
        ),
        
      ),
      
    );
    /**/
  }
}

