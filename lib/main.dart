import 'package:a4/Screens/RegisterPage.dart';
import 'package:a4/Screens/home.dart';
import 'package:a4/Screens/loginScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users");

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return ScreenUtilInit(
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.idScreen,
        routes: {
          RegisterPage.idScreen: (context) => RegisterPage(), 
          LoginScreen.idScreen: (context) => LoginScreen(),   
          Home.idScreen: (context) => Home(),
        },
      ),
      designSize: Size(428, 926),
    );
  }
}

   