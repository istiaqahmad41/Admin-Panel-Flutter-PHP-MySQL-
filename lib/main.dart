import 'package:flutter/material.dart';
import 'login_screen.dart';     // Make sure to import your screens
import 'register_screen.dart';

void main() {
  runApp(MyApp()); // <- Properly wrapped
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login/Register Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
  home : LoginScreen(),
      routes: {

        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
