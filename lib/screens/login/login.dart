import 'package:flutter/material.dart';
import 'package:sales/constants.dart';
import 'package:sales/screens/welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sales/screens/sign_up/signup.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _email, _password;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);

        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    //_controller = AnimationController(vsync: this);
    this.checkAuthentification();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }




  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
  navigateToSignUp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100,),
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
             child: Form(
               key: _formKey,
               child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Your Email",
                
              ),
              cursorColor: kPrimaryColor,
              validator: (input) {
                if (input!.isEmpty) return 'Enter Email';
              },
              onSaved: (input) => _email = input!),
               )
             
             ),
              
              ),
           // ),
           
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextFormField(
                validator: (input) {
                  if (input!.length < 6)
                    return 'Provide Minimum 6 Character';
                  },
                decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Password",
              ),
                cursorColor: kPrimaryColor,
                onSaved: (input) => _password = input!,
              ),
              
            ),
            //),
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
                      MaterialPageRoute(builder: (context)=>WelcomeScreen()),
                    );
                  }, 
                  child:Text(
                    "LOGIN",
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