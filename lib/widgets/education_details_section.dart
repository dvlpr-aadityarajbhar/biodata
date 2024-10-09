// // File: lib/widgets/education_details_section.dart

// import 'package:bio_data_maker/consts/lists.dart';
// import 'package:bio_data_maker/widgets/dynamic_field.dart';
// import 'package:flutter/material.dart';

// import '../screens/AppTheme.dart';

// class EducationDetailsSection extends StatelessWidget {
//   final List<Map<String, dynamic>> fields;

//   const EducationDetailsSection({Key? key, required this.fields})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Education and Occupation Details',
//             style: TextStyle(fontSize: 18.0)),
//         DropdownButtonFormField(
//           decoration: const InputDecoration(labelText: 'Education Level'),
//           items: educationLevels.map((String level) {
//             return DropdownMenuItem<String>(value: level, child: Text(level));
//           }).toList(),
//           onChanged: (value) {},
//         ),
//         const SizedBox(height: 8),

//         // Education field
//         // Occupation field
//         // Annual Income field
//         Row(
//           children: [
//             SizedBox(
//               width: 270,
//               height: 50,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Education',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             const Icon(
//               Icons.keyboard_arrow_down,
//               size: 30,
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
//               height: 50,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Occupation',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             const Icon(
//               Icons.unfold_more,
//               size: 30,
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
//                   labelText: 'Annual Income',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             const Icon(
//               Icons.keyboard_arrow_down,
//               size: 30,
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
import '../request/education_details_api.dart';
import '../screens/AppTheme.dart';
import 'dynamic_field.dart';

class EducationDetailsSection extends StatefulWidget {
  final List<Map<String, dynamic>> fields;

  const EducationDetailsSection({Key? key, required this.fields})
      : super(key: key);

  @override
  _EducationDetailsSectionState createState() =>
      _EducationDetailsSectionState();
}

class _EducationDetailsSectionState extends State<EducationDetailsSection> {
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _incomeController = TextEditingController();
  String? _selectedEducationLevel;

  @override
  void dispose() {
    _educationController.dispose();
    _occupationController.dispose();
    _incomeController.dispose();
    super.dispose();
  }

  Future<void> _submitEducationDetails() async {
    String educationDetail = _educationController.text;
    String occupation = _occupationController.text;
    String income = _incomeController.text;

    if (_selectedEducationLevel != null &&
        educationDetail.isNotEmpty &&
        occupation.isNotEmpty &&
        income.isNotEmpty) {
      await EducationDetailsRequest().educationDetailsApi(
        educationDetail,
        double.parse(income),
        occupation,
        _selectedEducationLevel!,
      );

      // Optionally, clear the fields or show a success message
      _educationController.clear();
      _occupationController.clear();
      _incomeController.clear();
      setState(() {
        _selectedEducationLevel = null; // Reset selection
      });
    } else {
      // Show an error message if validation fails
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please fill in all fields.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Education and Occupation Details',
            style: TextStyle(fontSize: 18.0)),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(labelText: 'Education Level'),
          items: educationLevels.map((String level) {
            return DropdownMenuItem<String>(value: level, child: Text(level));
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedEducationLevel = value;
            });
          },
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _educationController,
                decoration: const InputDecoration(
                  labelText: 'Education',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(Icons.delete, color: AppTheme.primaryColor),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _occupationController,
                decoration: const InputDecoration(
                  labelText: 'Occupation',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(Icons.delete, color: AppTheme.primaryColor),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _incomeController,
                decoration: const InputDecoration(
                  labelText: 'Annual Income',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(Icons.delete, color: AppTheme.primaryColor),
          ],
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: _submitEducationDetails,
          child: const Text('Submit'),
        ),
        const SizedBox(height: 16),
        ...widget.fields.map((field) => DynamicField(field: field)).toList(),
      ],
    );
  }
}
