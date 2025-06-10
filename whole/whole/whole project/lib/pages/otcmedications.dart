import 'package:flutter/material.dart';
import 'package:grad_project/pages/abdominallist.dart';
import 'package:grad_project/pages/categories.dart';
import 'package:grad_project/pages/dryeyelist.dart';
import 'package:grad_project/pages/feverlist.dart';
import 'package:grad_project/pages/flulist.dart';
import 'package:grad_project/pages/headachelist.dart';
import 'package:grad_project/pages/nutrilist.dart';
import 'package:grad_project/pages/painkillerslist.dart';
import 'package:grad_project/pages/vomittinglist.dart';

void main() {
  runApp(Otcmedications());
}

class Otcmedications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OtcMedicationsScreen(),
    );
  }
}

class OtcMedicationsScreen extends StatelessWidget {
  final List<Map<String, String>> medications = [
    {"label": "Pain Killers", "iconPath": "assets/images/pain.png"},
    {"label": "Headache", "iconPath": "assets/images/headache.png"},
    {"label": "Fever", "iconPath": "assets/images/fever.png"},
    {"label": "Flu", "iconPath": "assets/images/flu.png"},
    {"label": "Vomiting", "iconPath": "assets/images/vomiting.png"},
    {"label": "Abdominal Pain", "iconPath": "assets/images/stomachache.png"},
    {"label": "Dry Eye", "iconPath": "assets/images/6.png"},
    {"label": "Nutritional supplements", "iconPath": "assets/images/7.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F7F7),
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/Vector 2.png',
            color: Color(0xFF432C81),
            height: 24,
            width: 24,
          ),
          onPressed: () {
              Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Categories()), //navigate to categories page
                      );
          },
        ),
        title: Text(
          'Otc Medications',
          style: TextStyle(
            color: Color(0xFF432C81),
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: medications.map((med) {
                  return MedicationCard(
                    label: med['label']!,
                    iconPath: med['iconPath']!,
                    onTap: () {
                      Widget destination;

                      switch (med['label']) {
                        case 'Pain Killers':
                          destination = Painkillerslist();
                          break;
                        case 'Headache':
                          destination = Headachelist();
                          break;
                        case 'Fever':
                          destination = Feverlist();
                          break;
                        case 'Flu':
                          destination = Flulist();
                          break;
                        case 'Vomiting':
                          destination = Vomittinglist();
                          break;
                        case 'Abdominal Pain':
                          destination = Abdominallist();
                          break;
                        case 'Dry Eye':
                          destination = Dryeyelist();
                          break;
                        case 'Nutritional supplements':
                          destination = Nutrilist();
                          break;
                        default:
                          destination = Scaffold(
                            appBar: AppBar(title: Text("Page not found")),
                            body: Center(child: Text("No page found for ${med['label']}")),
                          );
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => destination,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MedicationCard extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onTap;

  MedicationCard({required this.label, required this.iconPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, height: 50, width: 50),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF432C81),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}



