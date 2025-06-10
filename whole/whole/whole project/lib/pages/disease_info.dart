Map<String, String> specialists = {
  'Migraine': 'Neurologist',
  'Diabetes': 'Endocrinologist',
  // Add more mappings
};

Map<String, List<String>> treatments = {
  'Migraine': ['Rest in dark room', 'Pain medication', 'Hydration'],
  'Diabetes': ['Insulin therapy', 'Diet control', 'Regular exercise'],
  // Add more mappings
};

String getSpecialist(String disease) => specialists[disease] ?? 'General Physician';
List<String> getCures(String disease) => treatments[disease] ?? ['Consult a doctor'];