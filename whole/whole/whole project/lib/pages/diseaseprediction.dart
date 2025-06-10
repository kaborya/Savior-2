import 'package:flutter/material.dart';
import 'package:grad_project/pages/categories.dart';
import 'package:grad_project/pages/home.dart';
import 'package:grad_project/pages/profile.dart';
import 'package:grad_project/pages/result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DiseasePredictionScreen extends StatefulWidget {
  @override
  _DiseasePredictionScreenState createState() => _DiseasePredictionScreenState();
}

class _DiseasePredictionScreenState extends State<DiseasePredictionScreen> {
  List<String> symptoms = [
    " belly_pain", " drying_and_tingling_lips", " anxiety", " continuous_sneezing", " pain_during_bowel_movements", " throat_irritation", " burning_micturition", " watering_from_eyes", " pain_behind_the_eyes", " unsteadiness", " dischromic _patches", " movement_stiffness", " joint_pain", " skin_rash", " yellowish_skin", " abdominal_pain", " weight_gain", " indigestion", " dark_urine", " fatigue", " back_pain", " distention_of_abdomen", " ulcers_on_tongue", " increased_appetite", " slurred_speech", " irregular_sugar_level", " yellow_crust_ooze", " muscle_wasting", " polyuria", " visual_disturbances", " yellow_urine", " sunken_eyes", " muscle_weakness", " irritability", " weakness_of_one_body_side", " loss_of_balance", " stomach_pain", " obesity", " sweating", " redness_of_eyes", " small_dents_in_nails", " high_fever", " scurring", " congestion", " fast_heart_rate", " weakness_in_limbs", " fluid_overload", " receiving_unsterile_injections", " loss_of_appetite", " chest_pain", " chills", " internal_itching", " prominent_veins_on_calf", " shivering", " yellowing_of_eyes", " inflammatory_nails", " palpitations", " passage_of_gases", " blood_in_sputum", " patches_in_throat", " swollen_blood_vessels", " pain_in_anal_region", " bruising", " puffy_face_and_eyes", " vomiting", " mucoid_sputum", " bladder_discomfort", " blackheads", " mood_swings", " phlegm", " altered_sensorium", " stomach_bleeding", " cough", " depression", " nausea", " hip_joint_pain", " restlessness", " brittle_nails", " lethargy", " breathlessness", " painful_walking", " acute_liver_failure", " knee_pain", " foul_smell_of urine", " diarrhoea", " loss_of_smell", " silver_like_dusting", " history_of_alcohol_consumption", " swelling_joints", "itching", " sinus_pressure", " excessive_hunger", " red_spots_over_body", " swelling_of_stomach", " mild_fever", " receiving_blood_transfusion", " swelled_lymph_nodes", " malaise", " extra_marital_contacts", " continuous_feel_of_urine", " constipation", " red_sore_around_nose", " dehydration", " dizziness", " family_history", " abnormal_menstruation", " lack_of_concentration", " neck_pain", " irritation_in_anus", " headache", " bloody_stool", " spinning_movements", " acidity", " runny_nose", " nodal_skin_eruptions", " enlarged_thyroid", " toxic_look_(typhos)", " swollen_legs", " skin_peeling", " cramps", " blister", " spotting_ urination", " weight_loss", " stiff_neck", " muscle_pain", " rusty_sputum", " cold_hands_and_feets", " blurred_and_distorted_vision", " pus_filled_pimples", " swollen_extremeties", " coma"
  ];
  
  Map<String, bool> selectedSymptoms = {};
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    symptoms.forEach((symptom) => selectedSymptoms[symptom] = false);
    searchController.addListener(() {
      setState(() {}); // Refresh when search input changes
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<List<dynamic>> predictDisease(List<String> symptoms) async {
    const String apiUrl = 'http://127.0.0.1:8000/predict_disease/';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'symptoms': symptoms}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get prediction');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredSymptoms = symptoms
        .where((symptom) =>
            symptom.toLowerCase().contains(searchController.text.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button with image
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Categories()), // navigate to categories page
                    );
                  },
                  child: Image.asset(
                    'assets/images/Vector 2.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Choose Your Symptoms...",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF432C81),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Search bar
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search symptoms...",
                prefixIcon: Icon(Icons.search, color: Color(0xFF432C81)),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: filteredSymptoms.map((symptom) {
                  return CheckboxListTile(
                    title: Text(symptom),
                    value: selectedSymptoms[symptom],
                    activeColor: Color(0xFF00D2FF),
                    checkColor: Color(0xFF432C81),
                    onChanged: (bool? value) {
                      setState(() {
                        selectedSymptoms[symptom] = value!;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          final selected = selectedSymptoms.entries
                              .where((entry) => entry.value)
                              .map((entry) => entry.key)
                              .toList();

                          if (selected.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please select at least one symptom'),
                              ),
                            );
                            return;
                          }

                          setState(() => isLoading = true);

                          try {
                            final predictions = await predictDisease(selected);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ResultScreen(predictions: predictions),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: $e')),
                            );
                          } finally {
                            setState(() => isLoading = false);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF00D2FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Result",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF432C81),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Image.asset('assets/images/home vector.png', width: 24, height: 24),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF00D2FF),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Image.asset('assets/images/category.png', width: 24, height: 24),
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
            icon: Image.asset('assets/images/profile.png', width: 24, height: 24),
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
