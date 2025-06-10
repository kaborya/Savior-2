import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final List<dynamic> predictions;

  const ResultScreen({required this.predictions, Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String selectedTab = 'risk';
  String? selectedDisease;
  double? selectedConfidence;

  @override
  void initState() {
    super.initState();
    if (widget.predictions.isNotEmpty) {
      selectedDisease = widget.predictions[0][0];
      selectedConfidence = widget.predictions[0][1];
    }
  }

  Widget _buildRiskContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Risk Level Assessment:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 10),
        for (var prediction in widget.predictions)
          ListTile(
            title: Text(prediction[0]),
            subtitle: LinearProgressIndicator(
              value: prediction[1],
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(_getRiskColor(prediction[1])),
            ),
            trailing: Text('${(prediction[1] * 100).toStringAsFixed(1)}%'),
          ),
      ],
    );
  }

  Color _getRiskColor(double confidence) {
    if (confidence > 0.7) return Colors.red;
    if (confidence > 0.4) return Colors.orange;
    return Colors.green;
  }

  Widget _buildDoctorInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended Specialists:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 10),
        Text(
          '• General Physician\n• ${_getSpecialist(selectedDisease)}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  String _getSpecialist(String? disease) {
    if (disease?.toLowerCase().contains('cardiac') ?? false) return 'Cardiologist';
    if (disease?.toLowerCase().contains('respiratory') ?? false) return 'Pulmonologist';
    return 'Internal Medicine Specialist';
  }

  Widget _buildTreatmentInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended Treatments:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 10),
        Text(
          '• Rest and hydration\n• ${_getTreatment(selectedDisease)}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  String _getTreatment(String? disease) {
    if (disease?.toLowerCase().contains('flu') ?? false) return 'Antiviral medication';
    if (disease?.toLowerCase().contains('infection') ?? false) return 'Antibiotics';
    return 'Consult doctor for specific treatment';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prediction Result"),
        backgroundColor: Color(0xFF432C81),
      ),
      backgroundColor: Color(0xFFF7F7F7),
      body: widget.predictions.isEmpty
          ? Center(
              child: Text(
                "No predictions available.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          if (selectedDisease != null)
                            Column(
                              children: [
                                Text(
                                  "Predicted Disease:",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF432C81),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF00D2FF),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    selectedDisease!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF432C81),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Confidence: ${(selectedConfidence! * 100).toStringAsFixed(1)}%",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(height: 20),
                          // Tabs and content
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  _buildTabButton('risk', 'Risk Level'),
                                  _buildTabButton('doctor', 'Doctor'),
                                  _buildTabButton('cures', 'Treatment'),
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 2,
                                color: Colors.grey[300],
                              ),
                              SizedBox(height: 20),
                              if (selectedTab == 'risk') _buildRiskContent(),
                              if (selectedTab == 'doctor') _buildDoctorInfo(),
                              if (selectedTab == 'cures') _buildTreatmentInfo(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildTabButton(String tabId, String text) {
    return GestureDetector(
      onTap: () => setState(() => selectedTab = tabId),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: selectedTab == tabId ? FontWeight.bold : FontWeight.normal,
          color: Color(0xFF432C81),
          fontSize: 16,
        ),
      ),
    );
  }
}