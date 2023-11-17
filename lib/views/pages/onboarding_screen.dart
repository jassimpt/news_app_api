import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_buddy/views/pages/homescreen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Image.asset(
                  'assets/images/building.jpg',
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'News from around the',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'world for you',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Best time to read,take your time to read',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 144, 144, 144)),
          ),
          const Text(
            'a little more of this world',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 144, 144, 144)),
          ),
          const SizedBox(
            height: 45,
          ),
          const SpinKitFadingCube(
            color: Colors.blue,
            size: 20,
          )
        ],
      ),
    );
  }
}
