import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor =
      Color(0xFFFF5508); // Orange color from the image

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: MaterialColor(primaryColor.value, {
        50: primaryColor.withOpacity(0.1),
        100: primaryColor.withOpacity(0.2),
        200: primaryColor.withOpacity(0.3),
        300: primaryColor.withOpacity(0.4),
        400: primaryColor.withOpacity(0.5),
        500: primaryColor,
        600: primaryColor.withOpacity(0.6),
        700: primaryColor.withOpacity(0.7),
        800: primaryColor.withOpacity(0.8),
        900: primaryColor.withOpacity(0.9),
      }),
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// final TextEditingController dayController = TextEditingController(text: 'DD');
//   final TextEditingController monthController =
//       TextEditingController(text: 'MM');
//   final TextEditingController yearController =
//       TextEditingController(text: 'YYYY');

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
//                         // Adding custom dropdown for Date (dd/mm/yyyy) format after 'Subcaste'
//                         : label == 'Subcaste'
//                             ? Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   TextFormField(
//                                     controller: controller,
//                                     decoration: InputDecoration(
//                                       labelText: label,
//                                       filled: true,
//                                       fillColor: Colors.white,
//                                     ),
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                   const SizedBox(height: 10),
//                                   Text("Birth Date"),
//                                   const SizedBox(height: 5),
//                                   _buildDateDropdown(),
//                                 ],
//                               )
//                             : _buildDefaultTextField(label, controller),
//               ),
//               if (canSwap)
//                 Row(
//                   children: [
//                     _buildMoveFieldButtons(sectionIndex, fieldIndex, label),
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

// Add this import at the top of your file if it's not already there

