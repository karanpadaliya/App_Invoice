import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(
      Duration(seconds: 3),
          () {
        // Navigator.pushNamed(context, "home");
        Navigator.pushReplacementNamed(context, "home");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xff234f9d),
        systemNavigationBarColor: Color(0xff234f9d),
        systemNavigationBarDividerColor: Color(0xff234f9d),
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff674aef).withOpacity(0.05),
        ),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "asstes/images/logo.png",
                height: 180,
                width: 180,
                // color: Colors.white,
              ),
              SizedBox(
                height: 100,
              ),
              // Loding here
              Text("Manage your bills\n    with one hand",
                style: TextStyle(
                  // color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20  ,
                ),),
            ],
          ),
        ),
      ),
    );
  }
}