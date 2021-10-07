import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
        
        ]
      ),
    );
  }
}