// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:velocity_x/velocity_x.dart';
// import 'consts/lists.dart';
// import 'request/education_details_api.dart';
// import 'home_screen/template_selection_page.dart';

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
//       // '${dayController.text}/${monthController.text}/${yearController.text}', // Birth Date
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

//     // Education and Occupation API
//     await EducationDetailsRequest().educationDetailsApi(
//       sectionFields['Education and Occupation Details']![0]['controller']
//           .text, // Education
//       99.00,
//       sectionFields['Education and Occupation Details']![2]['controller']
//           .text, // Occupation
//       sectionFields['Education and Occupation Details']![3]['controller']
//           .text, // Education Level
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

//     // Other Details API
//     await EducationDetailsRequest().otherDetailsApi(
//       sectionFields['Other Details']![0]['controller'].text, // Property
//       sectionFields['Other Details']![1]['controller'].text, // Expectations

//       // Contact (if applicable)
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

//   // void _submitForm() async {
//   //   if (_formKey.currentState!.validate()) {
//   //     setState(() {
//   //       _isSaving = true; // Start showing the loading indicator on the button
//   //     });

//   //     try {
//   //       await saveAllApi(); // Save the details via the POST API
//   //       _resetControllers(); // Reset all controllers after saving

//   //       Navigator.push(
//   //         context,
//   //         MaterialPageRoute(
//   //           builder: (context) => TemplateSelectionPage(id: id),
//   //         ),
//   //       );
//   //     } catch (e) {
//   //       // Handle any errors (e.g., show a toast, dialog, etc.)
//   //       print("Error saving data: $e");
//   //     } finally {
//   //       setState(() {
//   //         _isSaving = false; // Stop showing the loading indicator
//   //       });
//   //     }
//   //   }
//   // }

//   void _resetControllers() {
//     sectionFields.forEach((key, fields) {
//       for (var field in fields) {
//         field['controller'].text = '';
//       }
//     });

//     // Reset date dropdown controllers if necessary
//     dayController.text = 'DD';
//     monthController.text = 'MM';
//     yearController.text = 'YYYY';

//     // Reset blood group controller if necessary
//     bloodGroupController.text = '';
//   }

// // Widget _buildBloodGroupDropdown() {
// //   List<String> bloodGroups = [
// //     'A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'
// //   ];

// //   return DropdownButtonFormField<String>(
// //     value: sectionFields['Personal Details']![7]['controller'].text.isEmpty ? null : sectionFields['Personal Details']![7]['controller'].text,
// //     dropdownColor: Colors.white,
// //     onChanged: (newValue) {
// //       sectionFields['Personal Details']![7]['controller'].text = newValue!; // Blood Group
// //     },
// //     items: bloodGroups.map((group) {
// //       return DropdownMenuItem<String>(
// //         value: group,
// //         child: Text(
// //           group,
// //           style: TextStyle(color: Colors.black),
// //         ),
// //       );
// //     }).toList(),
// //     decoration: InputDecoration(
// //       labelText: 'Select Blood Group',
// //     ),
// //   );
// // }

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

