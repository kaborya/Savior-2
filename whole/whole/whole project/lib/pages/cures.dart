import 'package:flutter/material.dart';

void main() {
  runApp(Cures());
}

class Cures extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: Column(
        children: [
          // Top Back Button & Title
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    'assets/images/Vector 2.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Result',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF432C81),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 24),
              ],
            ),
          ),
          SizedBox(height: 20),
          
          // Center Box (Taller & Moved Up)
          Expanded(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.52,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Disease Tag
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color:  Color(0xFF00D2FF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Common Cold',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF432C81),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Is your potential',
                            style: TextStyle(
                              color: Color(0xFF432C81),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            'disease...',
                            style: TextStyle(
                              color: Color(0xFF432C81),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'risk level',
                              style: TextStyle(
                                
                                color: Color(0xFF432C81),
                              ),
                            ),
                            Text(
                              'doctor',
                              style: TextStyle(
                               
                                color: Color(0xFF432C81),
                              ),
                            ),
                            Text(
                              'cures',
                              style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                color: Color(0xFF432C81),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 2,
                          child: Row(
                            children: [
                              Expanded(
  flex: 1,
  child: Container(color: Color(0xFF9E9E9E)),
),
Expanded(
  flex: 1,
  child: Container(color: Color(0xFF9E9E9E)),
),
Expanded(
  flex: 1,
  child: Container(color: Color(0xFF00D2FF)),
),


                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
Align(
  alignment: Alignment.centerLeft,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '-otc medications',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF432C81),
        ),
      ),
      Text(
        '-rest',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF432C81),
        ),
      ),
      Text(
        '-fluids',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF432C81),
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
          
          // Bottom Icons with Background
          Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF00D2FF),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/home vector.png',
                      width: 30,
                      height: 30,
                    ),
                    Image.asset(
                      'assets/images/category.png',
                      width: 50,
                      height: 50,
                    ),
                    Image.asset(
                      'assets/images/profile.png',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
