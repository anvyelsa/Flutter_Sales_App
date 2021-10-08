import 'package:flutter/material.dart';
import 'package:sales/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  var  _email, _password;

  
//  CheckAuthentication() async {
//    _auth.authStateChanges().listen((user) async {
//      if(user != null){
        //Navigator.pushReplacementNamed(context, "/");
//        Navigator.push(
//                  context, 
//                  MaterialPageRoute(builder: (context)=>Home()),
//                );
//      }
 //   });
  //}
  @override
 // void initState()
 // {
   // super.initState();
    //this.CheckAuthentication();
  //} 

  signUp()async {
    if(_formKey.currentState!.validate())
    {
      _formKey.currentState!.save();

      try{
        UserCredential user = await _auth.createUserWithEmailAndPassword(
           email: _email, password: _password,
          );
        if (user != null)
        {
          await _auth.currentUser!.updateDisplayName(_email);
          Navigator.pushReplacementNamed(context, "Home");

        }
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
              "SIGN UP",
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
                          onPressed: signUp,
                          child:Text(
                            "SIGN UP",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
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