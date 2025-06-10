import 'package:flutter/material.dart';
import 'package:grad_project/pages/categories.dart';
import 'package:grad_project/pages/home.dart';
import 'package:grad_project/pages/pediatricianidris.dart';
import 'package:grad_project/pages/pediatricianihab.dart';
import 'package:grad_project/pages/pediatricianismael.dart';
import 'package:grad_project/pages/pediatricianmohamed.dart';
import 'package:grad_project/pages/profile.dart';

void main() {
  runApp(MaterialApp(home: Pediatricianlist()));
}

class Pediatricianlist extends StatelessWidget {
  @override

    Widget build(BuildContext context) {
     final List<Map<String, String>> doctors = [
      {'name': 'Dr. Mohammed Najm', 'specialty': 'Pediatrician', 'experience': '2 years'},
      {'name': 'Dr. Ismail Lotfy \n Muhammad', 'specialty': 'Pediatrician', 'experience': '5 years'},
      {'name': 'Dr. Ihab Boutros', 'specialty': 'Pediatrician', 'experience': '8 years'},
      {'name': 'Dr. Idris Hassan', 'specialty': 'Pediatrician', 'experience': '3 years'},
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFFF7F7F7),
        body: Stack(
          children: [
            Container(color: Color(0xFFF7F7F7)),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                           Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 234, 234, 234),
                              width: 1),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: IconButton(
                            icon: Image.asset(
                              'assets/images/Vector 2.png', // Back button image
                              width: 24,
                              height: 24,
                              color: const Color(0xFF432C81),
                            ),
                            onPressed: () {
                              Navigator.pop(context); // Back navigation
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Pediatrician',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF432C81),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(16.0),
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: Color(0xFFD9D9D9), width: 1.5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage('assets/images/male.png'),
                                  ),
                                  SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(doctors[index]['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
                                      SizedBox(height: 4),
                                      Text(doctors[index]['specialty']!, style: TextStyle(color: Color(0xFF432C81))),
                                      SizedBox(height: 4),
                                      Text(doctors[index]['experience']!, style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  String name = doctors[index]['name']!;
                                  if (name.contains('Mohamed')) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Pediatricianmohamed()));
                                  } else if (name.contains('Ismail')) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Pediatricianismael()));
                                  } else if (name.contains('Ihab')) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Pediatricianihab()));
                                  } else if (name.contains('Idris')) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Pediatricianidris()));
                                  }
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF00D2FF),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.arrow_forward, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBarWidget(),
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
              onPressed: () {Navigator.push(
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
