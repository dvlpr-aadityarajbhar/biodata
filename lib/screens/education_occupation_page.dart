// // // import 'dart:ui';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'family_details_page.dart'; // Import the FamilyDetailsPage
// // import 'package:shared_preferences/shared_preferences.dart';

// // class EducationOccupationPage extends StatefulWidget {
// //   const EducationOccupationPage({super.key});

// //   @override
// //   _EducationOccupationPageState createState() =>
// //       _EducationOccupationPageState();
// // }

// // class _EducationOccupationPageState extends State<EducationOccupationPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   final TextEditingController _education_levelController =
// //       TextEditingController();
// //   final TextEditingController _education_detailController =
// //       TextEditingController();
// //   final TextEditingController _occupationController = TextEditingController();
// //   final TextEditingController _incomeController = TextEditingController();

// //   late final List<Map<String, dynamic>> _fields;

// //   @override
// //   void initState() {
// //     super.initState();

// //     _fields = [
// //       {'label': 'education_level', 'controller': _education_levelController},
// //       {'label': 'education_detail', 'controller': _education_detailController},
// //       {'label': 'occupation', 'controller': _occupationController},
// //       {'label': 'income', 'controller': _incomeController},
// //     ];

// //     // _fetchData(); // Fetch existing data when the page loads
// //   }

//   // Future<void> _updateData() async {
//   //   if (_formKey.currentState!.validate()) {
//   //     final SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     String? matriId = prefs.getString('matri_id');
//   //     String? biodataId = prefs.getString('biodata_id');
//   //     // print(biodataId);
//   //     // return;
//   //     Map<String, String> formData = {
//   //       'education_level': _education_levelController.text,
//   //       'education_detail': _education_detailController.text,
//   //       'occupation': _occupationController.text,
//   //       'income': _incomeController.text,
//   //     };

//   //     formData["matri_id"] = matriId ?? '';
//   //     formData["biodata_id"] = biodataId ?? '';

//   //     final sendUrl = Uri.parse(
//   //             'https://techfluxsolutions.com/royal_maratha/api/users/updateEducationOccupation')
//   //         .replace(queryParameters: formData);

//   //     // print(sendUrl);

//   //     // return;

//   //     final response = await http.put(sendUrl);

//   //     print('Response status: ${response.statusCode}');
//   //     print('Response body: ${response.body}');

//   //     if (response.statusCode == 200) {
//   //       // print(formData);
//   //       // return;

//   //       // Navigate to the next page
//   //       _navigateToNextPage();
//   //     } else {
//   //       _showErrorDialog('Failed to update data. ${response.body}');
//   //     }
//   //   }
//   // }

// //   void _navigateToNextPage() {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => const FamilyDetailsPage()),
// //     );
// //   }

