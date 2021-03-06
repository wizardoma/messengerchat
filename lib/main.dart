import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messengerchat/presentation/auth/signin_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {await Firebase.initializeApp();}
  catch (e) {}

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Messenger",
      home: SignInScreen(),
    );
  }
}