// // Update the _buildTextField method to handle the Height field dropdown and Birth Time time picker
// Widget _buildTextField(
//   String label,
//   TextEditingController controller,
//   int sectionIndex,
//   int fieldIndex,
//   List<Map<String, dynamic>> fields, {
//   bool canSwap = false,
// }) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 4.0),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: label == 'Caste'
//                   ? GestureDetector(
//                       onTap: () => _showCasteDialog(controller),
//                       child: AbsorbPointer(
//                         child: TextFormField(
//                           controller: controller,
//                           decoration: InputDecoration(
//                             fillColor: Colors.white,
//                             filled: true,
//                             labelText: label,
//                           ),
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     )
//                   : label == 'Education Level'
//                       ? GestureDetector(
//                           onTap: () => _showEducationLevelDialog(controller),
//                           child: AbsorbPointer(
//                             child: TextFormField(
//                               controller: controller,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.white,
//                                 filled: true,
//                                 labelText: label,
//                               ),
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         )
//                       : label == 'Birth Time'
//                           ? GestureDetector(
//                               onTap: () async {
//                                 TimeOfDay? pickedTime = await showTimePicker(
//                                   context: context,
//                                   initialTime: TimeOfDay.now(),
//                                   builder:
//                                       (BuildContext context, Widget? child) {
//                                     return Theme(
//                                       data: ThemeData.light().copyWith(
//                                         primaryColor: Colors.blue,
//                                         colorScheme: ColorScheme.light(
//                                             primary: Colors.blue),
//                                         buttonTheme: ButtonThemeData(
//                                             textTheme:
//                                                 ButtonTextTheme.primary),
//                                         dialogBackgroundColor: Colors.white,
//                                       ),
//                                       child: child ?? SizedBox(),
//                                     );
//                                   },
//                                 );
//                                 if (pickedTime != null) {
//                                   String formattedTime =
//                                       pickedTime.format(context);
//                                   controller.text = formattedTime;
//                                 }
//                               },
//                               child: AbsorbPointer(
//                                 child: TextFormField(
//                                   controller: controller,
//                                   style: TextStyle(color: Colors.black),
//                                   decoration: InputDecoration(
//                                     fillColor: Colors.white,
//                                     filled: true,
//                                     labelText: label,
//                                   ),
//                                 ),
//                               ),
//                             )
//                           : label == 'Height'
//                               ? GestureDetector(
//                                   onTap: () => _showHeightDialog(controller),
//                                   child: AbsorbPointer(
//                                     child: TextFormField(
//                                       controller: controller,
//                                       style: TextStyle(color: Colors.black),
//                                       decoration: InputDecoration(
//                                         fillColor: Colors.white,
//                                         filled: true,
//                                         labelText: label,
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : TextFormField(
//                                   controller: controller,
//                                   decoration:
//                                       InputDecoration(labelText: label),
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Please enter your $label';
//                                     }
//                                     return null;
//                                   },
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//             ),
//             if (canSwap)
//               Row(
//                 children: [
//                   if (label == 'Devak')
//                     IconButton(
//                       icon: Icon(Icons.keyboard_arrow_down,
//                           color: Colors.orange, size: 30),
//                       onPressed: () =>
//                           _moveFieldDown(sectionIndex, fieldIndex),
//                     )
//                   else if (label == 'Complexion')
//                     IconButton(
//                       icon: Icon(Icons.keyboard_arrow_up,
//                           color: Colors.orange, size: 30),
//                       onPressed: () => _moveFieldUp(sectionIndex, fieldIndex),
//                     )
//                   else
//                     Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.keyboard_arrow_up,
//                               color: Colors.orange, size: 30),
//                           onPressed: () =>
//                               _moveFieldUp(sectionIndex, fieldIndex),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.keyboard_arrow_down,
//                               color: Colors.orange, size: 30),
//                           onPressed: () =>
//                               _moveFieldDown(sectionIndex, fieldIndex),
//                         ),
//                       ],
//                     ),
//                   IconButton(
//                     icon: Icon(Icons.delete, color: Colors.red, size: 30),
//                     padding: EdgeInsets.zero,
//                     onPressed: () => _deleteField(sectionIndex, fieldIndex),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// Widget _buildTextField(
//   String label,
//   TextEditingController controller,
//   int sectionIndex,
//   int fieldIndex,
//   List<Map<String, dynamic>> fields, {
//   bool canSwap = false,
// }) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 4.0),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: label == 'Caste'
//                   ? GestureDetector(
//                       onTap: () => _showCasteDialog(controller),
//                       child: AbsorbPointer(
//                         child: TextFormField(
//                           controller: controller,
//                           decoration: InputDecoration(
//                             fillColor: Colors.white,
//                             filled: true,
//                             labelText: label,
//                           ),
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     )
//                   : label == 'Education Level'
//                       ? GestureDetector(
//                           onTap: () => _showEducationLevelDialog(controller),
//                           child: AbsorbPointer(
//                             child: TextFormField(
//                               controller: controller,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.white,
//                                 filled: true,
//                                 labelText: label,
//                               ),
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         )
//                       : label == 'Birth Time'
//                           ? GestureDetector(
//                               onTap: () async {
//                                 TimeOfDay? pickedTime = await showTimePicker(
//                                   context: context,
//                                   initialTime: TimeOfDay.now(),
//                                   builder:
//                                       (BuildContext context, Widget? child) {
//                                     return Theme(
//                                       data: ThemeData.light().copyWith(
//                                         primaryColor: Colors.blue,
//                                         colorScheme: ColorScheme.light(
//                                             primary: Colors.blue),
//                                         buttonTheme: ButtonThemeData(
//                                             textTheme:
//                                                 ButtonTextTheme.primary),
//                                         dialogBackgroundColor: Colors.white,
//                                       ),
//                                       child: child ?? SizedBox(),
//                                     );
//                                   },
//                                 );
//                                 if (pickedTime != null) {
//                                   String formattedTime =
//                                       pickedTime.format(context);
//                                   controller.text = formattedTime;
//                                 }
//                               },
//                               child: AbsorbPointer(
//                                 child: TextFormField(
//                                   controller: controller,
//                                   style: TextStyle(color: Colors.black),
//                                   decoration: InputDecoration(
//                                     fillColor: Colors.white,
//                                     filled: true,
//                                     labelText: label,
//                                   ),
//                                 ),
//                               ),
//                             )
//                           : label == 'Subcaste'
//                               ? Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                   children: [
//                                     TextFormField(
//                                       controller: controller,
//                                       decoration: InputDecoration(
//                                         labelText: label,
//                                         filled: true,
//                                         fillColor: Colors.white,
//                                       ),
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                     const SizedBox(height: 10),
//                                     Text("Birth Date"),
//                                     const SizedBox(height: 5),
//                                     _buildDateDropdown(), // Adding the Birth Date dropdown here
//                                   ],
//                                 )
//                               : label == 'Height'
//                                   ? GestureDetector(
//                                       onTap: () =>
//                                           _showHeightDialog(controller),
//                                       child: AbsorbPointer(
//                                         child: TextFormField(
//                                           controller: controller,
//                                           style:
//                                               TextStyle(color: Colors.black),
//                                           decoration: InputDecoration(
//                                             fillColor: Colors.white,
//                                             filled: true,
//                                             labelText: label,
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   : TextFormField(
//                                       controller: controller,
//                                       decoration:
//                                           InputDecoration(labelText: label),
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return 'Please enter your $label';
//                                         }
//                                         return null;
//                                       },
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//             ),
//             if (canSwap)
//               Row(
//                 children: [
//                   if (label == 'Devak')
//                     IconButton(
//                       icon: Icon(Icons.keyboard_arrow_down,
//                           color: Colors.orange, size: 30),
//                       onPressed: () =>
//                           _moveFieldDown(sectionIndex, fieldIndex),
//                     )
//                   else if (label == 'Complexion')
//                     IconButton(
//                       icon: Icon(Icons.keyboard_arrow_up,
//                           color: Colors.orange, size: 30),
//                       onPressed: () => _moveFieldUp(sectionIndex, fieldIndex),
//                     )
//                   else
//                     Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.keyboard_arrow_up,
//                               color: Colors.orange, size: 30),
//                           onPressed: () =>
//                               _moveFieldUp(sectionIndex, fieldIndex),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.keyboard_arrow_down,
//                               color: Colors.orange, size: 30),
//                           onPressed: () =>
//                               _moveFieldDown(sectionIndex, fieldIndex),
//                         ),
//                       ],
//                     ),
//                   IconButton(
//                     icon: Icon(Icons.delete, color: Colors.red, size: 30),
//                     padding: EdgeInsets.zero,
//                     onPressed: () => _deleteField(sectionIndex, fieldIndex),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// Widget _buildSection(
//     String title, List<Map<String, dynamic>> fields, int sectionIndex) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         title,
//         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//       const SizedBox(height: 8),
//       ...fields.asMap().entries.map(
//         (entry) {
//           int fieldIndex = entry.key;
//           var field = entry.value;

//           bool canSwap = false;

//           // Determine if the field should have the "unfold more" icon based on the section
//           if (title == 'Personal Details' &&
//               (field['label'] == 'Gothra' ||
//                   field['label'] == 'Complexion')) {
//             canSwap = true; // Only allow swap for Gothra and Complexion
//           } else if (title == 'Education and Occupation Details' &&
//               fieldIndex > 0) {
//             canSwap =
//                 true; // Allow swap for other fields except Education Level
//           } else if (title == 'Family Details' || title == 'Other Details') {
//             canSwap = true;
//           }

//           return _buildTextField(
//             field['label'],
//             field['controller'],
//             sectionIndex,
//             fieldIndex,
//             fields,
//             canSwap: canSwap,
//           );
//         },
//       ).toList(),
//       // const SizedBox(height: 16),
//       Align(
//         alignment: Alignment.centerRight,
//         child: FilledButton(
//           style: FilledButton.styleFrom(
//             backgroundColor: Colors.white,
//             shape: RoundedRectangleBorder(
//               side: BorderSide(color: Colors.black),
//               borderRadius: BorderRadius.circular(5),
//             ),
//           ),
//           onPressed: () {},
//           child: Text(
//             "+Add New Field",
//             style: TextStyle(
//               color: Colors.orange,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Widget _buildSection(
//     String title, List<Map<String, dynamic>> fields, int sectionIndex) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         title,
//         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//       const SizedBox(height: 8),
//       ...fields.asMap().entries.map(
//         (entry) {
//           int fieldIndex = entry.key;
//           var field = entry.value;

//           bool canSwap = false;

//           // Determine if the field should have the "unfold more" icon based on the section
//           if (title == 'Personal Details' &&
//               (field['label'] == 'Gothra' ||
//                   field['label'] == 'Complexion')) {
//             canSwap = true; // Only allow swap for Gothra and Complexion
//           } else if (title == 'Education and Occupation Details' &&
//               fieldIndex > 0) {
//             canSwap =
//                 true; // Allow swap for other fields except Education Level
//           } else if (title == 'Family Details' || title == 'Other Details') {
//             canSwap = true;
//           }

//           return _buildTextField(
//             field['label'],
//             field['controller'],
//             sectionIndex,
//             fieldIndex,
//             fields,
//             canSwap: canSwap,
//           );
//         },
//       ).toList(),
//       // Add new field button
//       Align(
//         alignment: Alignment.centerRight,
//         child: FilledButton(
//           style: FilledButton.styleFrom(
//             backgroundColor: Colors.white,
//             shape: RoundedRectangleBorder(
//               side: BorderSide(color: Colors.black),
//               borderRadius: BorderRadius.circular(5),
//             ),
//           ),
//           onPressed: () {
//             // Show dialog to add new field
//             _showAddFieldDialog(context, sectionIndex, fields);
//           },
//           child: const Text(
//             "+Add New Field",
//             style: TextStyle(
//               color: Colors.orange,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }

// // Function to show the dialog and add a new field
// void _showAddFieldDialog(BuildContext context, int sectionIndex,
//     List<Map<String, dynamic>> fields) {
//   TextEditingController labelController = TextEditingController();

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Enter Label'),
//             IconButton(
//               icon: Icon(Icons.cancel, color: Colors.red),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//             ),
//           ],
//         ),
//         content: TextFormField(
//           controller: labelController,
//           decoration: InputDecoration(labelText: 'Enter label'),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Close the dialog
//             },
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               if (labelController.text.isNotEmpty) {
//                 setState(() {
//                   // Add a new field to the fields list
//                   fields.add({
//                     'label': labelController.text,
//                     'controller': TextEditingController(),
//                   });
//                 });
//                 Navigator.of(context).pop(); // Close the dialog
//               }
//             },
//             child: const Text('Add'),
//           ),
//         ],
//       );
//     },
//   );
// }

// Your dropdown method for day/month/year selection (unchanged)
// Widget _buildDateDropdown() {
//   List<String> days = List.generate(31, (index) => (index + 1).toString());
//   List<String> months = List.generate(12, (index) => (index + 1).toString());
//   List<String> years = List.generate(60, (index) => (1970 + index).toString());

//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Expanded(
//         child: DropdownButtonFormField<String>(
//           value: dayController.text == 'DD' ? null : dayController.text,
//           dropdownColor: Colors.white,
//           onChanged: (newValue) {
//             dayController.text = newValue!;
//           },
//           items: days.map((day) {
//             return DropdownMenuItem<String>(
//               value: day,
//               child: Text(
//                 day,
//                 style: TextStyle(color: Colors.black),
//               ),
//             );
//           }).toList(),
//           decoration: InputDecoration(
//             labelText: 'DD',
//           ),
//         ),
//       ),
//       const SizedBox(width: 10),
//       Expanded(
//         child: DropdownButtonFormField<String>(
//           value: monthController.text == 'MM' ? null : monthController.text,
//           dropdownColor: Colors.white,
//           onChanged: (newValue) {
//             monthController.text = newValue!;
//           },
//           items: months.map((month) {
//             return DropdownMenuItem<String>(
//               value: month,
//               child: Text(month),
//             );
//           }).toList(),
//           decoration: InputDecoration(
//             labelText: 'MM',
//           ),
//         ),
//       ),
//       const SizedBox(width: 10),
//       Expanded(
//         child: DropdownButtonFormField<String>(
//           value: yearController.text == 'YYYY' ? null : yearController.text,
//           dropdownColor: Colors.white,
//           onChanged: (newValue) {
//             yearController.text = newValue!;
//           },
//           items: years.map((year) {
//             return DropdownMenuItem<String>(
//               value: year,
//               child: Text(year),
//             );
//           }).toList(),
//           decoration: InputDecoration(
//             labelText: 'YYYY',
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Dropdown method for Birth Date (unchanged)
// Widget _buildDateDropdown() {
//   List<String> days = List.generate(31, (index) => (index + 1).toString());
//   List<String> months = List.generate(12, (index) => (index + 1).toString());
//   List<String> years = List.generate(60, (index) => (1970 + index).toString());

//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Expanded(
//         child: DropdownButtonFormField<String>(
//           value: dayController.text == 'DD' ? null : dayController.text,
//           dropdownColor: Colors.white,
//           onChanged: (newValue) {
//             dayController.text = newValue!;
//           },
//           items: days.map((day) {
//             return DropdownMenuItem<String>(
//               value: day,
//               child: Text(
//                 day,
//                 style: TextStyle(color: Colors.black),
//               ),
//             );
//           }).toList(),
//           decoration: InputDecoration(
//             labelText: 'DD',
//           ),
//         ),
//       ),
//       const SizedBox(width: 10),
//       Expanded(
//         child: DropdownButtonFormField<String>(
//           value: monthController.text == 'MM' ? null : monthController.text,
//           dropdownColor: Colors.white,
//           onChanged: (newValue) {
//             monthController.text = newValue!;
//           },
//           items: months.map((month) {
//             return DropdownMenuItem<String>(
//               value: month,
//               child: Text(month),
//             );
//           }).toList(),
//           decoration: InputDecoration(
//             labelText: 'MM',
//           ),
//         ),
//       ),
//       const SizedBox(width: 10),
//       Expanded(
//         child: DropdownButtonFormField<String>(
//           value: yearController.text == 'YYYY' ? null : yearController.text,
//           dropdownColor: Colors.white,
//           onChanged: (newValue) {
//             yearController.text = newValue!;
//           },
//           items: years.map((year) {
//             return DropdownMenuItem<String>(
//               value: year,
//               child: Text(year),
//             );
//           }).toList(),
//           decoration: InputDecoration(
//             labelText: 'YYYY',
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Dropdown method for Birth Date (unchanged)
// Widget _buildDateDropdown() {
//   List<String> days = List.generate(31, (index) => (index + 1).toString());
//   List<String> months = List.generate(12, (index) => (index + 1).toString());
//   List<String> years = List.generate(60, (index) => (1970 + index).toString());

//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Expanded(
//         child: DropdownButtonFormField<String>(
//           value: dayController.text == 'DD' ? null : dayController.text,
//           dropdownColor: Colors.white,
//           onChanged: (newValue) {
//             dayController.text = newValue!;
//           },
//           items: days.map((day) {
//             return DropdownMenuItem<String>(
//               value: day,
//               child: Text(
//                 day,
//                 style: TextStyle(color: Colors.black),
//               ),
//             );
//           }).toList(),
//           decoration: InputDecoration(
//             labelText: 'DD',
//           ),
//         ),
//       ),
//       const SizedBox(width: 10),
//       Expanded(
//         child: DropdownButtonFormField<String>(
//           value: monthController.text == 'MM' ? null : monthController.text,
//           dropdownColor: Colors.white,
//           onChanged: (newValue) {
//             monthController.text = newValue!;
//           },
//           items: months.map((month) {
//             return DropdownMenuItem<String>(
//               value: month,
//               child: Text(month),
//             );
//           }).toList(),
//           decoration: InputDecoration(
//             labelText: 'MM',
//           ),
//         ),
//       ),
//       const SizedBox(width: 10),
//       Expanded(
//         child: DropdownButtonFormField<String>(
//           value: yearController.text == 'YYYY' ? null : yearController.text,
//           dropdownColor: Colors.white,
//           onChanged: (newValue) {
//             yearController.text = newValue!;
//           },
//           items: years.map((year) {
//             return DropdownMenuItem<String>(
//               value: year,
//               child: Text(year),
//             );
//           }).toList(),
//           decoration: InputDecoration(
//             labelText: 'YYYY',
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Function to pick image from camera or gallery
// Future<void> _pickImage(ImageSource source) async {
//   final XFile? selectedImage = await _picker.pickImage(
//     source: source,
//     imageQuality: 100,
//   );

//   setState(() {
//     _imageFile = selectedImage;
//   });
// }

// body: Container(
//   padding: EdgeInsets.symmetric(horizontal: 8),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       10.heightBox,
//       TextFormField(
//         controller: biodataTitleController,
//         decoration: const InputDecoration(labelText: 'Biodata Title'),
//       ),
//       10.heightBox,
//       Center(
//         child: GestureDetector(
//           onTap: _showImageSourceDialog,
//           child: Stack(
//             children: [
//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.grey),
//                 ),
//                 child: ClipOval(
//                   child: _imageFile == null
//                       ? Image.asset(
//                           'assets/images/sample_image.jpg',
//                           fit: BoxFit.cover,
//                           height: 100,
//                           width: 100,
//                         )
//                       : Image.file(
//                           File(_imageFile!.path),
//                           fit: BoxFit.cover,
//                           height: 100,
//                           width: 100,
//                         ),
//                 ),
//               ),
//               Positioned(
//                 right: 0,
//                 bottom: 0,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   padding: const EdgeInsets.all(4.0),
//                   child: Icon(
//                     Icons.edit,
//                     color: Colors.black,
//                     size: 20,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       10.heightBox,
//       "Personal Details"
//           .text
//           .size(20)
//           .color(Colors.black)
//           .fontWeight(FontWeight.bold)
//           .make(),
//       10.heightBox,
//       TextFormField(
//         decoration: InputDecoration(
//           labelText: "Full Name",
//         ),
//       ),
//       10.heightBox,
//       Row(
//         children: [
//           Expanded(
//               child: GestureDetector(
//             onTap: () => _showCasteDialog(casteCo),
//             child: AbsorbPointer(
//               child: TextFormField(
//                 // controller: controller,
//                 decoration: InputDecoration(
//                   fillColor: Colors.white,
//                   filled: true,
//                   labelText: "Caste",
//                 ),
//                 style: TextStyle(color: Colors.black),
//               ),
//             ),
//           )),
//           5.widthBox,
//           Expanded(
//             child: TextFormField(
//               decoration: InputDecoration(
//                 labelText: "Sub Caste",
//               ),
//             ),
//           ),
//         ],
//       ),
//       10.heightBox,
//       Text("Birth Date"),
//       const SizedBox(height: 5),
//       _buildDateDropdown(),
//       10.heightBox,
//       GestureDetector(
//         onTap: () =>
//             _selectTime(context), // Call the time picker on tap
//         child: AbsorbPointer(
//           child: TextFormField(
//             controller:
//                 birthTimeController, // Controller for Birth Time
//             decoration: InputDecoration(
//               labelText: "Birth Time",
//             ),
//           ),
//         ),
//       ),
//       10.heightBox,
//       GestureDetector(
//         onTap: () => _showHeightDialog(height),
//         child: AbsorbPointer(
//           child: TextFormField(
//             controller: height,
//             style: TextStyle(color: Colors.black),
//             decoration: InputDecoration(
//               fillColor: Colors.white,
//               filled: true,
//               labelText: "Height",
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(height: 5),
//       _buildBloodGroupDropdown(),
//     ],
//   ),
// )

// Widget _buildTextField(
//   String label,
//   TextEditingController controller,
//   int sectionIndex,
//   int fieldIndex,
//   List<Map<String, dynamic>> fields, {
//   bool canSwap = false,
// }) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 4.0),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: label == 'Caste'
//                   ? GestureDetector(
//                       onTap: () => _showCasteDialog(controller),
//                       child: AbsorbPointer(
//                         child: TextFormField(
//                           controller: controller,
//                           decoration: InputDecoration(
//                             fillColor: Colors.white,
//                             filled: true,
//                             labelText: label,
//                           ),
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     )
//                   : label == 'Education Level'
//                       ? GestureDetector(
//                           onTap: () => _showEducationLevelDialog(controller),
//                           child: AbsorbPointer(
//                             child: TextFormField(
//                               controller: controller,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.white,
//                                 filled: true,
//                                 labelText: label,
//                               ),
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         )
//                       : label == 'Birth Time'
//                           ? GestureDetector(
//                               onTap: () async {
//                                 TimeOfDay? pickedTime = await showTimePicker(
//                                   context: context,
//                                   initialTime: TimeOfDay.now(),
//                                   builder:
//                                       (BuildContext context, Widget? child) {
//                                     return Theme(
//                                       data: ThemeData.light().copyWith(
//                                         primaryColor: Colors.blue,
//                                         colorScheme: ColorScheme.light(
//                                             primary: Colors.blue),
//                                         buttonTheme: ButtonThemeData(
//                                             textTheme:
//                                                 ButtonTextTheme.primary),
//                                         dialogBackgroundColor: Colors.white,
//                                       ),
//                                       child: child ?? SizedBox(),
//                                     );
//                                   },
//                                 );
//                                 if (pickedTime != null) {
//                                   String formattedTime =
//                                       pickedTime.format(context);
//                                   controller.text = formattedTime;
//                                 }
//                               },
//                               child: AbsorbPointer(
//                                 child: TextFormField(
//                                   controller: controller,
//                                   style: TextStyle(color: Colors.black),
//                                   decoration: InputDecoration(
//                                     fillColor: Colors.white,
//                                     filled: true,
//                                     labelText: label,
//                                   ),
//                                 ),
//                               ),
//                             )
//                           : label == 'Subcaste'
//                               ? Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                   children: [
//                                     TextFormField(
//                                       controller: controller,
//                                       decoration: InputDecoration(
//                                         labelText: label,
//                                         filled: true,
//                                         fillColor: Colors.white,
//                                       ),
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                     const SizedBox(height: 10),
// Text("Birth Date"),
// const SizedBox(height: 5),
// _buildDateDropdown(),
//                                   ],
//                                 )
//                               : _buildDefaultTextField(label, controller),
//             ),
//             if (canSwap)
//               Row(
//                 children: [
//                   _buildMoveFieldButtons(sectionIndex, fieldIndex, label),
//                   IconButton(
//                     icon: Icon(Icons.delete, color: Colors.red, size: 30),
//                     padding: EdgeInsets.zero,
//                     onPressed: () => _deleteField(sectionIndex, fieldIndex),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

