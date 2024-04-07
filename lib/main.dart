import 'package:flutter/material.dart';
import 'package:invoice_app/Screen/SplashScreen.dart';
import 'package:invoice_app/Screen/home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "home": (context) => Home_Page(),
        // "contactInfo": (context) => ContactPage(),
        // "personalDetails": (context) => PersonalDetails(),
        // "carrierObjective": (context) => CarrierObjective(),
        // "eduction": (context) => Eduction(),
        // "experiences": (context) => Experiences(),
        // "technicalSkill": (context) => TechnicalSkills(),
        // "achievement": (context) => Achievement(),


      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                "onUnknownRoute",
                style: TextStyle(fontSize: 50, color: Colors.black),
              ),
            ),
          ),
        );
      },
    );
  }
}