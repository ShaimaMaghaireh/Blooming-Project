import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/LoginChoice.dart';
import 'package:flutter_with_firebase/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'homepage2.dart';

class SplashScreen extends StatefulWidget
{
   @override
 _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>
{
 @override
Widget build(BuildContext context)
{
  return Scaffold(
    extendBody:true ,
    body:Container(
      width: 500,
      decoration: BoxDecoration(
      image: DecorationImage(
      image:NetworkImage('https://wallpapers.com/images/hd/ruscus-leaf-in-dark-sc4yn2cfo2ufrcs6.jpg')
      ,fit: BoxFit.fill)),
      child:Column(children: [
        SizedBox(height: 155,),
        Text("BLOOMING",
         style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold)),
          SizedBox(height: 55,),
        Text("""Find Out Your
   Favourite Plants""",
        style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
        SizedBox(height: 155,),
        Container(
          width: 200,height:50,
          child: ElevatedButton(onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginchoiceScreen()));
          }, child:Text("Get Started",style: TextStyle(fontSize:20,color: Colors.white),),
          style:ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor:Color.fromARGB(255, 162, 206, 164).withOpacity(0.8))),
        ),
      ],),) ,
  );
}
}