// //   void _showErrorDialog(String message) {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: const Text('Error'),
// //           content: Text(message),
// //           actions: [
// //             TextButton(
// //               onPressed: () => Navigator.of(context).pop(),
// //               child: const Text('OK'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   void _addNewField() {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         TextEditingController fieldNameController = TextEditingController();
// //         return AlertDialog(
// //           title: const Text('Add New Field'),
// //           content: TextFormField(
// //             controller: fieldNameController,
// //             decoration: const InputDecoration(hintText: 'Enter field name'),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text('Cancel'),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 setState(() {
// //                   _fields.add({
// //                     'label': fieldNameController.text,
// //                     'controller': TextEditingController(),
// //                   });
// //                 });
// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text('Add'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   Widget _buildTextField(Map<String, dynamic> field, int index) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(
// //           vertical: 4.0), // Reduce gap between text fields
// //       child: Row(
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         children: [
// //           // Text Field takes up most of the space
// //           Expanded(
// //             child: TextFormField(
// //               controller: field['controller'],
// //               decoration: InputDecoration(
// //                 labelText: field['label'],
// //                 border: const UnderlineInputBorder(),
// //                 contentPadding: const EdgeInsets.symmetric(vertical: 10),
// //               ),
// //               validator: (value) {
// //                 if (value == null || value.isEmpty) {
// //                   return 'Please enter ${field['label']}';
// //                 }
// //                 return null;
// //               },
// //             ),
// //           ),
// //           const SizedBox(
// //               width: 10), // Small space between text field and buttons
// //           // Up, Down Arrows and Delete Icon
// //           Row(
// //             children: [
// //               // Up Arrow
// //               if (index > 0)
// //                 IconButton(
// //                   icon: const Icon(
// //                     Icons.arrow_upward,
// //                     color: Color(0xFFFF5507),
// //                   ),
// //                   onPressed: () {
// //                     setState(() {
// //                       // Swap fields to move the current field up
// //                       final temp = _fields[index - 1];
// //                       _fields[index - 1] = _fields[index];
// //                       _fields[index] = temp;
// //                     });
// //                   },
// //                 ),
// //               // Down Arrow
// //               if (index < _fields.length - 1)
// //                 IconButton(
// //                   icon: const Icon(
// //                     Icons.arrow_downward,
// //                     color: Color(0xFFFF5507),
// //                   ),
// //                   onPressed: () {
// //                     setState(() {
// //                       // Swap fields to move the current field down
// //                       final temp = _fields[index + 1];
// //                       _fields[index + 1] = _fields[index];
// //                       _fields[index] = temp;
// //                     });
// //                   },
// //                 ),
// //               // Delete Icon
// //               IconButton(
// //                 icon: const Icon(Icons.delete, color: Colors.red),
// //                 onPressed: () {
// //                   setState(() {
// //                     _fields.removeAt(index);
// //                   });
// //                 },
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: const Color(0xFFFF5507),
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //         ),
// //         title: const Center(
// //           child: Text(
// //             'Create Biodata',
// //             textAlign: TextAlign.left,
// //             style: TextStyle(
// //               fontWeight: FontWeight.bold,
// //               color: Colors.white,
// //             ),
// //           ),
// //         ),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             children: <Widget>[
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   IconButton(
// //                     icon:
// //                         const Icon(Icons.arrow_back, color: Color(0xFFFF5507)),
// //                     onPressed: () {
// //                       Navigator.pop(context);
// //                     },
// //                   ),
// //                   const Text(
// //                     'Education And Occupation',
// //                     style: TextStyle(
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 18,
// //                     ),
// //                   ),
// //                   IconButton(
// //                     icon: const Icon(Icons.arrow_forward,
// //                         color: Color(0xFFFF5507)),
// //                     onPressed: _updateData,
// //                   ),
// //                 ],
// //               ),
// //               const SizedBox(height: 20),
// //               Expanded(
// //                 child: ListView.builder(
// //                   itemCount: _fields.length,
// //                   itemBuilder: (context, index) {
// //                     return Column(
// //                       children: [
// //                         _buildTextField(_fields[index], index),
// //                         const SizedBox(height: 10),
// //                       ],
// //                     );
// //                   },
// //                 ),
// //               ),
// //               ElevatedButton(
// //                 style: ElevatedButton.styleFrom(
// //                   foregroundColor: const Color(0xFFFF5507),
// //                   backgroundColor: Colors.white,
// //                   padding: const EdgeInsets.symmetric(vertical: 12),
// //                   minimumSize: const Size(325, 8),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                   ),
// //                 ),
// //                 onPressed: _addNewField,
// //                 child: const Text('+ Add New Field'),
// //               ),
// //               const SizedBox(height: 10),
// //               ElevatedButton(
// //                 onPressed: _updateData,
// //                 style: ElevatedButton.styleFrom(
// //                   foregroundColor: Colors.white,
// //                   backgroundColor: const Color(0xFFFF5507),
// //                   padding: const EdgeInsets.symmetric(vertical: 12),
// //                   minimumSize: const Size(325, 8),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                   ),
// //                 ),
// //                 child: const Text('Save and Continue'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import '../consts/lists.dart';
// import '../controller/swapping_controller.dart';
// import '../request/education_details_api.dart';
// import 'template_selection_page.dart';

// class AllDetailsPage extends StatefulWidget {
//   final Map<String, String>? initialValues;
//   final Map<String, dynamic>? biodataDetails;

//   AllDetailsPage({Key? key, this.initialValues, this.biodataDetails})
//       : super(key: key);

//   @override
//   _AllDetailsPageState createState() => _AllDetailsPageState();
// }

// class _AllDetailsPageState extends State<AllDetailsPage> {
//   final _formKey = GlobalKey<FormState>();
//   late final TextEditingController biodataTitleController;
//   final ImagePicker _picker = ImagePicker();
//   XFile? _imageFile;
//   bool _isSaving = false;
//   String id = '';

//   final Map<String, List<Map<String, dynamic>>> sectionFields = {
//     'Personal Details': [
//       {'label': 'Full Name', 'controller': TextEditingController()},
//       {'label': 'Caste', 'controller': TextEditingController()},
//       {'label': 'Subcaste', 'controller': TextEditingController()},
//       {'label': 'DD/MM/YYYY', 'controller': TextEditingController()},
//       {'label': 'Birth Time', 'controller': TextEditingController()},
//       {'label': 'Birth Place', 'controller': TextEditingController()},
//       {'label': 'Height', 'controller': TextEditingController()},
//       {'label': 'Blood Group', 'controller': TextEditingController()},
//       {'label': 'Gothra', 'controller': TextEditingController()},
//       {'label': 'Complexion', 'controller': TextEditingController()},
//     ],
//     'Education and Occupation Details': [
//       {'label': 'Education', 'controller': TextEditingController()},
//       {'label': 'Annual Income', 'controller': TextEditingController()},
//       {'label': 'Occupation', 'controller': TextEditingController()},
//       {'label': 'Education Level', 'controller': TextEditingController()},
//     ],
//     'Family Details': [
//       {'label': "Father's Name", 'controller': TextEditingController()},
//       {'label': "Father's Occupation", 'controller': TextEditingController()},
//       {'label': 'Mobile No.', 'controller': TextEditingController()},
//       {'label': "Mother's Name", 'controller': TextEditingController()},
//       {'label': "Mother's Occupation", 'controller': TextEditingController()},
//       {'label': 'Total Brothers', 'controller': TextEditingController()},
//       {'label': 'Total Sisters', 'controller': TextEditingController()},
//       {'label': 'Residential Address', 'controller': TextEditingController()},
//       {'label': 'Maternal Uncle Name', 'controller': TextEditingController()},
//       {'label': 'Surname Relatives', 'controller': TextEditingController()},
//       {'label': 'Native Place', 'controller': TextEditingController()},
//     ],
//     'Other Details': [
//       {'label': 'Property', 'controller': TextEditingController()},
//       {'label': 'Expectations', 'controller': TextEditingController()},
//     ],
//   };

//   @override
//   void initState() {
//     super.initState();
//     biodataTitleController = TextEditingController(
//       text: widget.initialValues?['Biodata Title'] ??
//           "|| Shree Ganeshaya Namah ||",
//     );
//     _initializeControllers();
//   }

//   void _initializeControllers() {
//     widget.initialValues?.forEach(
//       (key, value) {
//         for (var section in sectionFields.values) {
//           for (var field in section) {
//             if (field['label'] == key && field['controller'] != null) {
//               (field['controller'] as TextEditingController).text = value;
//             }
//           }
//         }
//       },
//     );
//   }

//   Future<void> saveAllApi() async {
//     String? imagePath = _imageFile?.path;

//     // Personal Details API
//     Map<String, dynamic> data =
//         await EducationDetailsRequest().personalDetailsApi(
//       biodataTitleController.text,
//       sectionFields['Personal Details']![0]['controller'].text, // Full Name
//       sectionFields['Personal Details']![1]['controller'].text, // Caste
//       sectionFields['Personal Details']![2]['controller'].text, // Subcaste
//       sectionFields['Personal Details']![3]['controller'].text, //birth data
//       sectionFields['Personal Details']![4]['controller'].text, // Birth Time
//       sectionFields['Personal Details']![5]['controller'].text, // Birth Place
//       sectionFields['Personal Details']![6]['controller'].text, // Height
//       sectionFields['Personal Details']![7]['controller'].text, // Blood group
//       sectionFields['Personal Details']![8]['controller'].text, // Gothra
//       sectionFields['Personal Details']![9]['controller'].text, // Complexion
//     );

//     print(data.runtimeType);
//     id = EducationDetailsRequest().newBiodataId.toString();
//     print("id---------$id");
//     await EducationDetailsRequest().educationDetailsApi(
//       sectionFields['Education and Occupation Details']![0]['controller'].text,
//       99.00,
//       sectionFields['Education and Occupation Details']![2]['controller'].text,
//       sectionFields['Education and Occupation Details']![3]['controller'].text,
//     );

//     // Family Details API
//     await EducationDetailsRequest().familyDetailsApi(
//       sectionFields['Family Details']![0]['controller'].text, // Father's Name
//       sectionFields['Family Details']![1]['controller']
//           .text, // Father's Occupation
//       sectionFields['Family Details']![2]['controller'].text, // Mobile No.
//       sectionFields['Family Details']![3]['controller'].text, // Mother's Name
//       sectionFields['Family Details']![4]['controller']
//           .text, // Mother's Occupation
//       sectionFields['Family Details']![5]['controller'].text, // Total Brothers
//       sectionFields['Family Details']![6]['controller'].text, // Total Sisters
//       sectionFields['Family Details']![7]['controller']
//           .text, // Residential Address
//       sectionFields['Family Details']![8]['controller']
//           .text, // Maternal Uncle Name
//       sectionFields['Family Details']![9]['controller'].text, // Native Place
//       sectionFields['Family Details']![10]['controller']
//           .text, // Surname Relatives
//     );
//     await EducationDetailsRequest().otherDetailsApi(
//       sectionFields['Other Details']![0]['controller'].text, // Property
//       sectionFields['Other Details']![1]['controller'].text, // Expectations
//     );

//     if (_imageFile != null) {
//       File imageFile =
//           File(_imageFile!.path); // Convert the String path to a File
//       await EducationDetailsRequest().insertImageApi(imageFile);
//     }
//   }

//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isSaving = true; // Start showing the loading indicator on the button
//       });
//       try {
//         await saveAllApi(); // Save the details via the POST API
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => TemplateSelectionPage(
//               id: id,
//             ),
//           ),
//         );
//       } catch (e) {
//         // Handle any errors (e.g., show a toast, dialog, etc.)
//         print("Error saving data: $e");
//       } finally {
//         setState(() {
//           _isSaving = false; // Stop showing the loading indicator
//         });
//       }
//     }
//   }

//   Widget _buildMoveFieldButtons(
//       int sectionIndex, int fieldIndex, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         IconButton(
//           icon: Icon(Icons.keyboard_arrow_up, color: Colors.black, size: 30),
//           onPressed: () => _moveFieldUp(sectionIndex, fieldIndex),
//         ),
//         IconButton(
//           icon: Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 30),
//           onPressed: () => _moveFieldDown(sectionIndex, fieldIndex),
//         ),
//       ],
//     );
//   }

//   Widget _buildDefaultTextField(
//       String label, TextEditingController controller) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: label,
//         filled: true,
//         fillColor: Colors.white,
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your $label';
//         }
//         return null;
//       },
//       style: TextStyle(color: Colors.black),
//     );
//   }

//   Widget _buildTextField(
//     String label,
//     TextEditingController controller,
//     int sectionIndex,
//     int fieldIndex,
//     List<Map<String, dynamic>> fields, {
//     bool canSwap = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: label == 'Caste'
//                     ? GestureDetector(
//                         onTap: () => _showCasteDialog(controller),
//                         child: AbsorbPointer(
//                           child: TextFormField(
//                             controller: controller,
//                             decoration: InputDecoration(
//                               fillColor: Colors.white,
//                               filled: true,
//                               labelText: label,
//                             ),
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       )
//                     : label == 'Education Level'
//                         ? GestureDetector(
//                             onTap: () => _showEducationLevelDialog(controller),
//                             child: AbsorbPointer(
//                               child: TextFormField(
//                                 controller: controller,
//                                 decoration: InputDecoration(
//                                   fillColor: Colors.white,
//                                   filled: true,
//                                   labelText: label,
//                                 ),
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             ),
//                           )
//                         : label == 'Birth Time'
//                             ? GestureDetector(
//                                 onTap: () async {
//                                   TimeOfDay? pickedTime = await showTimePicker(
//                                     context: context,
//                                     initialTime: TimeOfDay.now(),
//                                     builder:
//                                         (BuildContext context, Widget? child) {
//                                       return Theme(
//                                         data: ThemeData.light().copyWith(
//                                           primaryColor: Colors.blue,
//                                           colorScheme: ColorScheme.light(
//                                               primary: Colors.blue),
//                                           buttonTheme: ButtonThemeData(
//                                               textTheme:
//                                                   ButtonTextTheme.primary),
//                                           dialogBackgroundColor: Colors.white,
//                                         ),
//                                         child: child ?? SizedBox(),
//                                       );
//                                     },
//                                   );
//                                   if (pickedTime != null) {
//                                     String formattedTime =
//                                         pickedTime.format(context);
//                                     controller.text = formattedTime;
//                                   }
//                                 },
//                                 child: AbsorbPointer(
//                                   child: TextFormField(
//                                     controller: controller,
//                                     style: TextStyle(color: Colors.black),
//                                     decoration: InputDecoration(
//                                       fillColor: Colors.white,
//                                       filled: true,
//                                       labelText: label,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             : label == 'Subcaste'
//                                 ? Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       TextFormField(
//                                         controller: controller,
//                                         decoration: InputDecoration(
//                                           labelText: label,
//                                           filled: true,
//                                           fillColor: Colors.white,
//                                         ),
//                                         style: TextStyle(color: Colors.black),
//                                       ),
//                                       const SizedBox(height: 10),
//                                       Text("Birth Date"),
//                                       // const SizedBox(height: 5),
//                                       // _buildDateDropdown(), // Adding the Birth Date dropdown here
//                                     ],
//                                   )
//                                 : label == 'Height'
//                                     ? Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           GestureDetector(
//                                             onTap: () =>
//                                                 _showHeightDialog(controller),
//                                             child: AbsorbPointer(
//                                               child: TextFormField(
//                                                 controller: controller,
//                                                 style: TextStyle(
//                                                     color: Colors.black),
//                                                 decoration: InputDecoration(
//                                                   fillColor: Colors.white,
//                                                   filled: true,
//                                                   labelText: label,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       )
//                                     : TextFormField(
//                                         controller: controller,
//                                         decoration: InputDecoration(
//                                           labelText: label,
//                                         ),
//                                         validator: (value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'Please enter your $label';
//                                           }
//                                           return null;
//                                         },
//                                         style: TextStyle(color: Colors.black),
//                                       ),
//               ),
//               Consumer<SwappingController>(
//                 builder: (context, swappingController, child) {
//                   return Row(
//                     children: [
//                       if (canSwap)
//                         Row(
//                           children: [
//                             if (label == 'Devak')
//                               IconButton(
//                                 icon: Icon(Icons.keyboard_arrow_down,
//                                     color: Colors.orange, size: 30),
//                                 onPressed: () {
//                                   swappingController.swapField(
//                                       label, fieldIndex + 1);
//                                 },
//                               )
//                             else if (label == 'Complexion')
//                               IconButton(
//                                 icon: Icon(Icons.keyboard_arrow_up,
//                                     color: Colors.orange, size: 30),
//                                 onPressed: () {
//                                   swappingController.swapField(
//                                       label, fieldIndex - 1);
//                                 },
//                               )
//                             else
//                               Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   GestureDetector(
//                                     child: Icon(Icons.keyboard_arrow_up,
//                                         color: Colors.orange, size: 30),
//                                     onTap: () {
//                                       swappingController.swapField(
//                                           label,
//                                           fieldIndex -
//                                               1); // Assuming ordering logic
//                                     },
//                                   ),
//                                   GestureDetector(
//                                     child: Icon(Icons.keyboard_arrow_down,
//                                         color: Colors.orange, size: 30),
//                                     onTap: () {
//                                       swappingController.swapField(
//                                           label,
//                                           fieldIndex +
//                                               1); // Assuming ordering logic
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             IconButton(
//                               icon: Icon(Icons.delete,
//                                   color: Colors.red, size: 30),
//                               padding: EdgeInsets.zero,
//                               onPressed: () =>
//                                   _deleteField(sectionIndex, fieldIndex),
//                             ),
//                           ],
//                         ),
//                     ],
//                   );
//                 },
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void _showCasteDialog(TextEditingController controller) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Caste'),
//           backgroundColor: Colors.white, // Set dialog background to white
//           content: Container(
//             width: double.maxFinite, // Set the width to maximum
//             constraints: BoxConstraints(
//               maxHeight: 300, // Set a maximum height for the dialog
//             ),
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: castes.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(castes[index]),
//                   onTap: () {
//                     controller.text = castes[index];
//                     Navigator.of(context).pop(); // Close the dialog
//                   },
//                 );
//               },
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }

// // Custom height dialog function
//   Future<void> _showHeightDialog(TextEditingController controller) async {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Height',
//               style: TextStyle(
//                   color: Colors.black)), // Change title color to black
//           backgroundColor: Colors.white, // Set dialog background to white
//           content: Container(
//             width: double.maxFinite,
//             child: ListView.builder(
//               itemCount: heightOptions.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(
//                     heightOptions[index],
//                     style: TextStyle(
//                         color: Colors.black), // Change list item color to black
//                   ),
//                   onTap: () {
//                     controller.text = heightOptions[index]; // Set height value
//                     Navigator.of(context).pop(); // Close dialog
//                   },
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _showEducationLevelDialog(TextEditingController controller) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Education Level'),
//           backgroundColor: Colors.white, // Set dialog background to white
//           content: Container(
//             width: double.maxFinite, // Set the width to maximum
//             constraints: BoxConstraints(maxHeight: 300),
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: educationLevels.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(educationLevels[index]),
//                   onTap: () {
//                     controller.text = educationLevels[index];
//                     Navigator.of(context).pop(); // Close the dialog
//                   },
//                 );
//               },
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildSwapDeleteIcons(int sectionIndex, int fieldIndex) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         IconButton(
//           icon: Icon(Icons.keyboard_arrow_up,
//               color: Colors.orange, size: 30), // Increased size
//           padding: EdgeInsets.zero,
//           onPressed: () => _moveFieldUp(sectionIndex, fieldIndex),
//         ),
//         IconButton(
//           icon: Icon(Icons.keyboard_arrow_down,
//               color: Colors.orange, size: 30), // Increased size
//           padding: EdgeInsets.zero,
//           onPressed: () => _moveFieldDown(sectionIndex, fieldIndex),
//         ),
//         IconButton(
//           icon:
//               Icon(Icons.delete, color: Colors.red, size: 30), // Increased size
//           padding: EdgeInsets.zero,
//           onPressed: () => _deleteField(sectionIndex, fieldIndex),
//         ),
//       ],
//     );
//   }

//   Widget _buildSection(
//       String title, List<Map<String, dynamic>> fields, int sectionIndex) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 8),
//         ...fields.asMap().entries.map(
//           (entry) {
//             int fieldIndex = entry.key;
//             var field = entry.value;

//             bool canSwap =
//                 field.containsKey('canSwap') ? field['canSwap'] : false;

//             if (title == 'Personal Details' &&
//                 (field['label'] == 'Gothra' ||
//                     field['label'] == 'Complexion')) {
//               canSwap = true; // Only allow swap for Gothra and Complexion
//             } else if (title == 'Education and Occupation Details' &&
//                 fieldIndex > 0) {
//               canSwap = true;
//             } else if (title == 'Family Details' || title == 'Other Details') {
//               canSwap = true;
//             }
//             return _buildTextField(
//               field['label'],
//               field['controller'],
//               sectionIndex,
//               fieldIndex,
//               fields,
//               canSwap: canSwap,
//             );
//           },
//         ).toList(),
//         // Add new field button
//         Align(
//           alignment: Alignment.centerRight,
//           child: FilledButton(
//             style: FilledButton.styleFrom(
//               backgroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(color: Colors.black),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//             ),
//             onPressed: () {
//               // Show dialog to add new field
//               _showAddFieldDialog(context, sectionIndex, fields, title);
//             },
//             child: const Text(
//               "+Add New Field",
//               style: TextStyle(
//                 color: Colors.orange,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

// // Function to show the dialog and add a new field
//   void _showAddFieldDialog(BuildContext context, int sectionIndex,
//       List<Map<String, dynamic>> fields, String sectionTitle) {
//     TextEditingController labelController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Enter Label'),
//               IconButton(
//                 icon: Icon(Icons.cancel, color: Colors.red),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//           content: TextFormField(
//             controller: labelController,
//             decoration: InputDecoration(labelText: 'Enter label'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (labelController.text.isNotEmpty) {
//                   setState(() {
//                     bool canSwap = false;

//                     if (sectionTitle == 'Personal Details' &&
//                         (labelController.text == 'Gothra' ||
//                             labelController.text == 'Complexion')) {
//                       canSwap = true;
//                     } else if (sectionTitle ==
//                         'Education and Occupation Details') {
//                       canSwap = true;
//                     } else if (sectionTitle == 'Family Details' ||
//                         sectionTitle == 'Other Details') {
//                       canSwap = true;
//                     }

//                     fields.add({
//                       'label': labelController.text,
//                       'controller': TextEditingController(),
//                       'canSwap': canSwap,
//                     });
//                   });

//                   Navigator.of(context).pop();
//                 }
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _moveFieldUp(int sectionIndex, int fieldIndex) {
//     if (fieldIndex > 0) {
//       setState(() {
//         final temp = sectionFields.values.elementAt(sectionIndex)[fieldIndex];
//         sectionFields.values.elementAt(sectionIndex)[fieldIndex] =
//             sectionFields.values.elementAt(sectionIndex)[fieldIndex - 1];
//         sectionFields.values.elementAt(sectionIndex)[fieldIndex - 1] = temp;
//       });
//     }
//   }

//   void _moveFieldDown(int sectionIndex, int fieldIndex) {
//     if (fieldIndex < sectionFields.values.elementAt(sectionIndex).length - 1) {
//       setState(() {
//         final temp = sectionFields.values.elementAt(sectionIndex)[fieldIndex];
//         sectionFields.values.elementAt(sectionIndex)[fieldIndex] =
//             sectionFields.values.elementAt(sectionIndex)[fieldIndex + 1];
//         sectionFields.values.elementAt(sectionIndex)[fieldIndex + 1] = temp;
//       });
//     }
//   }

//   void _deleteField(int sectionIndex, int fieldIndex) {
//     setState(() {
//       sectionFields.values.elementAt(sectionIndex).removeAt(fieldIndex);
//     });
//   }

//   Future<void> _showImageSourceDialog() async {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Choose Image Source'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: Icon(Icons.camera_alt),
//                 title: Text('Camera'),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   _pickImage(ImageSource.camera);
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.photo_album),
//                 title: Text('Gallery'),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   _pickImage(ImageSource.gallery);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   // Function to pick image from camera or gallery
//   Future<void> _pickImage(ImageSource source) async {
//     final XFile? selectedImage = await _picker.pickImage(
//       source: source,
//       imageQuality: 100,
//     );

//     if (selectedImage != null) {
//       setState(() {
//         _imageFile = selectedImage; // Store the picked image
//       });

//       await EducationDetailsRequest().insertImageApi(File(selectedImage.path));
//       // insertImageApi(File(selectedImage.path));
//     }
//   }

//   final TextEditingController casteCo = TextEditingController();
//   final TextEditingController birthTimeController = TextEditingController();
//   final TextEditingController height = TextEditingController();
//   final TextEditingController bloodGroupController = TextEditingController();

//   @override
//   void dispose() {
//     birthTimeController.dispose();
//     super.dispose();
//   }

//   void _selectTime(BuildContext context) async {
//     TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             primaryColor: Colors.blue,
//             colorScheme: ColorScheme.light(primary: Colors.blue),
//             buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
//             dialogBackgroundColor: Colors.white,
//           ),
//           child: child ?? SizedBox(),
//         );
//       },
//     );

//     if (pickedTime != null) {
//       // Format the time (for example, 14:30 becomes 2:30 PM)
//       String formattedTime = pickedTime.format(context);
//       birthTimeController.text =
//           formattedTime; // Update the controller with the formatted time
//     }
//   }

//   bool canSwap = true;
//   // Controllers for the form fields
//   final TextEditingController devakController = TextEditingController();
//   final TextEditingController complexionController = TextEditingController();

//   // Method to handle swapping fields
//   void _swapFields(String fieldName) {
//     if (fieldName == 'Devak') {
//       // Logic to move Devak/Gotra field down and Complexion up
//       setState(() {
//         // Perform swap here (toggle positions of the two fields)
//         final temp = devakController.text;
//         devakController.text = complexionController.text;
//         complexionController.text = temp;
//       });
//     } else if (fieldName == 'Complexion') {
//       // Logic to move Complexion field up
//       setState(() {
//         // Perform swap here (toggle positions of the two fields)
//         final temp = complexionController.text;
//         complexionController.text = devakController.text;
//         devakController.text = temp;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Create Biodata',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: biodataTitleController,
//                 decoration: const InputDecoration(labelText: 'Biodata Title'),
//               ),
//               const SizedBox(height: 16),

//               GestureDetector(
//                 onTap: _showImageSourceDialog,
//                 child: Stack(
//                   children: [
//                     Container(
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.grey),
//                       ),
//                       child: ClipOval(
//                         child: _imageFile == null
//                             ? Image.asset(
//                                 'assets/images/sample_image.jpg',
//                                 fit: BoxFit.cover,
//                                 height: 100,
//                                 width: 100,
//                               )
//                             : Image.file(
//                                 File(_imageFile!.path),
//                                 fit: BoxFit.cover,
//                                 height: 100,
//                                 width: 100,
//                               ),
//                       ),
//                     ),
//                     Positioned(
//                       right: 0,
//                       bottom: 0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.grey),
//                         ),
//                         padding: const EdgeInsets.all(4.0),
//                         child: Icon(
//                           Icons.edit,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 16),
//               // Build each section of fields
//               ...sectionFields.entries.map(
//                 (entry) {
//                   return _buildSection(entry.key, entry.value,
//                       sectionFields.keys.toList().indexOf(entry.key));
//                 },
//               ).toList(),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _isSaving ? null : _submitForm,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFFFF5507),
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   minimumSize: Size(double.infinity, 50),
//                 ),
//                 child: _isSaving
//                     ? const SizedBox(
//                         height: 24,
//                         width: 24,
//                         child: CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation<Color>(
//                               Colors.purple), // White indicator color
//                           strokeWidth: 2,
//                         ),
//                       )
//                     : const Text(
//                         'Save All',
//                         style: TextStyle(color: Colors.white),
//                       ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
