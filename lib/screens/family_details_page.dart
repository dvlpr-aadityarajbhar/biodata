// import 'package:flutter/material.dart';
// import 'package:bio_data_maker/screens/other_details_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class FamilyDetailsPage extends StatefulWidget {
//   const FamilyDetailsPage({super.key});

//   @override
//   _FamilyDetailsPageState createState() => _FamilyDetailsPageState();
// }

// class _FamilyDetailsPageState extends State<FamilyDetailsPage> {
//   final _formKey = GlobalKey<FormState>();
//   final List<Map<String, dynamic>> _fields = [];

//   @override
//   void initState() {
//     super.initState();
//     _fields.addAll([
//       {'label': 'father_name', 'controller': TextEditingController()},
//       {'label': 'father_occupation', 'controller': TextEditingController()},
//       {'label': 'mobile', 'controller': TextEditingController()},
//       {'label': 'mother_name', 'controller': TextEditingController()},
//       {'label': 'mother_occupation', 'controller': TextEditingController()},
//       {'label': 'no_of_brothers', 'controller': TextEditingController()},
//       {'label': 'no_of_sisters', 'controller': TextEditingController()},
//       {'label': 'surname_of_relatives', 'controller': TextEditingController()},
//       {'label': 'mama_surname', 'controller': TextEditingController()},
//       {'label': 'address', 'controller': TextEditingController()},
//       {'label': 'family_native_place', 'controller': TextEditingController()},
//     ]);
//     // _fetchData(); // Fetch existing data when the page loads
//   }

//   Future<void> _updateData() async {
//     if (_formKey.currentState!.validate()) {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? matriId = prefs.getString('matri_id');
//       String? biodataId = prefs.getString('biodata_id');

//       Map<String, String> formData = {};
//       for (var field in _fields) {
//         formData[field['label']] = field['controller'].text;
//       }

//       formData["matri_id"] = matriId ?? '';
//       formData["biodata_id"] = biodataId ?? '';

//       final sendUrl = Uri.parse(
//               'https://techfluxsolutions.com/royal_maratha/api/users/updateFamilyDetails')
//           .replace(queryParameters: formData);
//       // print(formData);
//       // return;

//       final response = await http.put(sendUrl);

//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         _navigateToNextPage();
//       } else {
//         _showErrorDialog('Failed to update data. ${response.body}');
//       }
//     }
//   }

//   void _navigateToNextPage() {
//     if (_formKey.currentState!.validate()) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const OtherDetailsPage()),
//       );
//     }
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Error'),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildTextField(String label, TextEditingController controller,
//       {int? index}) {
//     return Row(
//       children: [
//         Expanded(
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(labelText: label),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter $label';
//               }
//               return null;
//             },
//           ),
//         ),
//         if (index != null)
//           Row(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.arrow_upward, color: Colors.blueGrey),
//                 onPressed: () {
//                   setState(() {
//                     if (index > 0) {
//                       final temp = _fields[index];
//                       _fields[index] = _fields[index - 1];
//                       _fields[index - 1] = temp;
//                     }
//                   });
//                 },
//               ),
//               IconButton(
//                 icon: const Icon(Icons.arrow_downward, color: Colors.blueGrey),
//                 onPressed: () {
//                   setState(() {
//                     if (index < _fields.length - 1) {
//                       final temp = _fields[index];
//                       _fields[index] = _fields[index + 1];
//                       _fields[index + 1] = temp;
//                     }
//                   });
//                 },
//               ),
//               IconButton(
//                 icon: const Icon(Icons.delete, color: Colors.red),
//                 onPressed: () {
//                   setState(() {
//                     _fields.removeAt(index);
//                   });
//                 },
//               ),
//             ],
//           ),
//       ],
//     );
//   }

//   void _addNewField() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         TextEditingController fieldNameController = TextEditingController();
//         return AlertDialog(
//           title: const Text('Add New Field'),
//           content: TextFormField(
//             controller: fieldNameController,
//             decoration: const InputDecoration(hintText: 'Enter field name'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _fields.add({
//                     'label': fieldNameController.text,
//                     'controller': TextEditingController(),
//                   });
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _navigateToPreviousPage() {
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Create Biodata',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: const Color(0xFFFF5507),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon:
//                         const Icon(Icons.arrow_back, color: Color(0xFFB27409)),
//                     onPressed: _navigateToPreviousPage,
//                   ),
//                   const Text(
//                     'Family Details',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.arrow_forward,
//                         color: Color(0xFFB27409)),
//                     onPressed: _updateData,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               for (int i = 0; i < _fields.length; i++)
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 10.0),
//                   child: _buildTextField(
//                       _fields[i]['label'], _fields[i]['controller'],
//                       index: i),
//                 ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: const Color(0xFFFF5507),
//                   backgroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   minimumSize: const Size(325, 8),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 onPressed: _addNewField,
//                 child: const Text('+ Add New Field'),
//               ),
//               const SizedBox(height: 10),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: const Color(0xFFFF5507),
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   minimumSize: const Size(325, 8),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 onPressed: _updateData,
//                 child: const Text('Save and Continue'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
