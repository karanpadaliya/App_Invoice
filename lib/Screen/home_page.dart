import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int bottom = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xff234f9d),
        title: const Text(
          "Invoice App",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.person,
              size: 27,
            ),
          ),
        ],
        elevation: 2,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(context, "invoice");
          Navigator.pushNamed(context, "mypdf");
        },
        splashColor: const Color(0xff234f9d),
        backgroundColor: const Color(0xff234f9d),
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 15, right: 120),
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Manage your ",
                      style: TextStyle(color: Colors.black, fontSize: 27),
                    ),
                    TextSpan(
                      text: " Bills\n",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "with",
                      style: TextStyle(color: Colors.black, fontSize: 27),
                    ),
                    TextSpan(
                      text: " One",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "  hand",
                      style: TextStyle(color: Colors.black, fontSize: 27),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIconColor: Color(0xff234f9d),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Color(0xff234f9d),
                ),
                focusColor: Color(0xff234f9d),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Container(
            //All invoice show here
            height: 550,
            width: 400,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "asstes/images/open_box.png",
                    width: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        "No Invoice + Create New Invoice",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
