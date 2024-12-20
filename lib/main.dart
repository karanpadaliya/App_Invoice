import 'package:flutter/material.dart';
import 'package:invoice_app/Screen/SplashScreen.dart';
import 'package:invoice_app/Screen/add_invoice.dart';
import 'package:invoice_app/Screen/home_page.dart';
import 'package:invoice_app/Screen/my_pdf_view.dart';

void main() {
  runApp(const MyApp());
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
        "/": (context) => const SplashScreen(),
        "home": (context) => const Home_Page(),
        "invoice": (context) => const AddInvoice(),
        "mypdf": (context) => const MyPdfView(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
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
