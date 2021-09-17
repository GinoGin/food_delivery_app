
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_screen.dart';

import 'constants.dart';
import 'home_screen.dart';
//import 'login_screen.dart';
//i9fbMRx2FlRS7LPe9usQ6J4u6HK2

void main() 
  {
    runApp(InitialScreen());
  }
  


class InitialScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: LoginScreen(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}