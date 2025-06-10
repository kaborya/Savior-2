import 'package:flutter/material.dart';
import 'package:grad_project/pages/categories.dart';
import 'package:grad_project/pages/home.dart';
import 'package:grad_project/pages/otcmedications.dart';
import 'package:grad_project/pages/panadol.dart';
import 'package:grad_project/pages/profile.dart';
import 'package:grad_project/pages/aspirin.dart';
import 'package:grad_project/pages/brufen.dart';
import 'package:grad_project/pages/megafen.dart';

void main() {
  runApp(Painkillerslist());
}

class Painkillerslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FluScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FluScreen extends StatelessWidget {
  final List<Map<String, String>> medicineList = [
    {
      'name': 'Aspirin',
      'image': 'assets/images/aspirin.jpg',
    },
    {
      'name': 'Brufen',
      'image': 'assets/images/brufen.jpg',
    },
    {
      'name': 'Megafen',
      'image': 'assets/images/megafen.jpg',
    },
    {
      'name': 'Panadol Extra',
      'image': 'assets/images/panadol extra.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double frameWidth = 280.0;
    final double frameHeight = 130.0;

    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 15.5, top: 25),
            child: Container(
              width: 40,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFFF7F7F7),
                border: Border.all(color: Color(0xFFEDEDED), width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Image.asset('assets/images/Vector 2.png', width: 24, height: 24),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Otcmedications()),
                  );
                },
              ),
            ),
          ),
          title: Transform.translate(
            offset: Offset(0, 15),
            child: SizedBox(
              width: 164,
              height: 45,
              child: Center(
                child: Text(
                  'Pain Killers',
                  style: TextStyle(
                    color: Color(0xFF432C81),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'Raleway',
                  ),
                ),
              ),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          itemCount: medicineList.length,
          itemBuilder: (context, index) {
            final medicine = medicineList[index];
            return medicineCard(
              frameWidth,
              frameHeight,
              medicine['name']!,
              medicine['image']!,
              context, // Pass the context to the card
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }

  Widget medicineCard(double width, double height, String medicineName, String imagePath, BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(bottom: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 119,
            height: 116,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    medicineName,
                    style: TextStyle(
                      color: Color(0xFF432C81),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Widget page;
                          switch (medicineName) {
                            case 'Aspirin':
                              page = Aspirin();
                              break;
                            case 'Brufen':
                              page = Brufen();
                              break;
                            case 'Megafen':
                              page = Megafen();
                              break;
                            case 'Panadol Extra':
                              page = Panadol();
                              break;
                            default:
                              page = Scaffold(
                                appBar: AppBar(title: Text("Not Found")),
                                body: Center(child: Text("Page not implemented")),
                              );
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => page),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF00D2FF),
                          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'More Details',
                          style: TextStyle(color: Color(0xFF432C81), fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
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
              icon: Image.asset(
                'assets/images/category.png',
                width: 24,
                height: 24,
              ),
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
            icon: Image.asset(
              'assets/images/profile.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
            },
          ),
        ],
      ),
    );
  }
}

