// // File: lib/widgets/personal_details_section.dart

// import 'package:bio_data_maker/consts/lists.dart';
// import 'package:bio_data_maker/widgets/dynamic_field.dart';
// import 'package:flutter/material.dart';

// import '../screens/AppTheme.dart';

// class PersonalDetailsSection extends StatelessWidget {
//   final List<Map<String, dynamic>> fields;

//   PersonalDetailsSection({Key? key, required this.fields}) : super(key: key);
//   DateTime? _selectedDate;
//   TimeOfDay? _selectedTime;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Personal Details', style: TextStyle(fontSize: 18.0)),
//         TextFormField(
//           decoration: InputDecoration(labelText: 'Full Name'),
//         ),
//         const SizedBox(height: 8),
//         DropdownButtonFormField(
//           decoration: const InputDecoration(labelText: 'Caste'),
//           items: castes.map((String caste) {
//             return DropdownMenuItem<String>(value: caste, child: Text(caste));
//           }).toList(),
//           onChanged: (value) {},
//         ),
//         const SizedBox(height: 8),
//         TextField(
//           decoration: InputDecoration(labelText: "Sub Caste"),
//         ),
//         const SizedBox(height: 8),

//         DropdownButtonFormField(
//           decoration: const InputDecoration(labelText: 'Blood Group'),
//           items: bloodGroups.map((String bloodGroup) {
//             return DropdownMenuItem<String>(
//                 value: bloodGroup, child: Text(bloodGroup));
//           }).toList(),
//           onChanged: (value) {},
//         ),
//         const SizedBox(height: 8),
//         // Birth Date field
//         TextFormField(
//           decoration: const InputDecoration(labelText: 'Birth Date'),
//           readOnly: true,
//           controller: TextEditingController(
//             text: _selectedDate != null
//                 ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
//                 : "",
//           ),
//           onTap: () async {
//             final DateTime? pickedDate = await showDatePicker(
//               context: context,
//               initialDate: _selectedDate ?? DateTime.now(),
//               firstDate: DateTime(1900),
//               lastDate: DateTime.now(),
//             );
//             if (pickedDate != null && pickedDate != _selectedDate) {
//               // setState
//               (() {
//                 _selectedDate = pickedDate;
//               });
//             }
//           },
//         ),

//         const SizedBox(height: 8),
//         // Birth Time field
//         const SizedBox(height: 8),
//         TextFormField(
//           decoration: const InputDecoration(labelText: 'Birth Time'),
//           readOnly: true,
//           controller: TextEditingController(
//             text: _selectedTime != null ? _selectedTime!.format(context) : "",
//           ),
//           onTap: () async {
//             final TimeOfDay? pickedTime = await showTimePicker(
//               context: context,
//               initialTime: _selectedTime ?? TimeOfDay.now(),
//             );
//             if (pickedTime != null && pickedTime != _selectedTime) {
//               // setState
//               (() {
//                 _selectedTime = pickedTime;
//               });
//             }
//           },
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         // Other fields...
//         DropdownButtonFormField(
//           decoration: const InputDecoration(labelText: 'Height'),
//           items: heights.map((String heights) {
//             return DropdownMenuItem<String>(
//               value: heights,
//               child: Text(heights),
//             );
//           }).toList(),
//           onChanged: (value) {},
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 270,
//               height: 50,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'devak/Gotra',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             const Icon(
//               Icons.keyboard_arrow_down,
//               color: AppTheme.primaryColor,
//             ),
//             const Icon(
//               Icons.delete,
//               color: AppTheme.primaryColor,
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 270,
//               height: 60,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Complexion',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             const Icon(
//               Icons.keyboard_arrow_up,
//               color: AppTheme.primaryColor,
//             ),
//             const Icon(
//               Icons.delete,
//               color: AppTheme.primaryColor,
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 8,
//         ),

//         ...fields.map((field) => DynamicField(field: field)),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../consts/lists.dart';
import '../request/personal_detais_api.dart';
import '../screens/AppTheme.dart';
import 'dynamic_field.dart';
import 'personal_testing.dart';

class PersonalDetailsSection extends StatefulWidget {
  final List<Map<String, dynamic>> fields;

  PersonalDetailsSection({Key? key, required this.fields}) : super(key: key);

  @override
  _PersonalDetailsSectionState createState() => _PersonalDetailsSectionState();
}

class _PersonalDetailsSectionState extends State<PersonalDetailsSection> {
  // Form Key
  final _formKey = GlobalKey<FormState>();

  // Controllers for TextFormField
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _subCasteController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _birthTimeController = TextEditingController();
  final TextEditingController _gothraController = TextEditingController();
  final TextEditingController _complexionController = TextEditingController();

