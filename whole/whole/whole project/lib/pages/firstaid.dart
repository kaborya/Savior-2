import 'package:flutter/material.dart';
import 'package:grad_project/pages/categories.dart';
import 'package:grad_project/pages/firstaidkit.dart';
import 'package:grad_project/pages/sunburnpage.dart';
import 'package:grad_project/pages/fractures.dart';
import 'package:grad_project/pages/bites.dart';
import 'package:grad_project/pages/cpr.dart';
import 'package:grad_project/pages/poisoning.dart';
import 'package:grad_project/pages/fever.dart';
import 'package:grad_project/pages/choking.dart';
import 'package:grad_project/pages/heartattack.dart';
import 'package:grad_project/pages/fainting.dart';

void main() {
  runApp(Firstaid());
}

class Firstaid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Aid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstAidPage(),
    );
  }
}

class FirstAidPage extends StatefulWidget {
  @override
  _FirstAidPageState createState() => _FirstAidPageState();
}

class _FirstAidPageState extends State<FirstAidPage> {
  final List<Map<String, dynamic>> firstAidItems = [
    {'title': 'First Aid Kit', 'icon': 'assets/images/kit.png', 'page': Firstaidkit()},
    {'title': 'Sunburn', 'icon': 'assets/images/sunburn_12444650 (1).png', 'page': SunburnPage()},
    {'title': 'Fractures', 'icon': 'assets/images/fractures.png', 'page': Fractures()},
    {'title': 'Bites', 'icon': 'assets/images/bites.png', 'page': bites()},
    {'title': 'CPR', 'icon': 'assets/images/cpr.png', 'page': Cpr()},
    {'title': 'Poisoning', 'icon': 'assets/images/poisoning.png', 'page': Poisoning()},
    {'title': 'Fever', 'icon': 'assets/images/fever.png', 'page': Fever()},
    {'title': 'Choking', 'icon': 'assets/images/chock.png', 'page': Choking()},
    {'title': 'Heart Attack', 'icon': 'assets/images/attack.png', 'page': Heartattack()},
    {'title': 'Fainting', 'icon': 'assets/images/faint.png', 'page': Fainting()},
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter the items based on the search query
    final filteredItems = firstAidItems
        .where((item) => item['title']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7), // Background color
      body: Stack(
        children: [
          // Title and back button without a white background
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              children: [
                // Back button icon with container around it
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: IconButton(
                    icon: Image.asset('assets/images/Vector 2.png'),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Categories()), // Navigate to Categories
                      );
                    },
                  ),
                ),
                Spacer(),
                // Title "First Aid"
                Text(
                  'First Aid',
                  style: TextStyle(
                    color: Color(0xFF432C81),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
          // Search bar
          Positioned(
            top: 100,
            left: 16,
            child: Container(
              width: 328,
              height: 44,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 16,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value; // Update the search query
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search here...',
                        hintStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Cards grid
          Padding(
            padding: const EdgeInsets.only(top: 170.0),
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 159 / 187,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return FirstAidCard(
                  title: filteredItems[index]['title']!,
                  iconPath: filteredItems[index]['icon']!,
                  page: filteredItems[index]['page']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FirstAidCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final Widget page;

  const FirstAidCard({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(9),
        ),
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 117,
            height: 83,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF432C81),
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              // Directly navigate to the page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF00D2FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'See what to do',
              style: TextStyle(
                color: Color(0xFF432C81),
              ),
            ),
          ),
        ],
      ),
    );
  }
}