//combination of both codes
// import 'package:bio_data_maker/request/education_details_api.dart';
// import 'package:bio_data_maker/screens/template_selection_page.dart';
// import 'package:flutter/material.dart';

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

//   final Map<String, List<Map<String, dynamic>>> sectionFields = {
//     'Personal Details': [
//       {'label': 'Full Name', 'controller': TextEditingController()},
//       {'label': 'Caste', 'controller': TextEditingController()},
//       {'label': 'Subcaste', 'controller': TextEditingController()},
//       {'label': 'Birth Time', 'controller': TextEditingController()},
//       {'label': 'Birth Place', 'controller': TextEditingController()},
//       {'label': 'Height', 'controller': TextEditingController()},
//       {'label': 'Gothra', 'controller': TextEditingController()},
//       {'label': 'Complexion', 'controller': TextEditingController()},
//     ],
//     'Education and Occupation Details': [
//       {'label': 'Education Level', 'controller': TextEditingController()},
//       {'label': 'Education', 'controller': TextEditingController()},
//       {'label': 'Occupation', 'controller': TextEditingController()},
//       {'label': 'Annual Income', 'controller': TextEditingController()},
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
//       {'label': 'Email', 'controller': TextEditingController()},
//       {'label': 'Contact', 'controller': TextEditingController()},
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
//     // Personal Details API
//     await EducationDetailsRequest().personalDetailsApi(
//       biodataTitleController.text,
//       sectionFields['Personal Details']![0]['controller'].text, // Full Name
//       sectionFields['Personal Details']![1]['controller'].text, // Caste
//       sectionFields['Personal Details']![2]['controller'].text, // Subcaste
//       sectionFields['Personal Details']![3]['controller'].text, // Birth Time
//       sectionFields['Personal Details']![4]['controller'].text, // Birth Place
//       sectionFields['Personal Details']![5]['controller'].text, // Height
//       sectionFields['Personal Details']![6]['controller'].text, // Gothra
//       sectionFields['Personal Details']![7]['controller'].text, // Complexion
//     );

//     // Education and Occupation API
//     await EducationDetailsRequest().educationDetailsApi(
//       sectionFields['Education and Occupation Details']![0]['controller']
//           .text, // Education Level
//       sectionFields['Education and Occupation Details']![1]['controller']
//           .text, // Education
//       sectionFields['Education and Occupation Details']![2]['controller']
//           .text, // Occupation
//       sectionFields['Education and Occupation Details']![3]['controller']
//           .text, // Annual Income
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
//       sectionFields['Family Details']![9]['controller']
//           .text, // Surname Relatives
//       sectionFields['Family Details']![10]['controller'].text, // Native Place
//     );

//     // Other Details API
//     await EducationDetailsRequest().otherDetailsApi(
//       sectionFields['Other Details']![0]['controller'].text, // Property
//       sectionFields['Other Details']![1]['controller'].text, // Expectations
//       sectionFields['Other Details']![2]['controller'].text, // Email
//       sectionFields['Other Details']![3]['controller'].text, // Contact
//     );

//     // Navigate to template selection page after successfully saving all data
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(
//     //     builder: (context) => TemplateSelectionPage(),
//     //   ),
//     // );
//   }

//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       await saveAllApi(); // Save the details via the POST API
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) =>
//               TemplateSelectionPage(), // Navigate to template selection
//         ),
//       );
//     }
//   }

//   Widget _buildTextField(String label, TextEditingController controller,
//       int sectionIndex, int fieldIndex, List<Map<String, dynamic>> fields) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(labelText: label),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your $label';
//               }
//               return null;
//             },
//           ),
//         ),
//         Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (fieldIndex > 0) // Up arrow only for fields not at the top
//               IconButton(
//                 icon: Icon(Icons.arrow_upward, color: Colors.orange, size: 20),
//                 padding: EdgeInsets.zero,
//                 onPressed: () {},
//               ),
//             if (fieldIndex <
//                 fields.length -
//                     1) // Down arrow only for fields not at the bottom
//               IconButton(
//                 icon:
//                     Icon(Icons.arrow_downward, color: Colors.orange, size: 20),
//                 padding: EdgeInsets.zero,
//                 onPressed: () {},
//                 // _moveFieldDown(sectionIndex, fieldIndex),
//               ),
//           ],
//         ),
//         IconButton(
//           icon: Icon(Icons.delete, color: Colors.red, size: 20),
//           padding: EdgeInsets.zero,
//           onPressed: () {},
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
//         const SizedBox(height: 8), // Reduced height
//         ...List.generate(fields.length, (fieldIndex) {
//           return _buildTextField(
//               fields[fieldIndex]['label'],
//               fields[fieldIndex]['controller'],
//               sectionIndex,
//               fieldIndex,
//               fields);
//         }),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Create Biodata'),
//         backgroundColor: const Color(0xFFFF5507),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: biodataTitleController,
//                   decoration: const InputDecoration(
//                     labelText: 'Biodata Title',
//                     hintText: '|| Shree Ganeshaya Namah ||',
//                   ),
//                 ),
//                 const SizedBox(height: 18),
//                 ...sectionFields.entries.map((entry) {
//                   int index = sectionFields.entries.toList().indexOf(entry);
//                   return _buildSection(entry.key, entry.value, index);
//                 }).toList(),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _submitForm,
//                   child: const Text('Save All'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFFF5507),
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                     minimumSize: Size(double.infinity, 50), // Full-width button
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     biodataTitleController.dispose();
//     for (var section in sectionFields.values) {
//       for (var field in section) {
//         (field['controller'] as TextEditingController).dispose();
//       }
//     }
//     super.dispose();
//   }
// }

// void _moveFieldUp(int sectionIndex, int fieldIndex) {
//   // Ensure valid index and swap the fields
//   if (fieldIndex > 0) {
//     setState(() {
//       var fields = sectionFields.values.toList()[sectionIndex];
//       var fieldToMove = fields[fieldIndex];

//       // Swap with the previous field
//       fields[fieldIndex] = fields[fieldIndex - 1];
//       fields[fieldIndex - 1] = fieldToMove;
//     });
//   }
// }

// void _moveFieldDown(int sectionIndex, int fieldIndex) {
//   // Ensure valid index and swap the fields
//   if (fieldIndex < sectionFields.values.toList()[sectionIndex].length - 1) {
//     setState(() {
//       var fields = sectionFields.values.toList()[sectionIndex];
//       var fieldToMove = fields[fieldIndex];

//       // Swap with the next field
//       fields[fieldIndex] = fields[fieldIndex + 1];
//       fields[fieldIndex + 1] = fieldToMove;
//     });
//   }
// }

// void _deleteField(int sectionIndex, int fieldIndex) {
//   // Remove the specified field only if there's more than one field
//   if (sectionFields.values.toList()[sectionIndex].length > 1) {
//     setState(() {
//       sectionFields.values.toList()[sectionIndex].removeAt(fieldIndex);
//     });
//   } else {
//     // Optionally, show an alert if trying to delete the last field
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Cannot delete the last field.")),
//     );
//   }
// }

//     Expanded(
//       child: ElevatedButton.icon(
//         onPressed: () {
//           ListView.builder(
//       scrollDirection: Axis.vertical,
//       shrinkWrap:
//           true, // Ensure the ListView does not take infinite height
//       physics:
//           const NeverScrollableScrollPhysics(), // Disable scrolling for the ListView
//       itemCount: controller.userData!['data'].length,
//       itemBuilder: (context, index) {
//         // Extract the individual biodata from the list
//         final biodata = controller.userData!['data'][index];

//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 5),
//           child: _buildBiodataCard(context, biodata),
//         );
//       },
//     );
//         },
//         icon: const Icon(Icons.add, size: 18),
//         label: const Text(
//           'Add Sample',
//           style: TextStyle(fontSize: 14),
//         ),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFFFF5507),
//           foregroundColor: Colors.white,
//           padding: const EdgeInsets.symmetric(
//               horizontal: 8, vertical: 10),
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10)),
//         ),
//       ),
//     ),
//   ],
// ),
// const SizedBox(height: 15),
// Consumer<ShowbiodataController>(
//   builder: (context, controller, _) {
//     // Show loading indicator while data is being fetched
//     if (controller.loading) {
//       return const Center(
//         child: CircularProgressIndicator(), // Loading indicator
//       );
//     }

//     // Check if userData or data is null
//     if (controller.userData == null ||
//         controller.userData!['data'] == null ||
//         controller.userData!['data'].isEmpty) {
//       return const Center(
//         child: Text('No data available'),
//       );
//     }

//     // Show ListView if data is available
//     return ListView.builder(
//       scrollDirection: Axis.vertical,
//       shrinkWrap:
//           true, // Ensure the ListView does not take infinite height
//       physics:
//           const NeverScrollableScrollPhysics(), // Disable scrolling for the ListView
//       itemCount: controller.userData!['data'].length,
//       itemBuilder: (context, index) {
//         // Extract the individual biodata from the list
//         final biodata = controller.userData!['data'][index];

//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 5),
//           child: _buildBiodataCard(context, biodata),
//         );
//       },
//     );
//   },
// ),

// Future<dynamic?> personalDetailsApi(
//   String title,
//   String userName,
//   String caste,
//   String subCaste,
//   String birthDate,
//   String birthTime,
//   String birthPlace,
//   String height,
//   String bloodGroup,
//   String gothra,
//   String complexion,
// ) async {
//   Uri url = Uri.parse(
//       "https://techfluxsolutions.com/royal_maratha/api/users/personal_details");

//   // Get the saved matri_id from SharedPreferences
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   String? matriId = pref.getString("matri_id");

//   log("Matri ID: $matriId");

//   // Prepare the payload for the API request
//   var payload = {
//     'title': title,
//     'username': userName,
//     'caste': caste,
//     'subcaste': subCaste,
//     'birthdate': birthDate,
//     'birthtime': birthTime,
//     'birthplace': birthPlace,
//     'height': height,
//     'blood_group': bloodGroup,
//     'gothra': gothra,
//     'complexion': complexion,
//     'matri_id': matriId, // Send the saved matri_id
//   };

//   log("Payload: $payload"); // Log payload to debug

//   try {
//     // Make the HTTP POST request
//     http.Response res = await http.post(
//       url,
//       body: jsonEncode(payload),
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//     ).timeout(const Duration(seconds: 10), onTimeout: () {
//       throw TimeoutException(
//           "The connection has timed out, please try again later.");
//     });

//     // Handle response
//     if (res.statusCode == 200) {
//       log("Request successful: ${res.statusCode}");
//       log("Response: ${res.body}");

//       var responseData = jsonDecode(res.body);

//       if (responseData['response'] == true) {
//         // Extract and save biodata_id if response is successful
//         String newBiodataId = responseData['data']['biodata_id'].toString();
//         await pref.setInt("biodata_id", int.parse(newBiodataId));
//         log("New biodata_id saved: $newBiodataId");
//         return responseData;
//       } else {
//         log("Error: ${responseData['error_msg']}");
//       }
//     } else {
//       log("Failed: ${res.statusCode}");
//       log("Error response: ${res.body}");
//     }
//   } catch (e, t) {
//     log("Exception occurred: $e");
//     log("Stacktrace: $t");
//   }
//   return null;
// }

