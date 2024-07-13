import 'dart:async';
import 'package:flutter/material.dart';
import 'package:m2pfintech_task/view/video_list_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 03),
      () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => VideoListScreen())),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 175,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://static.vecteezy.com/system/resources/previews/013/218/859/non_2x/music-tree-logo-design-music-and-eco-symbol-or-icon-music-note-icon-combine-with-tree-shape-icon-vector.jpg"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Text(
            "Musical Vibes",
            style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
