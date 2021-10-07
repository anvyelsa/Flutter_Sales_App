import 'package:flutter/material.dart';
import 'package:sales/constants.dart';
import 'package:sales/screens/Home.dart';
import 'package:sales/screens/Home.dart';

class login extends StatelessWidget {
  const login({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height:100,),
            Text("Login",
            style: TextStyle(
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
            //fontFamily: 'Raleway-Bold',
            color: Colors.purple[700] 
            ),
          ),
            SizedBox(height: size.height * 0.03),
            //image
            Container(
              height: size.height*0.35,
              decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage('assets/images/images.jpeg'),
              fit: BoxFit.fitHeight,
              ),
              shape: BoxShape.circle,
               ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Your Email",
              ),
              cursorColor: kPrimaryColor,
              ),
            ),
            
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Password",
              ),
              cursorColor: kPrimaryColor,
              ),
            ),
            Container(
              width:size.width* 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  color: kPrimaryColor,
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context)=>Home()),
                    );
                  }, 
                  child:Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                    ),
                ),
              ),
            ),

          ],
        ),
      )
      
      
    );
  }
}