// if (canSwap)
//   Row(
//     children: [
//       if (label == 'Devak')
//         IconButton(
//           icon: Icon(Icons.keyboard_arrow_down,
//               color: Colors.orange, size: 30),
//           onPressed: () =>
//               _moveFieldDown(sectionIndex, fieldIndex),
//         )
//       else if (label == 'Complexion')
//         IconButton(
//           icon: Icon(Icons.keyboard_arrow_up,
//               color: Colors.orange, size: 30),
//           onPressed: () => _moveFieldUp(sectionIndex, fieldIndex),
//         )
//       else
//         Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             GestureDetector(
//               child: Icon(Icons.keyboard_arrow_up,
//                   color: Colors.orange, size: 30),
//               onTap: () => _moveFieldUp(sectionIndex, fieldIndex),
//             ),
//             GestureDetector(
//               child: Icon(Icons.keyboard_arrow_down,
//                   color: Colors.orange, size: 30),
//               onTap: () =>
//                   _moveFieldDown(sectionIndex, fieldIndex),
//             ),
//           ],
//         ),
//       IconButton(
//         icon: Icon(Icons.delete, color: Colors.red, size: 30),
//         padding: EdgeInsets.zero,
//         onPressed: () => _deleteField(sectionIndex, fieldIndex),
//       ),
//     ],
//   ),

// Future<void> saveAllApi() async {
//   String? imagePath = _imageFile?.path;

//   // Personal Details API
//   Map<String, dynamic> data =
//       await EducationDetailsRequest().personalDetailsApi(
//     biodataTitleController.text,
//     sectionFields['Personal Details']![0]['controller'].text, // Full Name
//     sectionFields['Personal Details']![1]['controller'].text, // Caste
//     sectionFields['Personal Details']![2]['controller'].text, // Subcaste
//     sectionFields['Personal Details']![3]['controller'].text, // Birth Date
//     sectionFields['Personal Details']![4]['controller'].text, // Birth Time
//     sectionFields['Personal Details']![5]['controller'].text, // Birth Place
//     sectionFields['Personal Details']![6]['controller'].text, // Height
//     sectionFields['Personal Details']![7]['controller'].text, // Blood group
//     sectionFields['Personal Details']![8]['controller'].text, // Gothra
//     sectionFields['Personal Details']![9]['controller'].text, // Complexion
//   );

//   print(data.runtimeType);

//   id = EducationDetailsRequest().newBiodataId.toString();
//   print("id---------$id");

//   // Education and Occupation API
//   await EducationDetailsRequest().educationDetailsApi(
//     sectionFields['Education and Occupation Details']![0]['controller'].text,
//     99.00,
//     sectionFields['Education and Occupation Details']![2]['controller']
//         .text, // Occupation
//     sectionFields['Education and Occupation Details']![3]['controller'].text,
//   );

//   // Family Details API
//   await EducationDetailsRequest().familyDetailsApi(
//     sectionFields['Family Details']![0]['controller'].text, // Father's Name
//     sectionFields['Family Details']![1]['controller']
//         .text, // Father's Occupation
//     sectionFields['Family Details']![2]['controller'].text, // Mobile No.
//     sectionFields['Family Details']![3]['controller'].text, // Mother's Name
//     sectionFields['Family Details']![4]['controller']
//         .text, // Mother's Occupation
//     sectionFields['Family Details']![5]['controller'].text, // Total Brothers
//     sectionFields['Family Details']![6]['controller'].text, // Total Sisters
//     sectionFields['Family Details']![7]['controller']
//         .text, // Residential Address
//     sectionFields['Family Details']![8]['controller']
//         .text, // Maternal Uncle Name
//     sectionFields['Family Details']![9]['controller'].text, // Native Place
//     sectionFields['Family Details']![10]['controller']
//         .text, // Surname Relatives
//   );

//   // Other Details API
//   await EducationDetailsRequest().otherDetailsApi(
//     sectionFields['Other Details']![0]['controller'].text, // Property
//     sectionFields['Other Details']![1]['controller'].text, // Expectations
//     sectionFields['Other Details']![2]['controller'].text, // Email
//     sectionFields['Other Details']![3]['controller'].text, // Contact
//   );

//   if (_imageFile != null) {
//     File imageFile =
//         File(_imageFile!.path); // Convert the String path to a File
//     await EducationDetailsRequest().insertImageApi(imageFile);
//   }
// }

//     body: Container(
//   padding: EdgeInsets.symmetric(horizontal: 8),
//   child: SingleChildScrollView(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         10.heightBox,
//         TextFormField(
//           controller: biodataTitleController,
//           decoration: const InputDecoration(labelText: 'Biodata Title'),
//         ),
//         10.heightBox,
//         Center(
//           child: GestureDetector(
//             onTap: _showImageSourceDialog,
//             child: Stack(
//               children: [
//                 Container(
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: ClipOval(
//                     child: _imageFile == null
//                         ? Image.asset(
//                             'assets/images/sample_image.jpg',
//                             fit: BoxFit.cover,
//                             height: 100,
//                             width: 100,
//                           )
//                         : Image.file(
//                             File(_imageFile!.path),
//                             fit: BoxFit.cover,
//                             height: 100,
//                             width: 100,
//                           ),
//                   ),
//                 ),
//                 Positioned(
//                   right: 0,
//                   bottom: 0,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       border: Border.all(color: Colors.grey),
//                     ),
//                     padding: const EdgeInsets.all(4.0),
//                     child: Icon(
//                       Icons.edit,
//                       color: Colors.black,
//                       size: 20,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         10.heightBox,
//         "Personal Details"
//             .text
//             .size(20)
//             .color(Colors.black)
//             .fontWeight(FontWeight.bold)
//             .make(),
//         10.heightBox,
//         TextFormField(
//           decoration: InputDecoration(
//             labelText: "Full Name",
//           ),
//         ),
//         10.heightBox,
//         Row(
//           children: [
//             Expanded(
//               child: GestureDetector(
//                 onTap: () => _showCasteDialog(casteCo),
//                 child: AbsorbPointer(
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       fillColor: Colors.white,
//                       filled: true,
//                       labelText: "Caste",
//                     ),
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               ),
//             ),
//             5.widthBox,
//             Expanded(
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "Sub Caste",
//                 ),
//               ),
//             ),
//           ],
//         ),
//         10.heightBox,
//         Text("Birth Date"),
//         const SizedBox(height: 5),
//         _buildDateDropdown(),
//         10.heightBox,
//         GestureDetector(
//           onTap: () => _selectTime(context), // Call the time picker on tap
//           child: AbsorbPointer(
//             child: TextFormField(
//               controller: birthTimeController, // Controller for Birth Time
//               decoration: InputDecoration(
//                 labelText: "Birth Time",
//               ),
//             ),
//           ),
//         ),
//         10.heightBox,
//         GestureDetector(
//           onTap: () => _showHeightDialog(height),
//           child: AbsorbPointer(
//             child: TextFormField(
//               controller: height,
//               style: TextStyle(color: Colors.black),
//               decoration: InputDecoration(
//                 fillColor: Colors.white,
//                 filled: true,
//                 labelText: "Height",
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 5),
//         _buildBloodGroupDropdown(),
//         10.heightBox,

