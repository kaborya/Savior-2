import 'package:flutter/material.dart';
import 'package:grad_project/pages/diseaseprediction.dart';
import 'package:grad_project/pages/doctorscategories.dart';
import 'package:grad_project/pages/firstaid.dart';
import 'package:grad_project/pages/home.dart';
import 'package:grad_project/pages/otcmedications.dart';
import 'package:grad_project/pages/profile.dart';


class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.09),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 328,
                height: 32,
                child: Text(
                  'Our Services',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1.33,
                    letterSpacing: -0.5,
                    color: const Color(0xFF432C81),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: ListView(
                children: [
                  CategoryCard(
                    title: ['First Aid'],
                    imagePath: 'assets/images/firstaid.png',
                    imagePaddingTop: 10.0,
                    onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Firstaid()),
                        );
                    },
                  ),
                  CategoryCard(
                    title: ['OTC', 'Medication'],
                    imagePath: 'assets/images/7.png',
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OtcMedicationsScreen()),
                        );
                    },
                  ),
                  CategoryCard(
                    title: ['Disease', 'Prediction'],
                    imagePath: 'assets/images/4.png',
                    onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DiseasePredictionScreen()),
                        );
                    },
                  ),
                  CategoryCard(
                    title: ['Doctors'],
                    imagePath: 'assets/images/doctors.png',
                    onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Doctorscategories()),
                        );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final List<String> title;
  final String imagePath;
  final double imagePaddingTop;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    this.imagePaddingTop = 0.0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint("Tapped on ${title.join(" ")}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Tapped on ${title.join(" ")}")),
        );
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: 308,
          height: 121,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF00D2FF).withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: title
                      .map((text) => Text(
                            text,
                            style: const TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                              letterSpacing: -0.5,
                              color: Color(0xFF432C81),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: imagePaddingTop),
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    imagePath,
                    width: 144,
                    height: 108,
                  ),
                ),
              ),
            ],
          ),
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
            icon: Image.asset('assets/images/home vector.png', width: 24, height: 24),
            onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );},
          ),
          Container(
            width: screenWidth * 0.16,
            height: screenWidth * 0.16,
            decoration: const BoxDecoration(color: Color(0xFF00D2FF), shape: BoxShape.circle),
            child: IconButton(
              icon: Image.asset('assets/images/category.png', width: 24, height: 24),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
          IconButton(
            icon: Image.asset('assets/images/profile.png', width: 24, height: 24),
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
