import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'bmi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();

 }

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=>BMI())));
  }
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Stack(
        fit: StackFit.expand,
       children: <Widget>[
         Column(
           children: <Widget>[
             Expanded(flex: 3,
             child:  Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   CircleAvatar(backgroundColor: Colors.white,radius: 50.0,child:Icon(Icons.show_chart,color: Colors.green,size: 50.0,)),
                   SizedBox(height: 10.0,),
                   Text("BMI Calculator",textAlign: TextAlign.center,style: TextStyle(letterSpacing: 2.0,fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.white),),
                  // SizedBox(height: height/4 ,),

                 ]
             ),
             ),
             Expanded(flex: 1,
               child: Column(
                 children: <Widget>[
                   CircularProgressIndicator(backgroundColor: Colors.white,),
                   SizedBox(height: 10,),
                   Text("LOADING...",style: TextStyle(color: Colors.white),),
                 ],
               ),
             )
           ],
         ),
       ],

      ),



    );
  }
}


