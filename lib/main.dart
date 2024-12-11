import 'package:caffee/firebaseDatabase/home.dart';
import 'package:caffee/home_screen.dart';
import 'package:caffee/login_screen.dart';
import 'package:caffee/sample.dart';
import 'package:caffee/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Sample(),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      );
    }
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: SignupScreen(),
    // );

  }
}

