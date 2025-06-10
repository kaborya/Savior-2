import 'package:flutter/material.dart';
import 'package:grad_project/pages/landing.dart';

void main() {
  runApp(Saviorscreen());
}

// This is your splash screen
class Saviorscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SaviorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SaviorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 360,
              height: 800,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/savior3.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 660,
            left: 145,
            child: Opacity(
              opacity: 1.0,
              child: Container(
                width: 69,
                height: 69,
                decoration: BoxDecoration(
                  color: Color(0xFF00D2FF),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Image.asset('assets/images/Vector.png'),
                  iconSize: 30,
                  onPressed: () {
                    // Navigate to the Landing screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Landing()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

