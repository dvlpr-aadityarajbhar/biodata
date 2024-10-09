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

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../consts/lists.dart';
import '../request/education_details_api.dart';
import 'template_selection_page.dart';

class AllDetailsPage extends StatefulWidget {
  final Map<String, String>? initialValues;
  final Map<String, dynamic>? biodataDetails;

  AllDetailsPage({Key? key, this.initialValues, this.biodataDetails})
      : super(key: key);

  @override
  _AllDetailsPageState createState() => _AllDetailsPageState();
}

class _AllDetailsPageState extends State<AllDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController biodataTitleController;
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  bool _isSaving = false;
  String id = '';

  final Map<String, List<Map<String, dynamic>>> sectionFields = {
    'Personal Details': [
      {'label': 'Full Name', 'controller': TextEditingController()},
      {'label': 'Caste', 'controller': TextEditingController()},
      {'label': 'Subcaste', 'controller': TextEditingController()},
      {'label': 'Birth Time', 'controller': TextEditingController()},
      {'label': 'Birth Place', 'controller': TextEditingController()},
      {'label': 'Height', 'controller': TextEditingController()},
      {'label': 'Gothra', 'controller': TextEditingController()},
      {'label': 'Complexion', 'controller': TextEditingController()},
    ],
    'Education and Occupation Details': [
      {'label': 'Education', 'controller': TextEditingController()},
      {'label': 'Annual Income', 'controller': TextEditingController()},
      {'label': 'Occupation', 'controller': TextEditingController()},
      {'label': 'Education Level', 'controller': TextEditingController()},
    ],
    'Family Details': [
      {'label': "Father's Name", 'controller': TextEditingController()},
      {'label': "Father's Occupation", 'controller': TextEditingController()},
      {'label': "Mother's Name", 'controller': TextEditingController()},
      {'label': "Mother's Occupation", 'controller': TextEditingController()},
      {'label': 'Mobile No.', 'controller': TextEditingController()},
      {'label': 'Total Brothers', 'controller': TextEditingController()},
      {'label': 'Total Sisters', 'controller': TextEditingController()},
      {'label': 'Residential Address', 'controller': TextEditingController()},
      {'label': 'Maternal Uncle Name', 'controller': TextEditingController()},
      {'label': 'Surname Relatives', 'controller': TextEditingController()},
      {'label': 'Native Place', 'controller': TextEditingController()},
    ],
    'Other Details': [
      {'label': 'Property', 'controller': TextEditingController()},
      {'label': 'Expectations', 'controller': TextEditingController()},
      {'label': 'Email', 'controller': TextEditingController()},
      {'label': 'Contact', 'controller': TextEditingController()},
    ],
  };

  @override
  void initState() {
    super.initState();
    biodataTitleController = TextEditingController(
      text: widget.initialValues?['Biodata Title'] ??
          "|| Shree Ganeshaya Namah ||",
    );
    _initializeControllers();
  }

  void _initializeControllers() {
    widget.initialValues?.forEach(
      (key, value) {
        for (var section in sectionFields.values) {
          for (var field in section) {
            if (field['label'] == key && field['controller'] != null) {
              (field['controller'] as TextEditingController).text = value;
            }
          }
        }
      },
    );
  }

  Future<void> saveAllApi() async {
    String? imagePath = _imageFile?.path;

    // Personal Details API
    Map<String, dynamic> data =
        await EducationDetailsRequest().personalDetailsApi(
      biodataTitleController.text,
      sectionFields['Personal Details']![0]['controller'].text, // Full Name
      sectionFields['Personal Details']![1]['controller'].text, // Caste
      sectionFields['Personal Details']![2]['controller'].text, // Subcaste
      sectionFields['Personal Details']![3]['controller'].text, // Birth Time
      sectionFields['Personal Details']![4]['controller'].text, // Birth Place
      sectionFields['Personal Details']![5]['controller'].text, // Height
      sectionFields['Personal Details']![6]['controller'].text, // Gothra
      sectionFields['Personal Details']![7]['controller'].text, // Complexion
    );

    print(data.runtimeType);

    id = EducationDetailsRequest().newBiodataId.toString();
    print("id---------$id");

    // Education and Occupation API
    await EducationDetailsRequest().educationDetailsApi(
      sectionFields['Education and Occupation Details']![0]['controller'].text,
      99.00, // Education Level
      // double.parse(sectionFields['Education and Occupation Details']![1]
      //         ['controller']
      //     .text),
      sectionFields['Education and Occupation Details']![2]['controller']
          .text, // Occupation
      sectionFields['Education and Occupation Details']![3]['controller'].text,
    );

    // Family Details API
    await EducationDetailsRequest().familyDetailsApi(
      sectionFields['Family Details']![0]['controller'].text, // Father's Name
      sectionFields['Family Details']![1]['controller']
          .text, // Father's Occupation
      sectionFields['Family Details']![2]['controller'].text, // Mobile No.
      sectionFields['Family Details']![3]['controller'].text, // Mother's Name
      sectionFields['Family Details']![4]['controller']
          .text, // Mother's Occupation
      sectionFields['Family Details']![5]['controller'].text, // Total Brothers
      sectionFields['Family Details']![6]['controller'].text, // Total Sisters
      sectionFields['Family Details']![7]['controller']
          .text, // Residential Address
      sectionFields['Family Details']![8]['controller']
          .text, // Maternal Uncle Name
      sectionFields['Family Details']![9]['controller'].text, // Native Place
      sectionFields['Family Details']![10]['controller']
          .text, // Surname Relatives
    );

    // Other Details API
    await EducationDetailsRequest().otherDetailsApi(
      sectionFields['Other Details']![0]['controller'].text, // Property
      sectionFields['Other Details']![1]['controller'].text, // Expectations
      sectionFields['Other Details']![2]['controller'].text, // Email
      sectionFields['Other Details']![3]['controller'].text, // Contact
    );

    if (_imageFile != null) {
      File imageFile =
          File(_imageFile!.path); // Convert the String path to a File
      await EducationDetailsRequest().insertImageApi(imageFile);
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSaving = true; // Start showing the loading indicator on the button
      });

      try {
        await saveAllApi(); // Save the details via the POST API

        // Once saving is successful, navigate to the template selection page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TemplateSelectionPage(
              id: id,
            ),
          ),
        );
      } catch (e) {
        // Handle any errors (e.g., show a toast, dialog, etc.)
        print("Error saving data: $e");
      } finally {
        setState(() {
          _isSaving = false; // Stop showing the loading indicator
        });
      }
    }
  }

  // Add this import at the top of your file if it's not already there

