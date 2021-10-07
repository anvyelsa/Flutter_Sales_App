import 'package:flutter/material.dart';
import 'package:sales/screens/login/login.dart';
import 'package:sales/screens/sign_up/signup.dart';
import '../../constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>
        [// Scaffold(
          //body: 
          Text("SALES",
            style: TextStyle(
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
            //fontFamily: 'Raleway-Bold',
            color: Colors.purple[700] 
            ),
          ),
        //),
          
         SizedBox(height: size.height * 0.05),
        //SvgPicture.asset('assets\icons\chat.svg',height:size.height * 0.45,),
       //Image(image: AssetImage('assets\images\welcome.jpeg'),height: size.height*0.45,),
       Container(
         height: size.height*0.45,
         decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage('assets/images/images.jpeg'),
         fit: BoxFit.fitHeight,
         ),
         shape: BoxShape.circle,
         ),
       ),
        // ignore: deprecated_member_use
         SizedBox(height: size.height * 0.1),
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
                  MaterialPageRoute(builder: (context)=>login()),
                );
              }, 
              child:Text(
                "LOGIN",
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
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              color: kPrimaryColor,
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>SignUp()),
                );
              }, 
              child:Text(
                "SIGN UP",
                style: TextStyle(color: Colors.white),
                ),
            ),
          ),
        ),
        ]
      ),
    );
  }
}
