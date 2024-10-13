// // import 'package:bio_data_maker/consts/lists.dart';
// // import 'package:flutter/material.dart';

// // import '../../request/personal_detais_api.dart';

// // class CreateBioDataScreen extends StatefulWidget {
// //   CreateBioDataScreen({super.key});

// //   @override
// //   _CreateBioDataScreenState createState() => _CreateBioDataScreenState();
// // }

// // class _CreateBioDataScreenState extends State<CreateBioDataScreen> {
// //   // Controllers for personal details
// //   final TextEditingController _biodataTitleController = TextEditingController();
// //   final TextEditingController _fullNameController = TextEditingController();
// //   final TextEditingController _birthPlaceController = TextEditingController();
// //   DateTime? _selectedDate;
// //   TimeOfDay? _selectedTime;
// //   String? _selectedCaste;
// //   String? _selectedHeight;
// //   String? _selectedBloodGroup;

// //   // Lists for dynamically added fields
// //   List<Map<String, dynamic>> _personalFields = [
// //     {'label': 'Devak/Gotra', 'controller': TextEditingController()},
// //     {'label': 'Complexion', 'controller': TextEditingController()},
// //   ];

// //   List<Map<String, dynamic>> _educationFields = [
// //     {'label': 'Education', 'controller': TextEditingController()},
// //     {'label': 'Occupation', 'controller': TextEditingController()},
// //     {'label': 'Annual Income', 'controller': TextEditingController()},
// //   ];

// //   // Method to add new personal detail field
// //   void _addNewPersonalField() {
// //     setState(() {
// //       _personalFields.add({
// //         'label': 'New Personal Detail Field',
// //         'controller': TextEditingController()
// //       });
// //     });
// //   }

// //   // Method to add new education detail field
// //   void _addNewEducationField() {
// //     setState(() {
// //       _educationFields.add({
// //         'label': 'New Education Detail Field',
// //         'controller': TextEditingController()
// //       });
// //     });
// //   }

// //   // Method to submit the biodata (as in your original code)
// //   Future<void> _submitBiodata() async {
// //     String title = _biodataTitleController.text;
// //     String userName = _fullNameController.text;
// //     String height = _selectedHeight ?? "";
// //     String bloodGroup = _selectedBloodGroup ?? "";
// //     String birthTime =
// //         _selectedTime != null ? _selectedTime!.format(context) : "";
// //     String birthPlace = _birthPlaceController.text;
// //     String birthDate = _selectedDate != null
// //         ? "${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}"
// //         : "";
// //     String caste = _selectedCaste ?? "";
// //     String subCaste = "";
// //     String complexion = _personalFields[1]['controller'].text;
// //     String gothra = _personalFields[0]['controller'].text;

