import 'package:flutter/material.dart';
import 'package:grad_project/pages/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
var result_name_profile;
void main() {
  runApp(LoginScreen()); //  Run the main app class
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Future<List<dynamic>> futureData;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Color titleColor = Color(0xFF432C81);
  final Color inputLabelColor = Color(0xFF432C81);
  final Color buttonTextColor = Color(0xFF432C81);
  final Color buttonColor = Color(0xFF00CFFF);

  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<List<dynamic>> fetchData() async {
    try {
      print('Fetching data...');
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/registers/'));

      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('Response received: ${response.body}');
        List jsonResponse = json.decode(response.body);
        print('Decoded JSON: $jsonResponse');
        return jsonResponse;
      } else {
        print('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('An error occurred while fetching data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.pop(
                    context); // 👈 Goes back if there's a previous screen
              },
              child: Image.asset(
                'assets/images/Vector 2.png',
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Log in",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "username",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: inputLabelColor,
              ),
            ),
            TextField(
              controller: nameController, // Use the controller
              decoration: const InputDecoration(
                hintText: "Enter your username ",
                hintStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            Text(
              "Password",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: inputLabelColor,
              ),
            ),
            TextField(
              controller: passwordController, // Use the controller
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: const TextStyle(color: Colors.grey),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  List<dynamic> users = await futureData;
                  bool loginSuccessful = false;

                  for (var user in users) {
                    if (nameController.text == user['username'] &&
                        passwordController.text == user['password']) {
                      loginSuccessful = true;
                      break;
                    }
                  }

                  if (loginSuccessful) {
                    result_name_profile = nameController.text;
                    print('Login successful for user: $result_name_profile');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('login successful'),
                      ),
                      
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('login failed'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: buttonTextColor,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
