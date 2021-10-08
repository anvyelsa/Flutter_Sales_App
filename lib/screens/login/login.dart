import 'package:flutter/material.dart';
import 'package:sales/constants.dart';
import 'package:sales/screens/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sales/screens/sign_up/signup.dart';

class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  var  _email, _password;

  
  

  login()async {
    if(_formKey.currentState!.validate())
    {
      _formKey.currentState!.save();

      try{
         await _auth.signInWithEmailAndPassword(
           email: _email, password: _password,
          );
          Navigator.pushReplacementNamed(context, "Home");
      } on FirebaseAuthException
      catch (e)
      {
        
        showError(e.message);
        print(e);
      }
    }
  }

  showError(var errormessage)
  {
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('ERROR'),
          content: Text(errormessage),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text('ok')
            )
          ],
        );
      }
    );
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
            Text(
              "Login",
              style: TextStyle(
                color: kPrimaryColor,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                ),
            ),
            SizedBox(height: size.height * 0.03),
            //image
            Container(
              height: size.height*0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/images.jpeg'),
                  fit: BoxFit.fitHeight,
                ),
                shape: BoxShape.circle,
               ),
            ),


            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
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

                        validator: (input){
                          if (input?.isEmpty?? true) return 'Enter Email';
                        },
                        onSaved: (input)=> _email =input
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
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                        ),
                        cursorColor: kPrimaryColor,

                        validator: (input){
                          

                          if (input?.isEmpty?? true) return 'Enter Password';
                        },
                        obscureText: true,
                        onSaved: (input)=> _password =input
                      ),
                    ),

                    Container(
                      width:size.width* 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                          color: kPrimaryColor,
                          onPressed: login,
                          child:Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.08),
                    GestureDetector(
                      child: Text('Create an Account ?', 
                        style: TextStyle(
                          color: kPrimaryColor,
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                         ),
                      ),
                      onTap: navigateToSignUp,
                    )
                  ],
                  


                )
              ),
            )

          ],),
      ),
      
    );
  }
}