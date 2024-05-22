import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final double bottomPadding = 20; // Adjust padding as needed

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login'); // Replace '/home' with your actual home screen route
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack( // Use Stack to position elements
        children: [
          Center( // Center the logo
            child: Image.asset('lib/images/Logo.png'), // Replace with your logo image
          ),
          Positioned( // Position the text at the bottom
            bottom: bottomPadding, // Adjust padding from the bottom
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Designed by Mhamad Felfol",
                  style: TextStyle(fontSize: 12, color: Colors.white), // Adjust text style and color
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
