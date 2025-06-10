import 'package:flutter/material.dart';
import 'package:grad_project/pages/categories.dart';
import 'package:grad_project/pages/home.dart';
import 'package:grad_project/pages/profile.dart';

void main() {
  runApp(Feroglobin());
}

class Feroglobin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth <= 640;
    final containerWidth = isSmallScreen ? screenWidth : 360.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SizedBox(
        width: containerWidth,
        height: isSmallScreen ? MediaQuery.of(context).size.height : 800.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------- APP BAR SECTION ---------------- //
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 37, 20, 0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Custom Back Button with Border
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFEDEDED)),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context); // Go back
                        },
                        icon: Image.asset(
                          'assets/images/vector 2.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                  // Page Title
                  const Text(
                    'Feroglobin',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF432C81),
                    ),
                  ),
                ],
              ),
            ),

            // ---------------- CONTENT SECTION ---------------- //
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 15 : 26,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Medicine Image (Smaller size)
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/feroglobin.jpg',
                        width: isSmallScreen ? 270 : 70,
                        height: isSmallScreen ? 200 : 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Medicine Name Box
                  Transform.translate(
                    offset: const Offset(0, -10),
                    child: Container(
                      width: isSmallScreen ? double.infinity : 290,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF00D2FF), Color(0xFFF7F7F7)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.04),
                            blurRadius: 16,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const Text(
                        'Feroglobin',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF432C81),
                        ),
                      ),
                    ),
                  ),

                  // About Medicine
                  const SizedBox(height: 20),
                  _buildSectionTitle('About Drug'),
                  _buildDescription(
                      'Feroglobin contains a combination of minerals such as zinc, iron, and copper, and vitamins such as vitamins B6, B12, and folic acid.'),

                  // Side Effects
                  const SizedBox(height: 40),
                  _buildSectionTitle('Side Effects'),
                  _buildDescription(
                      'The following symptoms are rare, some people may experience:'),

                  // Additional Info
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoItem('1-Digestive system: constipation, diarrhea, upset stomach'),
                      _buildInfoItem('2-Other symptoms: Mild nausea that may go away with time'),
                     
              
                     

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ---------------- BOTTOM NAVIGATION BAR ---------------- //
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon:
                  Image.asset('assets/images/home vector.png', width: 24, height: 24),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF00D2FF),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Image.asset('assets/images/category.png', width: 24, height: 24),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Categories()),
                  );
                },
              ),
            ),
            IconButton(
              icon:
                  Image.asset('assets/images/profile.png', width: 24, height: 24),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- HELPER METHODS ---------------- //
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xFF432C81),
      ),
    );
  }

  Widget _buildDescription(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF878787),
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildInfoItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF878787),
          height: 1.43,
        ),
      ),
    );
  }
}