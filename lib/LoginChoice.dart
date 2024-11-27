import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/LogInPage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'SignUpPage.dart';
Future<UserCredential> googleSignIn() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
class LoginchoiceScreen extends StatefulWidget
{
   @override
 _LoginchoiceScreenState createState() => _LoginchoiceScreenState();

}

class _LoginchoiceScreenState extends State<LoginchoiceScreen>
{
  //  void _login()
  // {
  //   loginWithEmail(_emailController.text, _passwordController.text);
  // }

  void _signInWithGoogle() async
{
 UserCredential result = await googleSignIn();
 if(result == null)
 {
  Navigator.pushReplacementNamed(context,'/home/');
 }
 else 
 {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('result')));
 }
}
 @override
Widget build(BuildContext context)
{
  return Scaffold(
    extendBody: true,
    body: Container(width: 500,
    decoration: BoxDecoration(image: DecorationImage(
       opacity: 0.7,
  image:NetworkImage('https://i.pinimg.com/736x/9d/0b/51/9d0b519f24646d2b1b428d0c3c9657af.jpg'),
  fit:BoxFit.fill)),
    child:Column(children: [
       SizedBox(height: 130,),
       Text('''Welcome To
BLOOMING''',
      style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold)),
     SizedBox(height: 55,),
      Container(
          width: 250,height:50,
          child: ElevatedButton(onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          }, child:Text("LOG IN",style: TextStyle(fontSize:20,color: Colors.white,fontWeight: FontWeight.bold),),
          style:ElevatedButton.styleFrom(
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor:Color.fromARGB(255, 40, 144, 45).withOpacity(0.9))),
        ),
         SizedBox(height: 30,),
        Container(
          width: 250,height:50,
          child: ElevatedButton(onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
          }, child:Text("SIGN UP",style: TextStyle(fontSize:20,color: Colors.white,fontWeight: FontWeight.bold),),
          style:ElevatedButton.styleFrom(
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor:Color.fromARGB(255, 40, 144, 45).withOpacity(0.9))),
        ),
         SizedBox(height: 20),
        Row(
          children: [
            SizedBox(width: 78,),
            Text(' Sign Up With',style: TextStyle(fontSize:24,color: Color.fromARGB(255, 8, 8, 8),fontWeight: FontWeight.bold),),
            IconButton(
             icon: Image.network('https://cdn-icons-png.flaticon.com/512/1199/1199414.png',
              width: 40,height: 40,), // Replace with Google icon
             iconSize: 40,
             onPressed: () { _signInWithGoogle();},),
         ],
        ),
       

    ],),),
  );
}
}