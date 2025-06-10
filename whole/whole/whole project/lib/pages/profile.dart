import 'package:flutter/material.dart';
import 'package:grad_project/pages/categories.dart';
import 'package:grad_project/pages/edit_profile.dart';
import 'package:grad_project/pages/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:grad_project/pages/loginscreen.dart' as lgscreen;

void main() {
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String profileImagePath = 'assets/images/prof-removebg-preview.png';
  String username = 'Loading...';
  String email = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/registers/'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        // Assuming the logged-in user's data is the last entry in the list
        final user = data.firstWhere((user) => user['username'] == lgscreen.result_name_profile); // Replace 'current_user' with actual username
        setState(() {
          username = user['username'];
          email = user['email'];
        });
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      setState(() {
        username = 'Guest';
        email = 'Guest';
      });
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10), // Adjust top spacing
          // Centering profile image and name
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(profileImagePath),
                ),
                const SizedBox(height: 8),
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF432C81),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          // Profile details section
          _buildProfileSection(screenWidth, context),
          const Spacer(),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }

  Widget _buildProfileSection(double screenWidth, BuildContext context) {
    return Container(
      width: screenWidth * 0.9,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Ensure smooth edges like the image
      ),
      child: Column(
        children: [
          _buildProfileItem('Username', username, context),
          const Divider(height: 1, color: Colors.black26), // Thin divider
          _buildProfileItem('Email', email, context),
          const Divider(height: 1, color: Colors.black26), // Thin divider
        ],
      ),
    );
  }

  Widget _buildProfileItem(String title, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10), // Adjusted spacing
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF432C81),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              // Navigate to EditProfile page when the arrow is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()),
              );
            },
            child: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
          ), // Clickable arrow
        ],
      ),
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Image.asset('assets/images/home vector.png', width: 24, height: 24),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          IconButton(
            icon: Image.asset('assets/images/category.png', width: 24, height: 24),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Categories()),
              );
            },
          ),
          Container(
            width: screenWidth * 0.16,
            height: screenWidth * 0.16,
            decoration: const BoxDecoration(
              color: Color(0xFF00D2FF),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Image.asset('assets/images/profile.png', width: 24, height: 24),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}