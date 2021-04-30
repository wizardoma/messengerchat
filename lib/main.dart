import 'package:flutter/material.dart';
import 'package:messengerchat/presentation/auth/signin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Messenger",
      home: SignInScreen(),
    );
  }
}
