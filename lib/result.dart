import 'package:flutter/material.dart';
import 'bmi.dart';
class ResultBMI extends StatelessWidget {
  double result;
  String message,img;
  ResultBMI(this.result,this.message,this.img);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.grey[900],title: Text("BMI"),centerTitle: true,),
      body: Center(
        child: Container(
            height: 250,
          width: width-20 ,
          child: Card(
            elevation: 5.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(img,height: 80.0,),
                Text("Your BMI Is"),
                Text("$result",style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold ),),
                Text("You are "+message,textAlign: TextAlign.center,),
                RaisedButton(color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.black)),
                  child: Text("Go Back"),onPressed: (){Navigator.pop(context);},)
              ],
            ),
          ),
        ),
      )
    );
  }
}