  // Dropdown Selections
  String? _selectedCaste;
  String? _selectedBloodGroup;
  String? _selectedHeight;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  // Dispose controllers
  @override
  void dispose() {
    _titleController.dispose();
    _fullNameController.dispose();
    _subCasteController.dispose();
    _birthDateController.dispose();
    _birthTimeController.dispose();
    _gothraController.dispose();
    _complexionController.dispose();
    super.dispose();
  }

  // Method to submit form and call API
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      await PersonalDetailsRequest().personalDetailsApi(
        _titleController.text,
        _fullNameController.text,
        _selectedHeight ?? '',
        // _selectedBloodGroup ?? '',
        _birthTimeController.text,
        "SomePlace", // Assuming birth place
        // _birthDateController.text,
        _selectedCaste ?? '',
        _subCasteController.text,
        _complexionController.text,
        _gothraController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PersonalTesting(
            expectation: '',
            property: '',
            title: _titleController.text,
            fullName: _fullNameController.text,
            caste: _selectedCaste ?? '',
            subCaste: _subCasteController.text,
            bloodGroup: _selectedBloodGroup ?? '',
            birthDate: _birthDateController.text,
            birthTime: _birthTimeController.text,
            height: _selectedHeight ?? '',
            gothra: _gothraController.text,
            complexion: _complexionController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Biodata Title',
              hintText: '|| Shree Ganeshaya Namah ||',
            ),
          ),
          const SizedBox(height: 8),

          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 50, color: Colors.grey[600]),
                ),
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: AppTheme.primaryColor,
                    radius: 18,
                    child: Icon(Icons.edit, size: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          Text('Personal Details', style: TextStyle(fontSize: 18.0)),
          TextFormField(
            controller: _fullNameController,
            decoration: InputDecoration(labelText: 'Full Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Caste'),
            items: castes.map((String caste) {
              return DropdownMenuItem<String>(value: caste, child: Text(caste));
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCaste = value;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Please select a caste';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _subCasteController,
            decoration: InputDecoration(labelText: "Sub Caste"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your sub caste';
              }
              return null;
            },
          ),
          // const SizedBox(height: 8),
          // DropdownButtonFormField<String>(
          //   decoration: const InputDecoration(labelText: 'Blood Group'),
          //   items: bloodGroups.map((String bloodGroup) {
          //     return DropdownMenuItem<String>(
          //         value: bloodGroup, child: Text(bloodGroup));
          //   }).toList(),
          //   onChanged: (value) {
          //     setState(() {
          //       _selectedBloodGroup = value;
          //     });
          //   },
          //   validator: (value) {
          //     if (value == null) {
          //       return 'Please select a blood group';
          //     }
          //     return null;
          //   },
          // ),
          const SizedBox(height: 8),
          // Birth Date field
          // TextFormField(
          //   controller: _birthDateController,
          //   decoration: const InputDecoration(labelText: 'Birth Date'),
          //   readOnly: true,
          //   onTap: () async {
          //     final DateTime? pickedDate = await showDatePicker(
          //       context: context,
          //       initialDate: _selectedDate ?? DateTime.now(),
          //       firstDate: DateTime(1900),
          //       lastDate: DateTime.now(),
          //     );
          //     if (pickedDate != null) {
          //       setState(() {
          //         _selectedDate = pickedDate;
          //         _birthDateController.text =
          //             "${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}";
          //       });
          //     }
          //   },
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return 'Please select your birth date';
          //     }
          //     return null;
          //   },
          // ),
          const SizedBox(height: 8),
          // Birth Time field
          TextFormField(
            controller: _birthTimeController,
            decoration: const InputDecoration(labelText: 'Birth Time'),
            readOnly: true,
            onTap: () async {
              final TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: _selectedTime ?? TimeOfDay.now(),
              );
              if (pickedTime != null) {
                setState(() {
                  _selectedTime = pickedTime;
                  _birthTimeController.text = _selectedTime!.format(context);
                });
              }
            },
          ),
          const SizedBox(height: 8),
          // Height field
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Height'),
            items: heights.map((String height) {
              return DropdownMenuItem<String>(
                value: height,
                child: Text(height),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedHeight = value;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Please select your height';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _gothraController,
            decoration: const InputDecoration(labelText: 'Gothra'),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _complexionController,
            decoration: const InputDecoration(labelText: 'Complexion'),
          ),
          const SizedBox(height: 16),
          // ElevatedButton(
          //   onPressed: _submitForm,
          //   child: Text('Submit'),
          // ),
          const SizedBox(height: 16),
          ...widget.fields.map((field) => DynamicField(field: field)),
        ],
      ),
    );
  }
}
