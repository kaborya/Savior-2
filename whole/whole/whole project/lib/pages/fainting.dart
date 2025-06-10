import 'package:flutter/material.dart';
import 'package:grad_project/pages/categories.dart';
import 'package:grad_project/pages/firstaid.dart';
import 'package:grad_project/pages/home.dart';
import 'package:grad_project/pages/profile.dart';

void main() => runApp(const Fainting());

class Fainting extends StatelessWidget {
  const Fainting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SunburnScreen(),
    );
  }
}

class SunburnScreen extends StatelessWidget {
  const SunburnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                      icon: Image.asset(
                        'assets/images/Vector 2.png',
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.arrow_back, color: Colors.grey);
                        },
                      ),
                      onPressed: () {
                            Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Firstaid()), // navigate back to firstaid page
                      );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Fainting",
                        style: TextStyle(
                          color: Color(0xFF432C81),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Image.asset(
                        'assets/images/fainting2.jpg',
                        height: 150,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image, size: 100, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "OVERVIEW",
                            style: TextStyle(
                              color: Color(0xFF432C81),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Fainting occurs when the brain doesn't receive enough blood for a brief time. This causes loss of consciousness. Consciousness is usually regained quickly.",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "TREATMENT",
                            style: TextStyle(
                              color: Color(0xFF432C81),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TreatmentDropdown(
                            title: "1 -Check for a pulse and to see if the person is breathing.",
                            description: "-If the person is not breathing, begin CPR.",
                          ),
                          TreatmentDropdown(
                            title: "2 -Position the person on the back.",
                            description: "",
                          ),
                          TreatmentDropdown(
                            title: "3 -raise the person's legs above heart level if possible.",
                            description:
                                "",
                          ),
                          TreatmentDropdown(
                            title: "4 -Loosen belts, collars or other tight clothing.",
                            description: "",
                          ),
                          TreatmentDropdown(
                            title: "5 - don't get the person up too fast.",
                            description: "",
                          ),
                       
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}

class TreatmentDropdown extends StatefulWidget {
  final String title;
  final String description;

  const TreatmentDropdown({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  _TreatmentDropdownState createState() => _TreatmentDropdownState();
}

class _TreatmentDropdownState extends State<TreatmentDropdown> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Color(0xFF432C81),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(
          _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: const Color(0xFF432C81),
        ),
        onExpansionChanged: (value) {
          setState(() {
            _isExpanded = value;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.description,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
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
            icon: Image.asset('assets/images/home vector.png', width: 24, height: 24),
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
              icon: Image.asset('assets/images/category.png', width: 24, height: 24),
              color: Colors.white,
              onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Categories()),
                );},
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
