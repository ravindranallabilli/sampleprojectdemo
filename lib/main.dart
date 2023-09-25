import 'package:flutter/material.dart';
import 'package:sampleproject/screens/forgot_password_screen.dart';
import 'package:sampleproject/screens/home_screen.dart';
import 'package:sampleproject/screens/signin_screen.dart';
import 'package:sampleproject/screens/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       navigatorKey: navigatorKey,
      theme: ThemeData(
      
       primaryColor: Colors.red, canvasColor: Colors.white
      ),
      home: SignupScreen(),
       routes: <String, WidgetBuilder>{
         '/SignInScreen': (BuildContext context) => SignInScreen(),
          '/ForgotScreenPassword': (BuildContext context) => ForgotScreenPassword(),
          '/HomeScreen': (BuildContext context) => HomeScreen()

       }
    );
  }
}