import 'package:flutter/material.dart';
import 'package:grad_project/pages/categories.dart';
import 'package:grad_project/pages/landing.dart';
import 'package:grad_project/pages/profile.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Color(0xFF00D2FF),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.back_hand),
            onPressed: () {
             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Landing()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFF7F7F7),
      bottomNavigationBar: BottomNavigationBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF432C81),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Features",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF432C81),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 172,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 0),
                  children: [
                    FeatureCard(
                      title: "",
                      imagePath: 'assets/images/offline.png',
                      color: Colors.blue,
                    ),
                    FeatureCard(
                      title: "",
                      imagePath: 'assets/images/care.png',
                      color: Colors.lightBlue,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Our Services",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF432C81),
                ),
              ),
              SizedBox(height: 10),
              DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Color(0xFF432C81),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                          color: Color(0xFF00D2FF),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        labelPadding: EdgeInsets.symmetric(horizontal: 1),
                        isScrollable: true,
                        tabs: [
                          CustomTab(text: "First Aid", width: 80),
                          CustomTab(text: "OTC Medications", width: 140),
                          CustomTab(text: "Disease Prediction", width: 140),
                          CustomTab(text: "Doctors", width: 80),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 262,
                      child: TabBarView(
                        children: [
                          ServiceCard(
                            title: "We provide clear instructions for urgent situations.",
                            imagePath: 'assets/images/aid.png',
                          ),
                          ServiceCard(
                            title: "Over-the-counter (OTC) medicines are drugs you can buy without a prescription.",
                            imagePath: 'assets/images/otc.png',
                          ),
                          ServiceCard(
                            title: "If you want to know what's wrong with you initially until you visit a doctor, we provide this for you.",
                            imagePath: 'assets/images/disease.png',
                          ),
                          ServiceCard(
                            title: "We provide you with the most famous doctors in most specialties.",
                            imagePath: 'assets/images/doctors2.png',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
          Container(
            width: screenWidth * 0.16,
            height: screenWidth * 0.16,
            decoration: const BoxDecoration(
              color: Color(0xFF00D2FF),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Image.asset(
                'assets/images/home vector.png',
                width: 24,
                height: 24,
              ),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/category.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Categories()),
              );
            },
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

class FeatureCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color color;

  const FeatureCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 264,
      height: 172,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285,
      height: 262,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 200, height: 120, fit: BoxFit.contain),
          SizedBox(height: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xFF432C81),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final String text;
  final double width;

  const CustomTab({Key? key, required this.text, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 41,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}