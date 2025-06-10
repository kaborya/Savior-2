import 'package:flutter/material.dart';
import 'package:grad_project/pages/home.dart';
import 'sign_up.dart'; // Make sure to import the SignUp page.
import 'loginscreen.dart';

void main() {
  runApp(Landing());
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/signUp': (context) => SignUp(), // Navigate to the SignUp page when the button is clicked
        '/login': (context) => LoginScreen(),
      },
      home: SaviorScreen(),
    );
  }
}

class SaviorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7), // Background color
      body: SafeArea(
        child: Scrollbar( // Add a Scrollbar
          thumbVisibility: true, // Makes the scrollbar always visible
          child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Skip Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to Home screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600, // Semibold font weight
                          color: Color(0xFF432C81), // Skip text color
                        ),
                      ),
                    ),
                  ),
                ),

                // Title and Illustration
                Column(
                  children: [
                    // Title
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Savior',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF432C81), // Title color
                        ),
                      ),
                    ),
                    // Illustration
                    Image.asset(
                      'assets/images/landing.png', // Replace with your image asset path
                      width: double.infinity,
                      fit: BoxFit.cover, // Ensures the image fills the width
                    ),
                  ],
                ),

                // Subtitle and Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      // Subtitle
                      Text(
                        'Your health is our\nmission', // Wrapped to two lines
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24, // Increased font size
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway', // Raleway font
                          color: Color(0xFF432C81), // Subtitle color
                        ),
                      ),
                      SizedBox(height: 32),
                      // Create Account Button (smaller width)
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the SignUp page (using the '/signUp' route)
                          Navigator.pushNamed(context, '/signUp');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF00D2FF), // Button background color
                          minimumSize: Size(250, 50), // Smaller width
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48.0), // Button radius
                          ),
                        ),
                        child: Text(
                          'Create a free account',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500, // Inter Medium font weight
                            fontFamily: 'Inter', // Inter font
                            color: Color(0xFF432C81), // Button text color
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      // "Have an account?" and "Log in" next to each other
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account? ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF432C81), // "Have an account?" text color
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigate to login page
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF00D2FF), // "Log in" text color
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16), // Adjust bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }
}