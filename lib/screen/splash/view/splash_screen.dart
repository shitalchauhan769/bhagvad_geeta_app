import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, "home"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset("assets/image/img.jpeg", fit: BoxFit.fill),
            ),
          ),
          Container(
            child: Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: Colors.black54,
            ),
          ),


          const Center(
            child: Text(
              "|| श्री भगवद् गीता ||",
              style: TextStyle(fontSize: 40, color: Colors.white,fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