// Update the _buildTextField method to handle the Height field dropdown and Birth Time time picker
  Widget _buildTextField(
    String label,
    TextEditingController controller,
    int sectionIndex,
    int fieldIndex,
    List<Map<String, dynamic>> fields, {
    bool canSwap = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: label == 'Caste'
                    ? GestureDetector(
                        onTap: () => _showCasteDialog(controller),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: controller,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: label,
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                    : label == 'Education Level'
                        ? GestureDetector(
                            onTap: () => _showEducationLevelDialog(controller),
                            child: AbsorbPointer(
                              child: TextFormField(
                                controller: controller,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: label,
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                        : label == 'Birth Time'
                            ? GestureDetector(
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          primaryColor: Colors.blue,
                                          colorScheme: ColorScheme.light(
                                              primary: Colors.blue),
                                          buttonTheme: ButtonThemeData(
                                              textTheme:
                                                  ButtonTextTheme.primary),
                                          dialogBackgroundColor: Colors.white,
                                        ),
                                        child: child ?? SizedBox(),
                                      );
                                    },
                                  );
                                  if (pickedTime != null) {
                                    String formattedTime =
                                        pickedTime.format(context);
                                    controller.text = formattedTime;
                                  }
                                },
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    controller: controller,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      labelText: label,
                                    ),
                                  ),
                                ),
                              )
                            : label == 'Height'
                                ? GestureDetector(
                                    onTap: () => _showHeightDialog(controller),
                                    child: AbsorbPointer(
                                      child: TextFormField(
                                        controller: controller,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          labelText: label,
                                        ),
                                      ),
                                    ),
                                  )
                                : TextFormField(
                                    controller: controller,
                                    decoration:
                                        InputDecoration(labelText: label),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your $label';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Colors.black),
                                  ),
              ),
              if (canSwap)
                Row(
                  children: [
                    if (label == 'Devak')
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_down,
                            color: Colors.orange, size: 30),
                        onPressed: () =>
                            _moveFieldDown(sectionIndex, fieldIndex),
                      )
                    else if (label == 'Complexion')
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_up,
                            color: Colors.orange, size: 30),
                        onPressed: () => _moveFieldUp(sectionIndex, fieldIndex),
                      )
                    else
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_up,
                                color: Colors.orange, size: 30),
                            onPressed: () =>
                                _moveFieldUp(sectionIndex, fieldIndex),
                          ),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_down,
                                color: Colors.orange, size: 30),
                            onPressed: () =>
                                _moveFieldDown(sectionIndex, fieldIndex),
                          ),
                        ],
                      ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red, size: 30),
                      padding: EdgeInsets.zero,
                      onPressed: () => _deleteField(sectionIndex, fieldIndex),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  void _showCasteDialog(TextEditingController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Caste'),
          backgroundColor: Colors.white, // Set dialog background to white
          content: Container(
            width: double.maxFinite, // Set the width to maximum
            constraints: BoxConstraints(
              maxHeight: 300, // Set a maximum height for the dialog
            ),
            child: ListView.builder(
              shrinkWrap:
                  true, // Ensure the ListView takes only the necessary height
              itemCount: castes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(castes[index]),
                  onTap: () {
                    controller.text = castes[index];
                    Navigator.of(context).pop(); // Close the dialog
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

// Custom height dialog function
  Future<void> _showHeightDialog(TextEditingController controller) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Select Height',
            style: TextStyle(color: Colors.black),
          ), // Change title color to black
          backgroundColor: Colors.white, // Set dialog background to white
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: heightOptions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    heightOptions[index],
                    style: TextStyle(
                        color: Colors.black), // Change list item color to black
                  ),
                  onTap: () {
                    controller.text = heightOptions[index]; // Set height value
                    Navigator.of(context).pop(); // Close dialog
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _showEducationLevelDialog(TextEditingController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Education Level'),
          backgroundColor: Colors.white, // Set dialog background to white
          content: Container(
            width: double.maxFinite, // Set the width to maximum
            constraints: BoxConstraints(
              maxHeight: 300, // Set a maximum height for the dialog
            ),
            child: ListView.builder(
              shrinkWrap:
                  true, // Ensure the ListView takes only the necessary height
              itemCount: educationLevels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(educationLevels[index]),
                  onTap: () {
                    controller.text = educationLevels[index];
                    Navigator.of(context).pop(); // Close the dialog
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSwapDeleteIcons(int sectionIndex, int fieldIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.keyboard_arrow_up,
              color: Colors.orange, size: 30), // Increased size
          padding: EdgeInsets.zero,
          onPressed: () => _moveFieldUp(sectionIndex, fieldIndex),
        ),
        IconButton(
          icon: Icon(Icons.keyboard_arrow_down,
              color: Colors.orange, size: 30), // Increased size
          padding: EdgeInsets.zero,
          onPressed: () => _moveFieldDown(sectionIndex, fieldIndex),
        ),
        IconButton(
          icon:
              Icon(Icons.delete, color: Colors.red, size: 30), // Increased size
          padding: EdgeInsets.zero,
          onPressed: () => _deleteField(sectionIndex, fieldIndex),
        ),
      ],
    );
  }

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

  Widget _buildSection(
      String title, List<Map<String, dynamic>> fields, int sectionIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...fields.asMap().entries.map(
          (entry) {
            int fieldIndex = entry.key;
            var field = entry.value;

            bool canSwap = field.containsKey('canSwap')
                ? field[
                    'canSwap'] // Use the canSwap flag from the field if it exists
                : false;

            // Determine if the field should have the "swap" icon based on the section
            if (title == 'Personal Details' &&
                (field['label'] == 'Gothra' ||
                    field['label'] == 'Complexion')) {
              canSwap = true; // Only allow swap for Gothra and Complexion
            } else if (title == 'Education and Occupation Details' &&
                fieldIndex > 0) {
              canSwap =
                  true; // Allow swap for other fields except Education Level
            } else if (title == 'Family Details' || title == 'Other Details') {
              canSwap = true;
            }

            return _buildTextField(
              field['label'],
              field['controller'],
              sectionIndex,
              fieldIndex,
              fields,
              canSwap: canSwap,
            );
          },
        ).toList(),
        // Add new field button
        Align(
          alignment: Alignment.centerRight,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () {
              // Show dialog to add new field
              _showAddFieldDialog(context, sectionIndex, fields, title);
            },
            child: const Text(
              "+Add New Field",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

// Function to show the dialog and add a new field
  void _showAddFieldDialog(BuildContext context, int sectionIndex,
      List<Map<String, dynamic>> fields, String sectionTitle) {
    TextEditingController labelController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Enter Label'),
              IconButton(
                icon: Icon(Icons.cancel, color: Colors.red),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: TextFormField(
            controller: labelController,
            decoration: InputDecoration(labelText: 'Enter label'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (labelController.text.isNotEmpty) {
                  setState(() {
                    bool canSwap = false;

                    if (sectionTitle == 'Personal Details' &&
                        (labelController.text == 'Gothra' ||
                            labelController.text == 'Complexion')) {
                      canSwap = true;
                    } else if (sectionTitle ==
                        'Education and Occupation Details') {
                      canSwap = true;
                    } else if (sectionTitle == 'Family Details' ||
                        sectionTitle == 'Other Details') {
                      canSwap = true;
                    }

                    fields.add({
                      'label': labelController.text,
                      'controller': TextEditingController(),
                      'canSwap': canSwap,
                    });
                  });

                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _moveFieldUp(int sectionIndex, int fieldIndex) {
    if (fieldIndex > 0) {
      setState(() {
        final temp = sectionFields.values.elementAt(sectionIndex)[fieldIndex];
        sectionFields.values.elementAt(sectionIndex)[fieldIndex] =
            sectionFields.values.elementAt(sectionIndex)[fieldIndex - 1];
        sectionFields.values.elementAt(sectionIndex)[fieldIndex - 1] = temp;
      });
    }
  }

  void _moveFieldDown(int sectionIndex, int fieldIndex) {
    if (fieldIndex < sectionFields.values.elementAt(sectionIndex).length - 1) {
      setState(() {
        final temp = sectionFields.values.elementAt(sectionIndex)[fieldIndex];
        sectionFields.values.elementAt(sectionIndex)[fieldIndex] =
            sectionFields.values.elementAt(sectionIndex)[fieldIndex + 1];
        sectionFields.values.elementAt(sectionIndex)[fieldIndex + 1] = temp;
      });
    }
  }

  void _deleteField(int sectionIndex, int fieldIndex) {
    setState(() {
      sectionFields.values.elementAt(sectionIndex).removeAt(fieldIndex);
    });
  }

  Future<void> _showImageSourceDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

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

  // Function to pick image from camera or gallery
  Future<void> _pickImage(ImageSource source) async {
    final XFile? selectedImage = await _picker.pickImage(
      source: source,
      imageQuality: 100,
    );

    if (selectedImage != null) {
      setState(() {
        _imageFile = selectedImage; // Store the picked image
      });

      await EducationDetailsRequest().insertImageApi(File(selectedImage.path));
      // insertImageApi(File(selectedImage.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Biodata',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: biodataTitleController,
                decoration: const InputDecoration(labelText: 'Biodata Title'),
              ),
              const SizedBox(height: 16),

              GestureDetector(
                onTap: _showImageSourceDialog,
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: ClipOval(
                        child: _imageFile == null
                            ? Image.asset(
                                'assets/images/sample_image.jpg',
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              )
                            : Image.file(
                                File(_imageFile!.path),
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey),
                        ),
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              // Build each section of fields
              ...sectionFields.entries.map(
                (entry) {
                  return _buildSection(entry.key, entry.value,
                      sectionFields.keys.toList().indexOf(entry.key));
                },
              ).toList(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isSaving ? null : _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5507),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: _isSaving
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.purple), // White indicator color
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        'Save All',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