//         // Start of Devak/Gotra and Complexion fields with swapping functionality
//         if (canSwap)
//           Row(
//             children: [
//               Expanded(
//                 flex: 8,
//                 child: SizedBox(
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       labelText: "Devak/Gotra",
//                     ),
//                   ),
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(Icons.keyboard_arrow_down,
//                     color: Colors.orange, size: 30),
//                 onPressed: () => _swapFields('Devak'),
//               ),
//               IconButton(
//                 icon: Icon(Icons.delete, color: Colors.red, size: 30),
//                 onPressed: () => _deleteField('Devak'),
//               ),
//             ],
//           ),
//         10.heightBox,
//         Row(
//           children: [
//             Expanded(
//               flex: 8,
//               child: SizedBox(
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: "Complexion",
//                   ),
//                 ),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.keyboard_arrow_up,
//                   color: Colors.orange, size: 30),
//               onPressed: () => _swapFields('Complexion'),
//             ),
//             IconButton(
//               icon: Icon(Icons.delete, color: Colors.red, size: 30),
//               onPressed: () => _deleteField('Complexion'),
//             ),
//           ],
//         ),
//         // End of Devak/Gotra and Complexion fields
//       ],
//     ),
//   ),
// )

//       Widget _buildMoveFieldButtons(
//     int sectionIndex, int fieldIndex, String label) {
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       IconButton(
//         icon: Icon(Icons.keyboard_arrow_up, color: Colors.black, size: 30),
//         onPressed: () => _moveFieldUp(sectionIndex, fieldIndex),
//       ),
//       IconButton(
//         icon: Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 30),
//         onPressed: () => _moveFieldDown(sectionIndex, fieldIndex),
//       ),
//     ],
//   );
// }

// Widget _buildDefaultTextField(
//     String label, TextEditingController controller) {
//   return TextFormField(
//     controller: controller,
//     decoration: InputDecoration(
//       labelText: label,
//       filled: true,
//       fillColor: Colors.white,
//     ),
//     validator: (value) {
//       if (value == null || value.isEmpty) {
// //         return 'Please enter your $label';
// //       }
// //       return null;
// //     },
// //     style: TextStyle(color: Colors.black),
// //   );
// // }

// Widget _buildSwapDeleteIcons(int sectionIndex, int fieldIndex) {
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       IconButton(
//         icon: Icon(Icons.keyboard_arrow_up,
//             color: Colors.orange, size: 30), // Increased size
//         padding: EdgeInsets.zero,
//         onPressed: () => _moveFieldUp(sectionIndex, fieldIndex),
//       ),
//       IconButton(
//         icon: Icon(Icons.keyboard_arrow_down,
//             color: Colors.orange, size: 30), // Increased size
//         padding: EdgeInsets.zero,
//         onPressed: () => _moveFieldDown(sectionIndex, fieldIndex),
//       ),
//       IconButton(
//         icon: Icon(Icons.delete, color: Colors.red, size: 30), // Increased size
//         padding: EdgeInsets.zero,
//         onPressed: () => _deleteField(sectionIndex, fieldIndex),
//       ),
//     ],
//   );
// }


  // void _moveFieldUp(int sectionIndex, int fieldIndex) {
  //   if (fieldIndex > 0) {
  //     setState(() {
  //       final temp = sectionFields.values.elementAt(sectionIndex)[fieldIndex];
  //       sectionFields.values.elementAt(sectionIndex)[fieldIndex] =
  //           sectionFields.values.elementAt(sectionIndex)[fieldIndex - 1];
  //       sectionFields.values.elementAt(sectionIndex)[fieldIndex - 1] = temp;
  //     });
  //   }
  // }

  // void _moveFieldDown(int sectionIndex, int fieldIndex) {
  //   if (fieldIndex < sectionFields.values.elementAt(sectionIndex).length - 1) {
  //     setState(() {
  //       final temp = sectionFields.values.elementAt(sectionIndex)[fieldIndex];
  //       sectionFields.values.elementAt(sectionIndex)[fieldIndex] =
  //           sectionFields.values.elementAt(sectionIndex)[fieldIndex + 1];
  //       sectionFields.values.elementAt(sectionIndex)[fieldIndex + 1] = temp;
  //     });
  //   }
  // }

  //home screen code
  // // // // import 'dart:convert';

// // // // import 'package:bio_data_maker/controller/showbiodata_controller.dart';
// // // // import 'package:bio_data_maker/screens/AllDetailsPage.dart';
// // // // import 'package:bio_data_maker/screens/login_form.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:http/http.dart' as http;
// // // // import 'package:path/path.dart';
// // // // import 'package:provider/provider.dart';
// // // // import 'package:share_plus/share_plus.dart';
// // // // import 'package:shared_preferences/shared_preferences.dart';

// // // // class HomePage extends StatefulWidget {
// // // //   const HomePage({super.key});

// // // //   @override
// // // //   _HomePageState createState() => _HomePageState();
// // // // }

// // // // class _HomePageState extends State<HomePage>
// // // //     with SingleTickerProviderStateMixin {
// // // //   late TabController _tabController;
// // // //   String? _authToken;

// // // //   // List of available languages
// // // //   // final List<String> _languages = [
// // // //   //   'English',
// // // //   //   'Hindi',
// // // //   //   'Bengali',
// // // //   //   'Gujarati',
// // // //   //   'Kannada',
// // // //   //   'Marathi'
// // // //   // ];
// // // //   String _selectedLanguage = 'English';

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _tabController = TabController(length: 6, vsync: this);
// // // //     // _fetchBiodataInfo();
// // // //     // print("Hellllllooo");
// // // //     // _test();
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _tabController.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   void _handleMenuItemClick(String value) {
// // // //     switch (value) {
// // // //       case 'share':
// // // //         _shareApp();
// // // //         // Handle share app action
// // // //         break;
// // // //       case 'products':
// // // //         // Handle our products action
// // // //         break;
// // // //       case 'delete':
// // // //         _showDeleteAccountConfirmation(context);
// // // //         break;
// // // //       case 'logout':
// // // //         _handleLogout(context);
// // // //         break;
// // // //     }
// // // //   }

// // // //   Future<void> logout(context) async {
// // // //     // Access the SharedPreferences instance
// // // //     SharedPreferences prefs = await SharedPreferences.getInstance();

// // // //     // Clear the 'tokenKey' and 'isLoggedIn' fields
// // // //     await prefs.remove('token_key'); // Remove the token
// // // //     await prefs.setBool('isLoggedIn', false); // Set isLoggedIn to false

// // // //     // Navigate back to the login page
// // // //     Navigator.of(context).pushReplacementNamed('/login');
// // // //   }

// // // //   void _shareApp() {
// // // //     const String appLink = 'https://Instagram.com';
// // // //     const String message = 'Check out this awesome app: $appLink';
// // // //     Share.share(message);
// // // //   }

// // // //   void _showDeleteAccountConfirmation(context) {
// // // //     showDialog(
// // // //       context: context,
// // // //       builder: (BuildContext context) {
// // // //         return AlertDialog(
// // // //           title: const Text('Delete Account'),
// // // //           content: const Text(
// // // //               'Are you sure you want to delete your account? This action cannot be undone.'),
// // // //           actions: <Widget>[
// // // //             TextButton(
// // // //               child: const Text('Cancel'),
// // // //               onPressed: () {
// // // //                 Navigator.of(context).pop();
// // // //               },
// // // //             ),
// // // //             TextButton(
// // // //               child: const Text('Delete'),
// // // //               onPressed: () async {
// // // //                 Navigator.of(context).pop();
// // // //                 await _deleteAccount(context);
// // // //               },
// // // //             ),
// // // //           ],
// // // //         );
// // // //       },
// // // //     );
// // // //   }

// // // //   Future<void> _deleteAccount(context) async {
// // // //     final url = Uri.parse(
// // // //         'https://techfluxsolutions.com/royal_maratha/api/users/delete');

// // // //     try {
// // // //       final response = await http.delete(
// // // //         url,
// // // //         headers: {'Authorization': 'Bearer $_authToken'},
// // // //       );

// // // //       if (response.statusCode == 200) {
// // // //         final data = json.decode(response.body);

// // // //         // Ensure 'success' is a boolean and handle null values
// // // //         bool success = data['success'] ?? false;

// // // //         if (success) {
// // // //           // Clear SharedPreferences and navigate to login
// // // //           SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //           await prefs.clear();
// // // //           Navigator.of(context).pushReplacementNamed('/login');
// // // //         } else {
// // // //           // Handle failure case with a message if available
// // // //           String message = data['message'] ?? 'Failed to delete account';
// // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // //             SnackBar(content: Text(message)),
// // // //           );
// // // //         }
// // // //       } else {
// // // //         // Handle HTTP error
// // // //         ScaffoldMessenger.of(context).showSnackBar(
// // // //           SnackBar(
// // // //               content:
// // // //                   Text('Failed to delete account: ${response.statusCode}')),
// // // //         );
// // // //       }
// // // //     } catch (e) {
// // // //       print('Error deleting account: $e');
// // // //       ScaffoldMessenger.of(context).showSnackBar(
// // // //         const SnackBar(
// // // //             content: Text('An error occurred while deleting account')),
// // // //       );
// // // //     }
// // // //   }

// // // //   void _handleLogout(context) async {
// // // //     SharedPreferences prefs = await SharedPreferences.getInstance();

// // // //     await prefs.remove('token');
// // // //     await prefs.remove('matri_id');
// // // //     await prefs.setBool('isLoggedIn', false);

// // // //     Navigator.of(context).pushAndRemoveUntil(
// // // //       MaterialPageRoute(
// // // //           builder: (context) => LoginForm(
// // // //                 onLoginSuccess: () {},
// // // //               )),
// // // //       (Route<dynamic> route) => false,
// // // //     );
// // // //   }

// // // //   void _test() {
// // // //     print(
// // // //         "hjgddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
// // // //     return;
// // // //   }

// // // //   // Future<void> _getSharedPreferences() async {
// // // //   //   try {
// // // //   //     SharedPreferences prefs = await SharedPreferences.getInstance();

// // // //   //     final authToken = prefs.getString('token_key');
// // // //   //     final matriId = prefs.getString('matriId');

// // // //   //     setState(() {
// // // //   //       _authToken = authToken;
// // // //   //       _matriId = matriId;
// // // //   //     });
// // // //   //   } catch (e) {
// // // //   //     print('Error retrieving SharedPreferences: $e');
// // // //   //   }
// // // //   // }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text(
// // // //           'Biodata Maker',
// // // //           style: TextStyle(
// // // //             fontSize: 26.0,
// // // //             fontWeight: FontWeight.bold,
// // // //             color: Colors.white,
// // // //           ),
// // // //           textAlign: TextAlign.center,
// // // //         ),
// // // //         backgroundColor: const Color(0xFFFF5508),
// // // //         automaticallyImplyLeading: false,
// // // //         actions: [
// // // //           PopupMenuButton<String>(
// // // //             onSelected: _handleMenuItemClick,
// // // //             itemBuilder: (BuildContext context) {
// // // //               return [
// // // //                 const PopupMenuItem(
// // // //                   value: 'languages',
// // // //                   child: Text('Languages'),
// // // //                 ),
// // // //                 const PopupMenuItem(
// // // //                   value: 'share',
// // // //                   child: Text('Share App'),
// // // //                 ),
// // // //                 const PopupMenuItem(
// // // //                   value: 'Rate App',
// // // //                   child: Text('Rate App'),
// // // //                 ),
// // // //                 const PopupMenuItem(
// // // //                   value: 'Feedback',
// // // //                   child: Text('Feedback'),
// // // //                 ),
// // // //                 const PopupMenuItem(
// // // //                   value: 'Privacy Policy',
// // // //                   child: Text('Privacy Policy'),
// // // //                 ),
// // // //                 const PopupMenuItem(
// // // //                   value: 'Customer Care',
// // // //                   child: Text('Customer Care'),
// // // //                 ),
// // // //                 const PopupMenuItem(
// // // //                   value: 'delete',
// // // //                   child: Text('Delete Account'),
// // // //                 ),
// // // //                 const PopupMenuItem(
// // // //                   value: 'logout',
// // // //                   child: Text('Logout'),
// // // //                 ),
// // // //               ];
// // // //             },
// // // //             icon: const Icon(Icons.menu, color: Colors.white),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       body: Padding(
// // // //         padding: const EdgeInsets.all(16.0),
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.start,
// // // //           children: <Widget>[
// // // //             const SizedBox(height: 8),
// // // //             Container(
// // // //               decoration: BoxDecoration(
// // // //                 color: Colors.white,
// // // //                 borderRadius: BorderRadius.circular(15),
// // // //                 boxShadow: [
// // // //                   BoxShadow(
// // // //                     color: Colors.grey.withOpacity(0.5),
// // // //                     spreadRadius: 2,
// // // //                     blurRadius: 5,
// // // //                     offset: const Offset(0, 3),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
// // // //               child: Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // //                 children: [
// // // //                   ElevatedButton.icon(
// // // //                     onPressed: () {
// // // //                       Navigator.push(
// // // //                         context,
// // // //                         MaterialPageRoute(
// // // //                             builder: (context) => AllDetailsPage()),
// // // //                       );
// // // //                     },
// // // //                     icon: const Icon(Icons.brush),
// // // //                     label: const Text('Create Biodata'),
// // // //                     style: ElevatedButton.styleFrom(
// // // //                       backgroundColor: const Color(0xFFFF5507),
// // // //                       foregroundColor: Colors.white,
// // // //                       padding: const EdgeInsets.symmetric(
// // // //                           horizontal: 10, vertical: 15),
// // // //                       shape: RoundedRectangleBorder(
// // // //                         borderRadius: BorderRadius.circular(10),
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                   ElevatedButton.icon(
// // // //                     onPressed: () {
// // // //                       setState(() {
// // // //                         // _showBannerImage = false;
// // // //                       });
// // // //                     },
// // // //                     icon: const Icon(Icons.add),
// // // //                     label: const Text('Add Sample'),
// // // //                     style: ElevatedButton.styleFrom(
// // // //                       backgroundColor: const Color(0xFFFF5507),
// // // //                       foregroundColor: Colors.white,
// // // //                       padding: const EdgeInsets.symmetric(
// // // //                           horizontal: 10, vertical: 15),
// // // //                       shape: RoundedRectangleBorder(
// // // //                         borderRadius: BorderRadius.circular(10),
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //             SizedBox(height: 15),
// // // //             _buildBiodataCard(),

// // // //             // ElevatedButton(
// // // //             //   onPressed: () {
// // // //             //     Navigator.push(
// // // //             //       context,
// // // //             //       MaterialPageRoute(
// // // //             //         builder: (context) => PaymentScreen(),
// // // //             //       ),
// // // //             //     );
// // // //             //   },
// // // //             //   child: Text("payment"),
// // // //             // )
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // Widget _buildBiodataCard() {
// // // //   Map<String, dynamic> dummyAccount = {
// // // //     'profile_photo': 'https://example.com/dummy_photo.jpeg', // Dummy image URL
// // // //     'firstname':,
// // // //     'lastname': 'Doe',
// // // //     'caste': 'Maratha',
// // // //     'dob': '01-01-1990',
// // // //   };

// // // //   return Consumer<ShowbiodataController>(
// // // //     builder: (context,controller,_) {
// // // //       return Card(
// // // //         elevation: 5,
// // // //         shape: RoundedRectangleBorder(
// // // //           borderRadius: BorderRadius.circular(10),
// // // //         ),
// // // //         child: Padding(
// // // //           padding: const EdgeInsets.all(8.0),
// // // //           child: Column(
// // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // //             children: [
// // // //               ListTile(
// // // //                 leading: CircleAvatar(
// // // //                   backgroundImage: NetworkImage(
// // // //                       dummyAccount['profile_photo'] ?? 'assets/images/dummy.jpeg'),
// // // //                   radius: 30,
// // // //                 ),
// // // //                 title: Text(
// // // //                   '${dummyAccount['firstname']} ${dummyAccount['lastname']}',
// // // //                   style: const TextStyle(fontWeight: FontWeight.bold),
// // // //                 ),
// // // //                 subtitle: Text(
// // // //                     'Caste: ${dummyAccount['caste']} DOB: ${dummyAccount['dob']}'),
// // // //                 trailing: ElevatedButton(
// // // //                   onPressed: () {
// // // //                     // Navigator.push(
// // // //                     //   context,
// // // //                     //   MaterialPageRoute(builder: (context) => AllDetailsPage()),
// // // //                     // );
// // // //                   },
// // // //                   style: ElevatedButton.styleFrom(
// // // //                     backgroundColor: Colors.white,
// // // //                     // foregroundColor: AppTheme.primaryColor(0xFFb27409),
// // // //                     // side: const BorderSide(color: Color(0xFFb27409)),
// // // //                     shape: RoundedRectangleBorder(
// // // //                       borderRadius: BorderRadius.circular(20),
// // // //                     ),
// // // //                   ),
// // // //                   child: const Text('Edit'),
// // // //                 ),
// // // //               ),
// // // //               const Divider(),
// // // //               Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //                 children: [
// // // //                   _buildBioOptionButton(Icons.edit, 'Edit', () {
// // // //                     // Navigate to edit page
// // // //                   }),
// // // //                   _buildBioOptionButton(Icons.copy, 'Copy', () {
// // // //                     // Implement copy functionality
// // // //                   }),
// // // //                   _buildBioOptionButton(Icons.delete, 'Delete', () {
// // // //                     // Implement delete functionality
// // // //                   }),
// // // //                   _buildBioOptionButton(Icons.file_copy, 'Template', () {
// // // //                     // Implement template change functionality
// // // //                   }),
// // // //                 ],
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       );
// // // //     }
// // // //   );
// // // // }

// // // // Widget _buildBioOptionButton(
// // // //     IconData icon, String label, VoidCallback onPressed) {
// // // //   return Column(
// // // //     children: [
// // // //       IconButton(
// // // //         icon: Icon(icon, color: Colors.grey[700]),
// // // //         onPressed: onPressed,
// // // //       ),
// // // //       Text(label, style: TextStyle(color: Colors.grey[700])),
// // // //     ],
// // // //   );
// // // // }

// // // import 'dart:convert';

// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'package:provider/provider.dart';
// // // import 'package:share_plus/share_plus.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';

// // // import '../../controller/showbiodata_controller.dart';
// // // import '../AllDetailsPage.dart';
// // // import '../login_form.dart';

// // // class HomePage extends StatefulWidget {
// // //   const HomePage({super.key});

// // //   @override
// // //   _HomePageState createState() => _HomePageState();
// // // }

// // // class _HomePageState extends State<HomePage>
// // //     with SingleTickerProviderStateMixin {
// // //   late TabController _tabController;
// // //   String? _authToken;

// // //   String _selectedLanguage = 'English';

// // //   Future<void> _getMatriIdAndFetchBiodata() async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     String? matriId =
// // //         prefs.getString('matri_id'); // Assuming 'matri_id' is stored

// // //     if (matriId != null) {
// // //       await _fetchBiodataInfo(matriId);
// // //     } else {
// // //       print('matriId is null. Unable to fetch biodata.');
// // //     }
// // //   }

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _tabController = TabController(length: 6, vsync: this);
// // //     _getAuthToken();
// // //     _getMatriIdAndFetchBiodata();
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _tabController.dispose();
// // //     super.dispose();
// // //   }

// // //   Future<void> _getAuthToken() async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     setState(() {
// // //       _authToken = prefs.getString('token_key');
// // //     });
// // //   }

// // //   Future<void> _fetchBiodataInfo(String matriId) async {
// // //     final controller =
// // //         Provider.of<ShowbiodataController>(context, listen: false);
// // //     // Call the method to fetch biodata here
// // //     await controller.fetchBiodata(); // Pass necessary parameters if needed
// // //   }

// // //   void _handleMenuItemClick(String value) {
// // //     switch (value) {
// // //       case 'share':
// // //         _shareApp();
// // //         break;
// // //       case 'RateApp':
// // //         _shareApp();
// // //         break;
// // //       case 'delete':
// // //         _showDeleteAccountConfirmation(context);
// // //         break;
// // //       case 'logout':
// // //         _handleLogout(context);
// // //         break;
// // //     }
// // //   }

// // //   _rateApp() {}

// // //   Future<void> _handleLogout(context) async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     await prefs.remove('token_key');
// // //     await prefs.remove('matri_id');
// // //     await prefs.setBool('isLoggedIn', false);
// // //     Navigator.of(context).pushAndRemoveUntil(
// // //       MaterialPageRoute(builder: (context) => LoginForm(onLoginSuccess: () {})),
// // //       (Route<dynamic> route) => false,
// // //     );
// // //   }

// // //   void _shareApp() {
// // //     const String appLink = 'https://Instagram.com';
// // //     const String message = 'Check out this awesome app: $appLink';
// // //     Share.share(message);
// // //   }

// // //   void _showDeleteAccountConfirmation(context) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           title: const Text('Delete Account'),
// // //           content: const Text(
// // //               'Are you sure you want to delete your account? This action cannot be undone.'),
// // //           actions: <Widget>[
// // //             TextButton(
// // //               child: const Text('Cancel'),
// // //               onPressed: () {
// // //                 Navigator.of(context).pop();
// // //               },
// // //             ),
// // //             TextButton(
// // //               child: const Text('Delete'),
// // //               onPressed: () async {
// // //                 Navigator.of(context).pop();
// // //                 await _deleteAccount(context);
// // //               },
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }

// // //   Future<void> _deleteAccount(context) async {
// // //     final url = Uri.parse(
// // //         'https://techfluxsolutions.com/royal_maratha/api/users/delete');

// // //     try {
// // //       final response = await http.delete(
// // //         url,
// // //         headers: {'Authorization': 'Bearer $_authToken'},
// // //       );

// // //       if (response.statusCode == 200) {
// // //         final data = json.decode(response.body);
// // //         bool success = data['success'] ?? false;

// // //         if (success) {
// // //           SharedPreferences prefs = await SharedPreferences.getInstance();
// // //           await prefs.clear();
// // //           Navigator.of(context).pushReplacementNamed('/login');
// // //         } else {
// // //           String message = data['message'] ?? 'Failed to delete account';
// // //           ScaffoldMessenger.of(context)
// // //               .showSnackBar(SnackBar(content: Text(message)));
// // //         }
// // //       } else {
// // //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// // //             content: Text('Failed to delete account: ${response.statusCode}')));
// // //       }
// // //     } catch (e) {
// // //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// // //           content: Text('An error occurred while deleting account')));
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text(
// // //           'Biodata Maker',
// // //           style: TextStyle(
// // //               fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.white),
// // //           textAlign: TextAlign.center,
// // //         ),
// // //         backgroundColor: const Color(0xFFFF5508),
// // //         actions: [
// // //           PopupMenuButton<String>(
// // //             color: Colors.white,
// // //             onSelected: _handleMenuItemClick,
// // //             itemBuilder: (BuildContext context) {
// // //               return [
// // //                 const PopupMenuItem(value: 'share', child: Text('Share App')),
// // //                 const PopupMenuItem(value: 'RateApp', child: Text('Rate App')),
// // //                 const PopupMenuItem(
// // //                     value: 'delete', child: Text('Delete Account')),
// // //                 const PopupMenuItem(value: 'logout', child: Text('Logout')),
// // //               ];
// // //             },
// // //             icon: const Icon(Icons.menu, color: Colors.white),
// // //           ),
// // //         ],
// // //       ),
// // //       body: Padding(
// // //         padding: EdgeInsets.symmetric(horizontal: 10),
// // //         child: SingleChildScrollView(
// // //           // Wrap the entire content in SingleChildScrollView
// // //           child: Column(
// // //             crossAxisAlignment:
// // //                 CrossAxisAlignment.start, // Align content to the start
// // //             children: <Widget>[
// // //               const SizedBox(height: 8),
// // //               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// // //                 Expanded(
// // //                   child: ElevatedButton.icon(
// // //                     onPressed: () {
// // //                       Navigator.push(
// // //                         context,
// // //                         MaterialPageRoute(
// // //                             builder: (context) => AllDetailsPage()),
// // //                       );
// // //                     },
// // //                     icon:
// // //                         const Icon(Icons.brush, size: 18), // Decrease icon size
// // //                     label: const Text(
// // //                       'Create Biodata',
// // //                       style: TextStyle(fontSize: 14), // Reduce font size
// // //                     ),
// // //                     style: ElevatedButton.styleFrom(
// // //                       backgroundColor: Colors.red,
// // //                       foregroundColor: Colors.white,
// // //                       padding: const EdgeInsets.symmetric(
// // //                           horizontal: 8, vertical: 10), // Reduce padding
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(
// // //                             8), // Adjust border radius if needed
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(width: 8),

// // //                 Consumer<ShowbiodataController>(
// // //                     builder: (context, controller, _) {
// // //                   return Expanded(
// // //                     child: ElevatedButton.icon(
// // //                       onPressed: () {
// // //                         // Add a dummy sample biodata to the controller's userData list
// // //                         controller.addDummyBiodata();
// // //                       },
// // //                       icon: const Icon(Icons.add, size: 18),
// // //                       label: const Text(
// // //                         'Add Sample',
// // //                         style: TextStyle(fontSize: 14),
// // //                       ),
// // //                       style: ElevatedButton.styleFrom(
// // //                         backgroundColor: const Color(0xFFFF5507),
// // //                         foregroundColor: Colors.white,
// // //                         padding: const EdgeInsets.symmetric(
// // //                             horizontal: 8, vertical: 10),
// // //                         shape: RoundedRectangleBorder(
// // //                             borderRadius: BorderRadius.circular(10)),
// // //                       ),
// // //                     ),
// // //                   );
// // //                 }),

// // // // The ListView that displays biodata
// // //                 const SizedBox(height: 15),
// // //                 Consumer<ShowbiodataController>(
// // //                   builder: (context, controller, _) {
// // //                     // Show loading indicator while data is being fetched
// // //                     if (controller.loading) {
// // //                       return const Center(
// // //                         child: CircularProgressIndicator(), // Loading indicator
// // //                       );
// // //                     }

// // //                     // Check if userData or data is null
// // //                     if (controller.userData == null ||
// // //                         controller.userData!['data'] == null ||
// // //                         controller.userData!['data'].isEmpty) {
// // //                       return const Center(
// // //                         child: Text('No data available'),
// // //                       );
// // //                     }

// // //                     // Wrap ListView.builder in Expanded to constrain its height properly
// // //                     return Expanded(
// // //                       child: ListView.builder(
// // //                         scrollDirection: Axis.vertical,
// // //                         shrinkWrap:
// // //                             true, // Ensure the ListView does not take infinite height
// // //                         itemCount: controller.userData!['data'].length,
// // //                         itemBuilder: (context, index) {
// // //                           // Extract the individual biodata from the list
// // //                           final biodata = controller.userData!['data'][index];

// // //                           return Padding(
// // //                             padding: const EdgeInsets.symmetric(vertical: 5),
// // //                             child: _buildBiodataCard(context, biodata),
// // //                           );
// // //                         },
// // //                       ),
// // //                     );
// // //                   },
// // //                 ),
// // //               ])
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // Widget _buildBiodataCard(BuildContext context, Map<String, dynamic> biodata) {
// // //   return Card(
// // //     color: Colors.white,
// // //     elevation: 5,
// // //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // //     child: Padding(
// // //       padding: const EdgeInsets.symmetric(
// // //           vertical: 4.0, horizontal: 8.0), // Adjusted padding
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           ListTile(
// // //             leading: CircleAvatar(
// // //               // backgroundImage: biodata['photo1'] != null &&
// // //               //         biodata['photo1'].isNotEmpty
// // //               //     ? NetworkImage(
// // //               //         biodata['photo1']) // Load from network if available
// // //               //     : AssetImage(
// // //               //         'assets/images/sample_image.jpg'), // Load from assets if not
// // //               radius: 30,
// // //             ),
// // //             title: Text(
// // //               '${biodata['username'] ?? 'John'}',
// // //               style: const TextStyle(fontWeight: FontWeight.bold),
// // //             ),
// // //             subtitle: Text(
// // //               'Caste: ${biodata['caste'] ?? 'Maratha'} \nHeight: ${biodata['dob'] ?? '01-01-1990'}',
// // //             ),
// // //           ),
// // //           // Remove Divider and add grey background to the row
// // //           Container(
// // //             color: Colors.grey[200], // Set the background color for the row
// // //             child: Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// // //               children: [
// // //                 _buildBioOptionButton(Icons.edit, 'Edit', () {
// // //                   // Navigate to edit page
// // //                   // Navigator.push(
// // //                   //   context,
// // //                   //   MaterialPageRoute(
// // //                   //     builder: (context) => AllDetailsPage(),
// // //                   //   ),
// // //                   // );
// // //                 }),
// // //                 _buildBioOptionButton(Icons.copy, 'Copy', () {
// // //                   // Implement copy functionality
// // //                 }),
// // //                 _buildBioOptionButton(Icons.delete, 'Delete', () {
// // //                   // Implement delete functionality
// // //                 }),
// // //                 _buildBioOptionButton(Icons.file_copy, 'Template', () {
// // //                   // Implement template change functionality
// // //                 }),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     ),
// // //   );
// // // }

// // // Widget _buildBioOptionButton(
// // //     IconData icon, String label, VoidCallback onPressed) {
// // //   return Container(
// // //     decoration: BoxDecoration(
// // //       color: Colors.grey[200], // Set the background color to a light grey
// // //       borderRadius:
// // //           BorderRadius.circular(8), // Add border radius for rounded corners
// // //     ),
// // //     child: Column(
// // //       children: [
// // //         IconButton(
// // //           icon: Icon(icon, color: Colors.grey[700]),
// // //           onPressed: onPressed,
// // //         ),
// // //         Text(label, style: TextStyle(color: Colors.grey[700])),
// // //       ],
// // //     ),
// // //   );
// // // }

// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:provider/provider.dart';
// // import 'package:share_plus/share_plus.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import '../../controller/showbiodata_controller.dart';
// // import '../AllDetailsPage.dart';
// // import '../login_form.dart';
// // import '../template_selection_page.dart';

// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});

// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage>
// //     with SingleTickerProviderStateMixin {
// //   late TabController _tabController;
// //   String? _authToken;
// //   String id = '';

// //   Future<void> _getMatriIdAndFetchBiodata() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     String? matriId =
// //         prefs.getString('matri_id'); // Assuming 'matri_id' is stored

// //     if (matriId != null) {
// //       await _fetchBiodataInfo(matriId);
// //     } else {
// //       print('matriId is null. Unable to fetch biodata.');
// //     }
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: 6, vsync: this);
// //     _getAuthToken();
// //     _getMatriIdAndFetchBiodata();
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   Future<void> _getAuthToken() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     setState(() {
// //       _authToken = prefs.getString('token_key');
// //     });
// //   }

// //   Future<void> _fetchBiodataInfo(String matriId) async {
// //     final controller =
// //         Provider.of<ShowbiodataController>(context, listen: false);
// //     await controller.fetchBiodata(); // Fetch biodata using the controller
// //   }

// //   void _handleMenuItemClick(String value) {
// //     switch (value) {
// //       case 'share':
// //         _shareApp();
// //         break;
// //       case 'RateApp':
// //         _rateApp();
// //         break;
// //       case 'delete':
// //         _showDeleteAccountConfirmation(context);
// //         break;
// //       case 'logout':
// //         _handleLogout(context);
// //         break;
// //     }
// //   }

// //   _rateApp() {
// //     // Functionality to rate the app
// //   }

// //   Future<void> _handleLogout(context) async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.remove('token_key');
// //     await prefs.remove('matri_id');
// //     await prefs.setBool('isLoggedIn', false);
// //     Navigator.of(context).pushAndRemoveUntil(
// //       MaterialPageRoute(builder: (context) => LoginForm(onLoginSuccess: () {})),
// //       (Route<dynamic> route) => false,
// //     );
// //   }

// //   void _shareApp() {
// //     const String appLink = 'https://Instagram.com';
// //     const String message = 'Check out this awesome app: $appLink';
// //     Share.share(message);
// //   }

// //   void _showDeleteAccountConfirmation(context) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: const Text('Delete Account'),
// //           content: const Text(
// //               'Are you sure you want to delete your account? This action cannot be undone.'),
// //           actions: <Widget>[
// //             TextButton(
// //               child: const Text('Cancel'),
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //             ),
// //             TextButton(
// //               child: const Text('Delete'),
// //               onPressed: () async {
// //                 Navigator.of(context).pop();
// //                 await _deleteAccount(context);
// //               },
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   Future<void> _deleteAccount(context) async {
// //     final url = Uri.parse(
// //         'https://techfluxsolutions.com/royal_maratha/api/users/delete');

// //     try {
// //       final response = await http.delete(
// //         url,
// //         headers: {'Authorization': 'Bearer $_authToken'},
// //       );

// //       if (response.statusCode == 200) {
// //         final data = json.decode(response.body);
// //         bool success = data['success'] ?? false;

// //         if (success) {
// //           SharedPreferences prefs = await SharedPreferences.getInstance();
// //           await prefs.clear();
// //           Navigator.of(context).pushReplacementNamed('/login');
// //         } else {
// //           String message = data['message'] ?? 'Failed to delete account';
// //           ScaffoldMessenger.of(context)
// //               .showSnackBar(SnackBar(content: Text(message)));
// //         }
// //       } else {
// //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //             content: Text('Failed to delete account: ${response.statusCode}')));
// //       }
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// //           content: Text('An error occurred while deleting account')));
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           'Biodata Maker',
// //           style: TextStyle(
// //               fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.white),
// //           textAlign: TextAlign.center,
// //         ),
// //         backgroundColor: const Color(0xFFFF5508),
// //         actions: [
// //           PopupMenuButton<String>(
// //             color: Colors.white,
// //             onSelected: _handleMenuItemClick,
// //             itemBuilder: (BuildContext context) {
// //               return [
// //                 const PopupMenuItem(value: 'share', child: Text('Share App')),
// //                 const PopupMenuItem(value: 'RateApp', child: Text('Rate App')),
// //                 const PopupMenuItem(
// //                     value: 'delete', child: Text('Delete Account')),
// //                 const PopupMenuItem(value: 'logout', child: Text('Logout')),
// //               ];
// //             },
// //             icon: const Icon(Icons.menu, color: Colors.white),
// //           ),
// //         ],
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 10),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: <Widget>[
// //             const SizedBox(height: 8),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Expanded(
// //                   child: ElevatedButton.icon(
// //                     onPressed: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                             builder: (context) => AllDetailsPage()),
// //                       );
// //                     },
// //                     icon: const Icon(Icons.brush, size: 18),
// //                     label: const Text(
// //                       'Create Biodata',
// //                       style: TextStyle(fontSize: 14),
// //                     ),
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Colors.red,
// //                       foregroundColor: Colors.white,
// //                       padding: const EdgeInsets.symmetric(
// //                           horizontal: 8, vertical: 10),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(8),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(width: 8),
// //                 Consumer<ShowbiodataController>(
// //                     builder: (context, controller, _) {
// //                   return Expanded(
// //                     child: ElevatedButton.icon(
// //                       onPressed: () {
// //                         controller.addDummyBiodata();
// //                       },
// //                       icon: const Icon(Icons.add, size: 18),
// //                       label: const Text(
// //                         'Add Sample',
// //                         style: TextStyle(fontSize: 14),
// //                       ),
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: const Color(0xFFFF5507),
// //                         foregroundColor: Colors.white,
// //                         padding: const EdgeInsets.symmetric(
// //                             horizontal: 8, vertical: 10),
// //                         shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(10)),
// //                       ),
// //                     ),
// //                   );
// //                 }),
// //               ],
// //             ),
// //             const SizedBox(height: 15),
// //             Expanded(
// //               child: Consumer<ShowbiodataController>(
// //                 builder: (context, controller, _) {
// //                   if (controller.loading) {
// //                     return const Center(
// //                       child: CircularProgressIndicator(),
// //                     );
// //                   }

// //                   if (controller.userData == null ||
// //                       controller.userData!['data'] == null ||
// //                       controller.userData!['data'].isEmpty) {
// //                     return const Center(
// //                       child: Text('No data available'),
// //                     );
// //                   }

// //                   return ListView.builder(
// //                     itemCount: controller.userData!['data'].length,
// //                     itemBuilder: (context, index) {
// //                       final biodata = controller.userData!['data'][index];
// //                       return Padding(
// //                         padding: const EdgeInsets.symmetric(vertical: 5),
// //                         child: _buildBiodataCard(context, biodata),
// //                       );
// //                     },
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // Widget _buildBiodataCard(BuildContext context, Map<String, dynamic> biodata) {
// //   String id = '';

// //   return Card(
// //     color: Colors.white,
// //     elevation: 5,
// //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //     child: Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           ListTile(
// //             leading: CircleAvatar(
// //               radius: 30,
// //             ),
// //             title: Text(
// //               '${biodata['username'] ?? 'John'}',
// //               style: const TextStyle(fontWeight: FontWeight.bold),
// //             ),
// //             subtitle: Text(
// //               'Caste: ${biodata['caste'] ?? 'Maratha'} \nDOB: ${biodata['dob'] ?? '01-01-1990'}',
// //             ),
// //           ),
// //           Container(
// //             color: Colors.grey[200],
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// //               children: [
// //                 _buildBioOptionButton(Icons.edit, 'Edit', () {
// //                   // Implement edit functionality
// //                 }),
// //                 _buildBioOptionButton(Icons.copy, 'Copy', () {
// //                   // Implement copy functionality
// //                 }),
// //                 _buildBioOptionButton(Icons.delete, 'Delete', () {
// //                   // Implement delete functionality
// //                 }),
// //                 _buildBioOptionButton(Icons.file_copy, 'Template', () {
// //                   // Implement template change functionality
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => TemplateSelectionPage(
// //                         id: id,
// //                       ),
// //                     ),
// //                   );
// //                 }),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     ),
// //   );
// // }

// // Widget _buildBioOptionButton(
// //     IconData icon, String label, VoidCallback onPressed) {
// //   return Column(
// //     children: [
// //       IconButton(
// //         icon: Icon(icon, color: Colors.grey[700]),
// //         onPressed: onPressed,
// //       ),
// //       Text(label, style: TextStyle(color: Colors.grey[700])),
// //     ],
// //   );
// // }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../controller/showbiodata_controller.dart';
// import '../AllDetailsPage.dart';
// import '../login_form.dart';
// import '../template_selection_page.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   String? _authToken;

//   Future<void> _getMatriIdAndFetchBiodata() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? matriId =
//         prefs.getString('matri_id'); // Assuming 'matri_id' is stored

//     if (matriId != null) {
//       await _fetchBiodataInfo(matriId);
//     } else {
//       print('matriId is null. Unable to fetch biodata.');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 6, vsync: this);
//     _getAuthToken();
//     _getMatriIdAndFetchBiodata();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   Future<void> _getAuthToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _authToken = prefs.getString('token_key');
//     });
//   }

//   Future<void> _fetchBiodataInfo(String matriId) async {
//     final controller =
//         Provider.of<ShowbiodataController>(context, listen: false);
//     await controller.fetchBiodata(); // Fetch biodata using the controller
//   }

//   void _handleMenuItemClick(String value) {
//     switch (value) {
//       case 'share':
//         _shareApp();
//         break;
//       case 'RateApp':
//         _rateApp();
//         break;
//       case 'delete':
//         _showDeleteAccountConfirmation(context);
//         break;
//       case 'logout':
//         _handleLogout(context);
//         break;
//     }
//   }

//   _rateApp() {
//     // Functionality to rate the app
//   }

//   Future<void> _handleLogout(context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token_key');
//     await prefs.remove('matri_id');
//     await prefs.setBool('isLoggedIn', false);
//     Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(builder: (context) => LoginForm(onLoginSuccess: () {})),
//       (Route<dynamic> route) => false,
//     );
//   }

//   void _shareApp() {
//     const String appLink = 'https://Instagram.com';
//     const String message = 'Check out this awesome app: $appLink';
//     Share.share(message);
//   }

//   void _showDeleteAccountConfirmation(context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Delete Account'),
//           content: const Text(
//               'Are you sure you want to delete your account? This action cannot be undone.'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('Delete'),
//               onPressed: () async {
//                 Navigator.of(context).pop();
//                 await _deleteAccount(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _deleteAccount(context) async {
//     final url = Uri.parse(
//         'https://techfluxsolutions.com/royal_maratha/api/users/delete');

//     try {
//       final response = await http.delete(
//         url,
//         headers: {'Authorization': 'Bearer $_authToken'},
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         bool success = data['success'] ?? false;

//         if (success) {
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           await prefs.clear();
//           Navigator.of(context).pushReplacementNamed('/login');
//         } else {
//           String message = data['message'] ?? 'Failed to delete account';
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text(message)));
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text('Failed to delete account: ${response.statusCode}')));
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('An error occurred while deleting account')));
//     }
//   }

//   String formatDate(String? date) {
//     if (date == null) return ''; // Handle null case
//     try {
//       // Parse the incoming date in 'yyyy-MM-dd HH:mm:ss' format
//       DateTime parsedDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);
//       // Format it to 'dd-MM-yyyy' (e.g., 12-06-2000)
//       return DateFormat('dd-MM-yyyy').format(parsedDate);
//     } catch (e) {
//       return date; // Return original date if parsing fails
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Biodata Maker',
//           style: TextStyle(
//               fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.white),
//           textAlign: TextAlign.center,
//         ),
//         backgroundColor: const Color(0xFFFF5508),
//         actions: [
//           PopupMenuButton<String>(
//             color: Colors.white,
//             onSelected: _handleMenuItemClick,
//             itemBuilder: (BuildContext context) {
//               return [
//                 const PopupMenuItem(value: 'share', child: Text('Share App')),
//                 const PopupMenuItem(value: 'RateApp', child: Text('Rate App')),
//                 const PopupMenuItem(
//                     value: 'delete', child: Text('Delete Account')),
//                 const PopupMenuItem(value: 'logout', child: Text('Logout')),
//               ];
//             },
//             icon: const Icon(Icons.menu, color: Colors.white),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: ElevatedButton.icon(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => AllDetailsPage()),
//                       );
//                     },
//                     icon: const Icon(Icons.brush, size: 18),
//                     label: const Text(
//                       'Create Biodata',
//                       style: TextStyle(fontSize: 14),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red,
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8, vertical: 10),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Consumer<ShowbiodataController>(
//                     builder: (context, controller, _) {
//                   return Expanded(
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         controller.addDummyBiodata();
//                       },
//                       icon: const Icon(Icons.add, size: 18),
//                       label: const Text(
//                         'Add Sample',
//                         style: TextStyle(fontSize: 14),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFFFF5507),
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 10),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                       ),
//                     ),
//                   );
//                 }),
//               ],
//             ),
//             const SizedBox(height: 15),
//             Expanded(
//               child: Consumer<ShowbiodataController>(
//                 builder: (context, controller, _) {
//                   if (controller.loading) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }

//                   if (controller.userData.isEmpty) {
//                     return const Center(
//                       child: Text('No data available'),
//                     );
//                   }

//                   return ListView.builder(
//                     itemCount: controller.userData.length,
//                     itemBuilder: (context, index) {
//                       final biodata = controller.userData[index];
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: _buildBiodataCard(context, biodata, controller),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBiodataCard(BuildContext context, Map<String, dynamic> biodata,
//       ShowbiodataController controller) {
//     return Card(
//       color: Colors.white,
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               leading: CircleAvatar(
//                 radius: 30,
//               ),
//               title: Text(
//                 '${biodata['username'] ?? 'John'}',
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(
//                 'Caste: ${biodata['caste'] ?? 'Maratha'} \nDOB: ${formatDate(biodata['birthdate'])} ',
//               ),
//             ),
//             Container(
//               color: Colors.grey[200],
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   _buildBioOptionButton(Icons.edit, 'Edit', () {
//                     // Implement edit functionality
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => AllDetailsPage(),
//                       ),
//                     );
//                   }),
//                   _buildBioOptionButton(Icons.copy, 'Copy', () async {
//                     // Copy the biodata and add it to the list
//                     final controller = Provider.of<ShowbiodataController>(
//                         context,
//                         listen: false);
//                     await controller.copyBiodataWithDelay(biodata);
//                   }),
//                   _buildBioOptionButton(Icons.delete, 'Delete', () {
//                     // Implement delete functionality
//                   }),
//                   _buildBioOptionButton(
//                     Icons.file_copy,
//                     'Template',
//                     () {
//                       // Implement template change functionality
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => TemplateSelectionPage(
//                             id: (biodata['id'] ?? '').toString(),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBioOptionButton(
//       IconData icon, String label, VoidCallback onPressed) {
//     return Column(
//       children: [
//         IconButton(
//           icon: Icon(icon, color: Colors.grey[700]),
//           onPressed: onPressed,
//         ),
//         Text(label, style: TextStyle(color: Colors.grey[700])),
//       ],
//     );
//   }
// }

// import 'dart:convert';
// import 'package:bio_data/controller/home_screen_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../controller/delete_templet_controller.dart';
// import '../../controller/showbiodata_controller.dart';
// import '../../request/add_dummy_sample.dart';
// import '../AllDetailsPage.dart';
// import '../login_form.dart';
// import '../template_selection_page.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   String? _authToken;

//   Future<void> _getMatriIdAndFetchBiodata() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? matriId =
//         prefs.getString('matri_id'); // Assuming 'matri_id' is stored

//     if (matriId != null) {
//       await _fetchBiodataInfo(matriId);
//     } else {
//       print('matriId is null. Unable to fetch biodata.');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 6, vsync: this);
//     _getAuthToken();
//     _getMatriIdAndFetchBiodata();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   Future<void> _getAuthToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _authToken = prefs.getString('token_key');
//     });
//   }

//   Future<void> _fetchBiodataInfo(String matriId) async {
//     final controller =
//         Provider.of<ShowbiodataController>(context, listen: false);
//     await controller.fetchBiodata(); // Fetch biodata using the controller
//   }

//   void _handleMenuItemClick(String value) {
//     switch (value) {
//       case 'share':
//         _shareApp();
//         break;
//       case 'RateApp':
//         _rateApp();
//         break;
//       case 'delete':
//         _showDeleteAccountConfirmation(context);
//         break;
//       case 'logout':
//         _handleLogout(context);
//         break;
//     }
//   }

//   _rateApp() {
//     // Functionality to rate the app
//   }

//   Future<void> _handleLogout(context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token_key');
//     await prefs.remove('matri_id');
//     await prefs.setBool('isLoggedIn', false);
//     Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(builder: (context) => LoginForm(onLoginSuccess: () {})),
//       (Route<dynamic> route) => false,
//     );
//   }

//   void _shareApp() {
//     const String appLink = 'https://Instagram.com';
//     const String message = 'Check out this awesome app: $appLink';
//     Share.share(message);
//   }

//   void _showDeleteAccountConfirmation(context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Delete Account'),
//           content: const Text(
//               'Are you sure you want to delete your account? This action cannot be undone.'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('Delete'),
//               onPressed: () async {
//                 Navigator.of(context).pop();
//                 await _deleteAccount(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _deleteAccount(context) async {
//     final url = Uri.parse(
//         'https://techfluxsolutions.com/royal_maratha/api/users/delete');

//     try {
//       final response = await http.delete(
//         url,
//         headers: {'Authorization': 'Bearer $_authToken'},
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         bool success = data['success'] ?? false;

//         if (success) {
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           await prefs.clear();
//           Navigator.of(context).pushReplacementNamed('/login');
//         } else {
//           String message = data['message'] ?? 'Failed to delete account';
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text(message)));
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text('Failed to delete account: ${response.statusCode}')));
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('An error occurred while deleting account')));
//     }
//   }

//   String formatDate(String? date) {
//     if (date == null) return ''; // Handle null case
//     try {
//       // Parse the incoming date in 'yyyy-MM-dd HH:mm:ss' format
//       DateTime parsedDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);
//       // Format it to 'dd-MM-yyyy' (e.g., 12-06-2000)
//       return DateFormat('dd-MM-yyyy').format(parsedDate);
//     } catch (e) {
//       return date; // Return original date if parsing fails
//     }
//   }

//   Future<void> _deleteBiodata(String? id) async {
//     if (id == null) return; // Check if id is null before proceeding
//     final controller =
//         Provider.of<DeleteTemplateController>(context, listen: false);
//     await controller.deleteBiodata(id, _authToken);

//     if (controller.errorMessage != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(controller.errorMessage!)),
//       );
//     } else if (controller.successMessage != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(controller.successMessage!)),
//       );

//       // Optionally, refresh the biodata list after deletion
//       final biodataController =
//           Provider.of<ShowbiodataController>(context, listen: false);
//       await biodataController.fetchBiodata();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Biodata Maker',
//           style: TextStyle(
//               fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.white),
//           textAlign: TextAlign.center,
//         ),
//         backgroundColor: const Color(0xFFFF5508),
//         actions: [
//           PopupMenuButton<String>(
//             color: Colors.white,
//             onSelected: _handleMenuItemClick,
//             itemBuilder: (BuildContext context) {
//               return [
//                 const PopupMenuItem(value: 'share', child: Text('Share App')),
//                 const PopupMenuItem(value: 'RateApp', child: Text('Rate App')),
//                 const PopupMenuItem(
//                     value: 'delete', child: Text('Delete Account')),
//                 const PopupMenuItem(value: 'logout', child: Text('Logout')),
//               ];
//             },
//             icon: const Icon(Icons.menu, color: Colors.white),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: ElevatedButton.icon(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => AllDetailsPage()),
//                       );
//                     },
//                     icon: const Icon(Icons.brush, size: 18),
//                     label: const Text(
//                       'Create Biodata',
//                       style: TextStyle(fontSize: 14),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red,
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8, vertical: 10),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Consumer<HomeScreenController>(
//                     builder: (context, controller, _) {
//                   return Expanded(
//                     child: ElevatedButton.icon(
//                       onPressed: () async {
//                         // Call the addDummySampleApi when button is pressed
//                         await controller.createBiodataApi();
//                         ListView.builder(
//                           itemCount: controller.userData.length,
//                           itemBuilder: (context, index) {
//                             final biodata = controller.userData[index];

//                             return Card(
//                               color: Colors.white,
//                               elevation: 5,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)),
//                               margin: const EdgeInsets.symmetric(
//                                   vertical: 5, horizontal: 10),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 8.0, horizontal: 10.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     ListTile(
//                                       leading: CircleAvatar(
//                                         backgroundImage: AssetImage(
//                                             "assets/images/profile.png"),
//                                         radius: 30,
//                                       ),
//                                       title: Text(
//                                         '${biodata.username}',
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       subtitle: Text(
//                                         'Caste: ${biodata.caste ?? 'Maratha'} \nHeight: ${biodata.height}',
//                                       ),
//                                     ),
//                                     Container(
//                                       color: Colors.grey[200],
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           IconButton(
//                                               icon: const Icon(Icons.edit,
//                                                   color: Colors.grey),
//                                               onPressed: () {}),
//                                           IconButton(
//                                             icon: const Icon(Icons.copy,
//                                                 color: Colors.grey),
//                                             onPressed: () {
//                                               // Implement copy functionality if needed
//                                             },
//                                           ),
//                                           IconButton(
//                                             icon: const Icon(Icons.delete,
//                                                 color: Colors.grey),
//                                             onPressed: () {},
//                                           ),
//                                           IconButton(
//                                             icon: const Icon(Icons.file_copy,
//                                                 color: Colors.grey),
//                                             onPressed: () {},
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       },
//                       icon: const Icon(Icons.add, size: 18),
//                       label: const Text(
//                         'Add Sample',
//                         style: TextStyle(fontSize: 14),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFFFF5507),
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 10),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                       ),
//                     ),
//                   );
//                 }),
//               ],
//             ),
//             const SizedBox(height: 15),
//             Expanded(
//               child: Consumer<ShowbiodataController>(
//                 builder: (context, controller, _) {
//                   if (controller.loading) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }

