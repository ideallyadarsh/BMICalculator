import 'result.dart';
import 'package:flutter/material.dart';
class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
   final   TextEditingController _heightcontroller=new TextEditingController();
   final   TextEditingController _weightcontroller=new TextEditingController();
   final   TextEditingController _agecontroller=new TextEditingController();
      double _result=0.0;
      String message ="";
      String img ="";
     double _h=0.0;
      void clear(){
        setState(() {
          _agecontroller.clear();
          _heightcontroller.clear();
          _weightcontroller.clear();
        });

      }

       void Calculate(){

         if (( _heightcontroller==null)||(_weightcontroller==null)||(_agecontroller==null)){
           print('Please enter valid values');
           message='Please enter valid values';
         }
         else
        setState(() {
          double height =double.parse(_heightcontroller.text);
          double weight =double.parse(_weightcontroller.text);
          double age = double.parse(_agecontroller.text);



          _h=height/100;
          _result=weight/(_h*_h);
          _result = double.parse(_result.toStringAsFixed(2));


          if(_result<18.5)
          { message='Underweight\nYou need to eat&exercise';img="assets/under.jpg";}
          if(_result>=18.5 && _result<24.9)
          {message='Fit\nKeep Exercising';img="assets/fit.png";}
          if(_result>=24.9 && _result<29.9)
          {message='Overweight\nThings are in hands!Exercise.';img="assets/fat.jpg";}
          if(_result>=29.9)
          {message='much overweight\n'
              'Keep It under 25';img="assets/obesity.jpg";}
        });
      }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body:Column(
        children: <Widget>[
          Image.asset("assets/logo.png",height: 200,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: _card("Height",_heightcontroller,"  cm",Icon(Icons.accessibility_new,color: Colors.white,size: 35,)),),
                      Expanded(child: _card("Weight",_weightcontroller,"  kg",Icon(Icons.av_timer,color: Colors.white,size: 35)),),
                      Expanded(child: _card("Age",_agecontroller,"  years",Icon(Icons.cake,color: Colors.white,size: 35)),)
                    ],
                  ),
                  SizedBox(height: 20.0,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     RaisedButton(color: Colors.white,
                       child: Text("Get BMI",style: TextStyle(color: Colors.green),),
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),side: BorderSide(color: Colors.green,width: 3.0),),
                    onPressed: () {
                       Calculate();
                       if(_result==0.0)
                         Text(message);
                       else
                       Navigator.push(context, new MaterialPageRoute(builder: (context) => new ResultBMI(_result, message,img)));
                    }
                     ),
                      SizedBox(width: 40.0,),
                     RaisedButton(
                       color: Colors.white,
                       child: Text("Clear",style: TextStyle(color: Colors.red),),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),side: BorderSide(color: Colors.red,width: 3.0),),
                     onPressed: (){
                         print("clear clikde");
                         clear();},
                     ),
                   ],
                 ),
                ],
              ),
            ),
          ),

        ],
      )
    );
  }
}
Widget _card(String label,TextEditingController controller,String unit,Widget icon){
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
    child: Container(
      color: Colors.grey[900],
      height: 150.0,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text(label,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.white),),
          SizedBox(height: 5.0,),
          icon,
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: TextField(
              controller: controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(hintText:unit,
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.green),
                ),),
            ),
          )
        ],
      ),
    ),
  );
}