import 'package:flutter/material.dart';
import 'package:lakleko/models/lisa_login_model.dart';
import 'package:lakleko/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => LisaLoginModel(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // navigateAfterSeconds: LoginScreen(),
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lisa Todo App',
      theme: ThemeData(
        primaryColor: Color(0xFF426E6D),
        accentColor: Color(0xFF426E6D),
      ),
      home: MySplashScreen(),
    );
  }
}

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: LoginScreen(),
      title: Text(
        'Ajouter vos notes et enregistrez-les dans votre poche',
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w500,
          fontSize: 22,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.white,
      loaderColor: Colors.blue.shade200,
    );
  }
}