//                   if (controller.userData.isEmpty) {
//                     return const Center(
//                       child: Text('No data available'),
//                     );
//                   }

//                   return ListView.builder(
//                     itemCount: controller.userData.length,
//                     itemBuilder: (context, index) {
//                       final biodata = controller.userData[index];

//                       return Card(
//                         color: Colors.white,
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         margin: const EdgeInsets.symmetric(
//                             vertical: 5, horizontal: 10),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 8.0, horizontal: 10.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ListTile(
//                                 leading: CircleAvatar(
//                                   backgroundImage:
//                                       AssetImage("assets/images/profile.png"),
//                                   radius: 30,
//                                 ),
//                                 title: Text(
//                                   '${biodata['username'] ?? 'John'}',
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 subtitle: Text(
//                                   'Caste: ${biodata['caste'] ?? 'Maratha'} \nHeight: ${biodata['height']}',
//                                 ),
//                               ),
//                               Container(
//                                 color: Colors.grey[200],
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit,
//                                           color: Colors.grey),
//                                       onPressed: () {
//                                         // Implement edit functionality
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 AllDetailsPage(),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.copy,
//                                           color: Colors.grey),
//                                       onPressed: () {
//                                         // Implement copy functionality if needed
//                                       },
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete,
//                                           color: Colors.grey),
//                                       onPressed: () {
//                                         _showDeleteConfirmationDialog(
//                                           context,
//                                           biodata['id']?.toString(),
//                                         );
//                                       },
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.file_copy,
//                                           color: Colors.grey),
//                                       onPressed: () {
//                                         // Implement template change functionality
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 TemplateSelectionPage(
//                                                     id: (biodata['id'] ?? '')
//                                                         .toString()),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget _buildBioOptionButton(
//   //     IconData icon, String label, VoidCallback onPressed) {
//   //   return Column(
//   //     children: [
//   //       IconButton(
//   //         icon: Icon(icon, color: Colors.grey[700]),
//   //         onPressed: onPressed,
//   //       ),
//   //       Text(label, style: TextStyle(color: Colors.grey[700])),
//   //     ],
//   //   );
//   // }

//   void _showDeleteConfirmationDialog(BuildContext context, String? id) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Delete Biodata'),
//           content: const Text(
//               'Are you sure you want to delete this biodata? This action cannot be undone.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 // Confirm deletion
//                 Navigator.of(context).pop(); // Close the dialog
//                 if (id != null && _authToken != null) {
//                   final controller = Provider.of<DeleteTemplateController>(
//                       context,
//                       listen: false);
//                   await controller.deleteBiodata(id, _authToken);

//                   // Ensure the widget is still mounted
//                   if (!mounted) return;

//                   // Now you can safely access context
//                   if (controller.errorMessage != null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text(controller.errorMessage!)),
//                     );
//                   } else if (controller.successMessage != null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text(controller.successMessage!)),
//                     );

//                     // Refresh the biodata list after deletion
//                     final biodataController =
//                         Provider.of<ShowbiodataController>(context,
//                             listen: false);
//                     await biodataController.fetchBiodata();
//                   }
//                 }
//               },
//               child: const Text('Delete'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
