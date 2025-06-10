import 'package:flutter/material.dart';

void main() {
  runApp(Diseases());
}

class Diseases extends StatelessWidget {
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
      backgroundColor: Color(0xFFF7F7F7), // Set background color to #F7F7F7
      appBar: AppBar(
       backgroundColor: Color(0xFFF7F7F7),
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/images/Vector 2.png', // Path to your custom arrow image
            color: Color(0xFF432C81), // Change color to #432C81 (if the image supports it)
            height: 24, // Adjust height as needed
            width: 24, // Adjust width as needed
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
        title: Text(
          'Otc Medications',
          style: TextStyle(
            color: Color(0xFF432C81), // Change title color to #432C81
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Reduce overall padding
          child: Column(
            children: [
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8, // Decrease spacing between columns
                mainAxisSpacing: 8, // Decrease spacing between rows
                childAspectRatio: 1,
                shrinkWrap: true, // Ensures GridView only takes necessary space
                physics: NeverScrollableScrollPhysics(), // Disables GridView scrolling
                children: medications.map((med) {
                  return MedicationCard(
                    label: med['label']!,
                    iconPath: med['iconPath']!,
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

  MedicationCard({required this.label, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // Set card background color to #FFFFFF
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Set corner radius to 8
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 50, width: 50), // Icon for each medication
          SizedBox(height: 8), // Decrease space below the icon
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF432C81), // Change label color to #432C81
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}