// // import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'family_details_page.dart'; // Import the FamilyDetailsPage
// import 'package:shared_preferences/shared_preferences.dart';

// class EducationOccupationPage extends StatefulWidget {
//   const EducationOccupationPage({super.key});

//   @override
//   _EducationOccupationPageState createState() =>
//       _EducationOccupationPageState();
// }

// class _EducationOccupationPageState extends State<EducationOccupationPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _education_levelController =
//       TextEditingController();
//   final TextEditingController _education_detailController =
//       TextEditingController();
//   final TextEditingController _occupationController = TextEditingController();
//   final TextEditingController _incomeController = TextEditingController();

//   late final List<Map<String, dynamic>> _fields;

//   @override
//   void initState() {
//     super.initState();

//     _fields = [
//       {'label': 'education_level', 'controller': _education_levelController},
//       {'label': 'education_detail', 'controller': _education_detailController},
//       {'label': 'occupation', 'controller': _occupationController},
//       {'label': 'income', 'controller': _incomeController},
//     ];

//     // _fetchData(); // Fetch existing data when the page loads
//   }

  // Future<void> _updateData() async {
  //   if (_formKey.currentState!.validate()) {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? matriId = prefs.getString('matri_id');
  //     String? biodataId = prefs.getString('biodata_id');
  //     // print(biodataId);
  //     // return;
  //     Map<String, String> formData = {
  //       'education_level': _education_levelController.text,
  //       'education_detail': _education_detailController.text,
  //       'occupation': _occupationController.text,
  //       'income': _incomeController.text,
  //     };

  //     formData["matri_id"] = matriId ?? '';
  //     formData["biodata_id"] = biodataId ?? '';

  //     final sendUrl = Uri.parse(
  //             'https://techfluxsolutions.com/royal_maratha/api/users/updateEducationOccupation')
  //         .replace(queryParameters: formData);

  //     // print(sendUrl);

  //     // return;

  //     final response = await http.put(sendUrl);

  //     print('Response status: ${response.statusCode}');
  //     print('Response body: ${response.body}');

  //     if (response.statusCode == 200) {
  //       // print(formData);
  //       // return;

  //       // Navigate to the next page
  //       _navigateToNextPage();
  //     } else {
  //       _showErrorDialog('Failed to update data. ${response.body}');
  //     }
  //   }
  // }

//   void _navigateToNextPage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const FamilyDetailsPage()),
//     );
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

//   Widget _buildTextField(Map<String, dynamic> field, int index) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//           vertical: 4.0), // Reduce gap between text fields
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Text Field takes up most of the space
//           Expanded(
//             child: TextFormField(
//               controller: field['controller'],
//               decoration: InputDecoration(
//                 labelText: field['label'],
//                 border: const UnderlineInputBorder(),
//                 contentPadding: const EdgeInsets.symmetric(vertical: 10),
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter ${field['label']}';
//                 }
//                 return null;
//               },
//             ),
//           ),
//           const SizedBox(
//               width: 10), // Small space between text field and buttons
//           // Up, Down Arrows and Delete Icon
//           Row(
//             children: [
//               // Up Arrow
//               if (index > 0)
//                 IconButton(
//                   icon: const Icon(
//                     Icons.arrow_upward,
//                     color: Color(0xFFFF5507),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       // Swap fields to move the current field up
//                       final temp = _fields[index - 1];
//                       _fields[index - 1] = _fields[index];
//                       _fields[index] = temp;
//                     });
//                   },
//                 ),
//               // Down Arrow
//               if (index < _fields.length - 1)
//                 IconButton(
//                   icon: const Icon(
//                     Icons.arrow_downward,
//                     color: Color(0xFFFF5507),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       // Swap fields to move the current field down
//                       final temp = _fields[index + 1];
//                       _fields[index + 1] = _fields[index];
//                       _fields[index] = temp;
//                     });
//                   },
//                 ),
//               // Delete Icon
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
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFFF5507),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Center(
//           child: Text(
//             'Create Biodata',
//             textAlign: TextAlign.left,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon:
//                         const Icon(Icons.arrow_back, color: Color(0xFFFF5507)),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   const Text(
//                     'Education And Occupation',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.arrow_forward,
//                         color: Color(0xFFFF5507)),
//                     onPressed: _updateData,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: _fields.length,
//                   itemBuilder: (context, index) {
//                     return Column(
//                       children: [
//                         _buildTextField(_fields[index], index),
//                         const SizedBox(height: 10),
//                       ],
//                     );
//                   },
//                 ),
//               ),
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
//                 onPressed: _updateData,
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: const Color(0xFFFF5507),
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   minimumSize: const Size(325, 8),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text('Save and Continue'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
