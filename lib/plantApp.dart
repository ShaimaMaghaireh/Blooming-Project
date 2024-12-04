import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_with_firebase/notificationHandler.dart';
import 'authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'homepage2.dart';

 Future<void> main () async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

await firebase_messaging_to_project().init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // Adjust this to your design dimensions
      builder: (context, child) {
        return MaterialApp(
          title: 'Plant App',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}

