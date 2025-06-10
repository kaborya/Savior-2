import 'package:flutter/material.dart';
import 'package:grad_project/pages/Ophthalmologistlist.dart';
import 'package:grad_project/pages/Orthopedistlist.dart';
import 'package:grad_project/pages/cardiologistslist.dart';
import 'package:grad_project/pages/categories.dart';
import 'package:grad_project/pages/dentistslist.dart';
import 'package:grad_project/pages/generalsurgerylist.dart';
import 'package:grad_project/pages/internallist.dart';
import 'package:grad_project/pages/home.dart';
import 'package:grad_project/pages/pediatricianlist.dart';
import 'package:grad_project/pages/profile.dart';

class Doctorscategories extends StatelessWidget {
  const Doctorscategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(8, 30, 8, 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // 👈 Back button now works
                    },
                    child: Image.asset(
                      'assets/images/Vector 2.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 28),
                        child: Text(
                          'Doctors Categories',
                          style: TextStyle(
                            color: const Color(0xFF432C81),
                            fontSize: 18,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Divider
            Container(
              margin: const EdgeInsets.only(top: 7),
              height: 1.5,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF9E9E9E),
                  width: 1,
                ),
              ),
            ),

            // Categories List
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildClickableCategory(context, 'Internal medicine', 'assets/images/internal.png', Internallist()),
                  _buildDivider(),
                  _buildClickableCategory(context, 'Ophthalmologist', 'assets/images/eye.png', Ophthalmologistlist()),
                  _buildDivider(),
                  _buildClickableCategory(context, 'Orthopedist', 'assets/images/leg.png', Orthopedistlist()),
                  _buildDivider(),
                  _buildClickableCategory(context, 'Dentist', 'assets/images/tooth.png', Dentistslist()),
                  _buildDivider(),
                  _buildClickableCategory(context, 'Pediatrician', 'assets/images/baby.png', Pediatricianlist()),
                  _buildDivider(),
                  _buildClickableCategory(context, 'Cardiologist', 'assets/images/cardi.png', Cardiologistslist()),
                  _buildDivider(),
                  _buildClickableCategory(context, 'General surgery', 'assets/images/surgery.png', Generalsurgerylist()),
                  _buildDivider(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }

  Widget _buildClickableCategory(BuildContext context, String title, String imageUrl, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page), // Navigate to the corresponding page
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imageUrl,
                    width: 65,
                    height: 55,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF432C81),
                    fontSize: 18,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.24,
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/images/Vector 4.png',
              width: 28,
              height: 28,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      height: 1.5,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF9E9E9E),
          width: 1,
        ),
      ),
    );
  }
}


class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: screenHeight * 0.1,
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
            icon: Image.asset(
              'assets/images/home vector.png',
              width: 24,
              height: 24,
            ),
            onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );},
          ),
          Container(
            width: screenWidth * 0.16,
            height: screenWidth * 0.16,
            decoration: const BoxDecoration(
              color: Color(0xFF00D2FF),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Image.asset(
                'assets/images/category.png',
                width: 24,
                height: 24,
              ),
              color: Colors.white,
              onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Categories()),
                );},
            ),
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/profile.png',
              width: 24,
              height: 24,
            ),
            onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );},
          ),
        ],
      ),
    );
  }
}