// //     // Call the API
// //     await PersonalDetailsRequest().personalDetailsApi(
// //       title,
// //       userName,
// //       height,
// //       bloodGroup,
// //       birthTime,
// //       birthPlace,
// //       birthDate,
// //       caste,
// //       subCaste,
// //       // complexion,
// //       // gothra,
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Create Biodata"),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             // Personal Details Section
// //             Text('Personal Details', style: TextStyle(fontSize: 18)),
// //             TextField(
// //               controller: _biodataTitleController,
// //               decoration: InputDecoration(hintText: "Biodata title"),
// //             ),
// //             TextField(
// //               controller: _fullNameController,
// //               decoration: InputDecoration(hintText: "Full name"),
// //             ),
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: DropdownButtonFormField<String>(
// //                     decoration: const InputDecoration(labelText: 'Caste'),
// //                     items: castes.map((String caste) {
// //                       return DropdownMenuItem<String>(
// //                         value: caste,
// //                         child: Text(caste),
// //                       );
// //                     }).toList(),
// //                     onChanged: (value) {
// //                       setState(() {
// //                         _selectedCaste = value;
// //                       });
// //                     },
// //                   ),
// //                 ),
// //                 SizedBox(width: 8),
// //                 Expanded(
// //                   child: TextField(
// //                     decoration: InputDecoration(hintText: "Sub Caste"),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             TextField(
// //               decoration: const InputDecoration(labelText: 'Birth Date'),
// //               readOnly: true,
// //               controller: TextEditingController(
// //                 text: _selectedDate != null
// //                     ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
// //                     : "",
// //               ),
// //               onTap: () async {
// //                 final DateTime? pickedDate = await showDatePicker(
// //                   context: context,
// //                   initialDate: _selectedDate ?? DateTime.now(),
// //                   firstDate: DateTime(1900),
// //                   lastDate: DateTime.now(),
// //                 );
// //                 if (pickedDate != null && pickedDate != _selectedDate) {
// //                   setState(() {
// //                     _selectedDate = pickedDate;
// //                   });
// //                 }
// //               },
// //             ),
// //             const SizedBox(height: 8),
// //             TextField(
// //               decoration: const InputDecoration(labelText: 'Birth Time'),
// //               readOnly: true,
// //               controller: TextEditingController(
// //                 text:
// //                     _selectedTime != null ? _selectedTime!.format(context) : "",
// //               ),
// //               onTap: () async {
// //                 final TimeOfDay? pickedTime = await showTimePicker(
// //                   context: context,
// //                   initialTime: _selectedTime ?? TimeOfDay.now(),
// //                 );
// //                 if (pickedTime != null && pickedTime != _selectedTime) {
// //                   setState(() {
// //                     _selectedTime = pickedTime;
// //                   });
// //                 }
// //               },
// //             ),
// //             const SizedBox(height: 8),
// //             TextField(
// //               controller: _birthPlaceController,
// //               decoration: InputDecoration(labelText: 'Birth Place'),
// //             ),
// //             const SizedBox(height: 8),
// //             DropdownButtonFormField<String>(
// //               decoration: const InputDecoration(labelText: 'Height'),
// //               items: heights.map((String height) {
// //                 return DropdownMenuItem<String>(
// //                   value: height,
// //                   child: Text(height),
// //                 );
// //               }).toList(),
// //               onChanged: (value) {
// //                 setState(
// //                   () {
// //                     _selectedHeight = value;
// //                   },
// //                 );
// //               },
// //             ),
// //             const SizedBox(height: 8),
// //             // Displaying dynamically added fields for Personal Details
// //             ..._personalFields
// //                 .map((field) => _buildDynamicField(field))
// //                 .toList(),
// //             ElevatedButton(
// //               onPressed: _addNewPersonalField,
// //               child: Text("+Add New Field"),
// //             ),
// //             SizedBox(height: 16),

// //             // Education and Occupation Section
// //             Text('Education and Occupation Details',
// //                 style: TextStyle(fontSize: 18)),
// //             DropdownButtonFormField<String>(
// //               decoration: const InputDecoration(labelText: 'Education Level'),
// //               items: educationLevels.map((String educationLevels) {
// //                 return DropdownMenuItem<String>(
// //                   value: educationLevels,
// //                   child: Text(educationLevels),
// //                 );
// //               }).toList(),
// //               onChanged: (value) {
// //                 setState(
// //                   () {
// //                     _selectedHeight = value;
// //                   },
// //                 );
// //               },
// //             ),
// //             ..._educationFields
// //                 .map((field) => _buildDynamicField(field))
// //                 .toList(),
// //             ElevatedButton(
// //               onPressed: _addNewEducationField,
// //               child: Text(" +Add New Field"),
// //             ),
// //             SizedBox(height: 16),

// //             // Submit Button
// //             ElevatedButton(
// //               onPressed: _submitBiodata,
// //               child: Text("Submit Biodata"),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildDynamicField(Map<String, dynamic> field) {
// //     return Row(
// //       children: [
// //         Expanded(
// //           child: TextField(
// //             controller: field['controller'],
// //             decoration: InputDecoration(
// //               labelText: field['label'],
// //               border: OutlineInputBorder(),
// //             ),
// //           ),
// //         ),
// //         IconButton(
// //           icon: Icon(Icons.unfold_more, color: Colors.blue),
// //           onPressed: () {},
// //         ),
// //         IconButton(
// //           icon: Icon(Icons.delete, color: Colors.red),
// //           onPressed: () {
// //             setState(() {
// //               if (_personalFields.contains(field)) {
// //                 _personalFields.remove(field);
// //               } else if (_educationFields.contains(field)) {
// //                 _educationFields.remove(field);
// //               }
// //             });
// //           },
// //         ),
// //       ],
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:velocity_x/velocity_x.dart';

// import '../../consts/lists.dart';

// class CreateBioDataScreen extends StatefulWidget {
//   const CreateBioDataScreen({super.key});

//   @override
//   State<CreateBioDataScreen> createState() => _CreateBioDataScreenState();
// }

// class _CreateBioDataScreenState extends State<CreateBioDataScreen> {
//   final TextEditingController casteCo = TextEditingController();
//   final TextEditingController birthTimeController = TextEditingController();
//     final _formKey = GlobalKey<FormState>();
//   late final TextEditingController biodataTitleController;
//   final ImagePicker _picker = ImagePicker();
//   XFile? _imageFile;
//   bool _isSaving = false;
//   String id = '';

//   @override
//   void dispose() {
//     birthTimeController.dispose();
//     super.dispose();
//   }

//     @override
//   void initState() {
//     super.initState();
//     biodataTitleController = TextEditingController(
//       text: widget.initialValues?['Biodata Title'] ??
//           "|| Shree Ganeshaya Namah ||",
//     );
//     _initializeControllers();
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Create Biodata',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         body: Container(
//           padding: EdgeInsets.symmetric(horizontal: 8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               10.heightBox,
//               TextFormField(
//                 controller: biodataTitleController,
//                 decoration: const InputDecoration(labelText: 'Biodata Title'),
//               ),
//               10.heightBox,
//               Center(
//                 child: GestureDetector(
//                   onTap: _showImageSourceDialog,
//                   child: Stack(
//                     children: [
//                       Container(
//                         height: 100,
//                         width: 100,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.grey),
//                         ),
//                         child: ClipOval(
//                           child: _imageFile == null
//                               ? Image.asset(
//                                   'assets/images/sample_image.jpg',
//                                   fit: BoxFit.cover,
//                                   height: 100,
//                                   width: 100,
//                                 )
//                               : Image.file(
//                                   File(_imageFile!.path),
//                                   fit: BoxFit.cover,
//                                   height: 100,
//                                   width: 100,
//                                 ),
//                         ),
//                       ),
//                       Positioned(
//                         right: 0,
//                         bottom: 0,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                             border: Border.all(color: Colors.grey),
//                           ),
//                           padding: const EdgeInsets.all(4.0),
//                           child: Icon(
//                             Icons.edit,
//                             color: Colors.black,
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               10.heightBox,
//               "Personal Details"
//                   .text
//                   .size(20)
//                   .color(Colors.black)
//                   .fontWeight(FontWeight.bold)
//                   .make(),
//               10.heightBox,
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "Full Name",
//                 ),
//               ),
//               10.heightBox,
//               Row(
//                 children: [
//                   Expanded(
//                       child: GestureDetector(
//                     onTap: () => _showCasteDialog(casteCo),
//                     child: AbsorbPointer(
//                       child: TextFormField(
//                         // controller: controller,
//                         decoration: InputDecoration(
//                           fillColor: Colors.white,
//                           filled: true,
//                           labelText: "Caste",
//                         ),
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   )),
//                   5.widthBox,
//                   Expanded(
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         labelText: "Sub Caste",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               10.heightBox,
//               Text("Birth Date"),
//               const SizedBox(height: 5),
//               _buildDateDropdown(),
//               10.heightBox,
//               GestureDetector(
//                 onTap: () =>
//                     _selectTime(context), // Call the time picker on tap
//                 child: AbsorbPointer(
//                   child: TextFormField(
//                     controller:
//                         birthTimeController, // Controller for Birth Time
//                     decoration: InputDecoration(
//                       labelText: "Birth Time",
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
