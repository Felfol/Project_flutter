import 'package:flutter/material.dart';
import 'package:project_flutter/pages/Splash.dart';
import 'package:provider/provider.dart';
import 'auth/login_or_register.dart';
import 'theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: '/', // Set initial route to '/'
      routes: {
        '/': (context) => SplashScreen(), // Splash screen as initial route
        '/login': (context) => LoginOrRegister(), // Login or Register page
        // Add more routes as needed
      },
    );
  }
}