//   final TextEditingController dayController = TextEditingController(text: 'DD');
//   final TextEditingController monthController =
//       TextEditingController(text: 'MM');
//   final TextEditingController yearController =
//       TextEditingController(text: 'YYYY');
// // Dropdown for selecting day, month, year (dd/mm/yyyy)
//   Widget _buildDateDropdown() {
//     List<String> days = List.generate(31, (index) => (index + 1).toString());
//     List<String> months = List.generate(12, (index) => (index + 1).toString());
//     List<String> years =
//         List.generate(60, (index) => (1970 + index).toString());

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: DropdownButtonFormField<String>(
//             value: dayController.text == 'DD' ? null : dayController.text,
//             dropdownColor: Colors.white,
//             onChanged: (newValue) {
//               dayController.text = newValue!;
//             },
//             items: days.map((day) {
//               return DropdownMenuItem<String>(
//                 value: day,
//                 child: Text(
//                   day,
//                   style: TextStyle(color: Colors.black),
//                 ),
//               );
//             }).toList(),
//             decoration: InputDecoration(
//               labelText: 'DD',
//             ),
//           ),
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: DropdownButtonFormField<String>(
//             value: monthController.text == 'MM' ? null : monthController.text,
//             dropdownColor: Colors.white,
//             onChanged: (newValue) {
//               monthController.text = newValue!;
//             },
//             items: months.map((month) {
//               return DropdownMenuItem<String>(
//                 value: month,
//                 child: Text(month),
//               );
//             }).toList(),
//             decoration: InputDecoration(
//               labelText: 'MM',
//             ),
//           ),
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: DropdownButtonFormField<String>(
//             value: yearController.text == 'YYYY' ? null : yearController.text,
//             dropdownColor: Colors.white,
//             onChanged: (newValue) {
//               yearController.text = newValue!;
//             },
//             items: years.map((year) {
//               return DropdownMenuItem<String>(
//                 value: year,
//                 child: Text(year),
//               );
//             }).toList(),
//             decoration: InputDecoration(
//               labelText: 'YYYY',
//             ),
//           ),
//         ),
//       ],
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
//                                           const SizedBox(height: 10),
//                                           // Text("Blood Group"),
//                                           // const SizedBox(height: 5),
//                                           // _buildBloodGroupDropdown(),
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
//               if (canSwap)
//                 Row(
//                   children: [
//                     if (label == 'Devak')
//                       IconButton(
//                         icon: Icon(Icons.keyboard_arrow_down,
//                             color: Colors.orange, size: 30),
//                         onPressed: () =>
//                             _moveFieldDown(sectionIndex, fieldIndex),
//                       )
//                     else if (label == 'Complexion')
//                       IconButton(
//                         icon: Icon(Icons.keyboard_arrow_up,
//                             color: Colors.orange, size: 30),
//                         onPressed: () => _moveFieldUp(sectionIndex, fieldIndex),
//                       )
//                     else
//                       Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           GestureDetector(
//                             child: Icon(Icons.keyboard_arrow_up,
//                                 color: Colors.orange, size: 30),
//                             onTap: () => _moveFieldUp(sectionIndex, fieldIndex),
//                           ),
//                           GestureDetector(
//                             child: Icon(Icons.keyboard_arrow_down,
//                                 color: Colors.orange, size: 30),
//                             onTap: () =>
//                                 _moveFieldDown(sectionIndex, fieldIndex),
//                           ),
//                         ],
//                       ),
//                     IconButton(
//                       icon: Icon(Icons.delete, color: Colors.red, size: 30),
//                       padding: EdgeInsets.zero,
//                       onPressed: () => _deleteField(sectionIndex, fieldIndex),
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

// // Dropdown method for Blood Group

//   // Widget _buildBloodGroupDropdown() {
//   //   List<String> bloodGroups = [
//   //     'A+',
//   //     'A-',
//   //     'B+',
//   //     'B-',
//   //     'O+',
//   //     'O-',
//   //     'AB+',
//   //     'AB-'
//   //   ];

//   //   return DropdownButtonFormField<String>(
//   //     value:
//   //         bloodGroupController.text.isEmpty ? null : bloodGroupController.text,
//   //     dropdownColor: Colors.white,
//   //     onChanged: (newValue) {
//   //       bloodGroupController.text = newValue!;
//   //     },
//   //     items: bloodGroups.map((group) {
//   //       return DropdownMenuItem<String>(
//   //         value: group,
//   //         child: Text(
//   //           group,
//   //           style: TextStyle(color: Colors.black),
//   //         ),
//   //       );
//   //     }).toList(),
//   //     decoration: InputDecoration(
//   //       labelText: 'Select Blood Group',
//   //     ),
//   //   );
//   // }

//   Widget _buildBloodGroupDropdown() {
//     List<String> bloodGroups = [
//       'A+',
//       'A-',
//       'B+',
//       'B-',
//       'O+',
//       'O-',
//       'AB+',
//       'AB-'
//     ];

//     return DropdownButtonFormField<String>(
//       value: sectionFields['Personal Details']![7]['controller'].text.isEmpty
//           ? null
//           : sectionFields['Personal Details']![7]['controller'].text,
//       dropdownColor: Colors.white,
//       onChanged: (newValue) {
//         sectionFields['Personal Details']![7]['controller'].text =
//             newValue!; // Blood Group
//       },
//       items: bloodGroups.map((group) {
//         return DropdownMenuItem<String>(
//           value: group,
//           child: Text(
//             group,
//             style: TextStyle(color: Colors.black),
//           ),
//         );
//       }).toList(),
//       decoration: InputDecoration(
//         labelText: 'Select Blood Group',
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
//               shrinkWrap:
//                   true, // Ensure the ListView takes only the necessary height
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
//                 Navigator.of(context).pop(); // Close the dialog
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
//           title: Text(
//             'Select Height',
//             style: TextStyle(color: Colors.black),
//           ), // Change title color to black
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
//             constraints: BoxConstraints(
//               maxHeight: 300, // Set a maximum height for the dialog
//             ),
//             child: ListView.builder(
//               shrinkWrap:
//                   true, // Ensure the ListView takes only the necessary height
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

//             bool canSwap = field.containsKey('canSwap')
//                 ? field[
//                     'canSwap'] // Use the canSwap flag from the field if it exists
//                 : false;

//             // Determine if the field should have the "swap" icon based on the section
//             if (title == 'Personal Details' &&
//                 (field['label'] == 'Gothra' ||
//                     field['label'] == 'Complexion')) {
//               canSwap = true; // Only allow swap for Gothra and Complexion
//             } else if (title == 'Education and Occupation Details' &&
//                 fieldIndex > 0) {
//               canSwap =
//                   true; // Allow swap for other fields except Education Level
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

// // Method to delete a field (for demonstration purposes, it simply clears the field text)
//   // void _deleteField(String fieldName) {
//   //   if (fieldName == 'Devak') {
//   //     setState(() {
//   //       devakController.clear(); // Clear the text in Devak field
//   //     });
//   //   } else if (fieldName == 'Complexion') {
//   //     setState(() {
//   //       complexionController.clear(); // Clear the text in Complexion field
//   //     });
//   //   }
//   // }

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
