// File: lib/widgets/other_details_section.dart

// import 'package:bio_data_maker/request/education_details_api.dart';
// import 'package:flutter/material.dart';

// import '../screens/AppTheme.dart';
// import '../widgets/dynamic_field.dart';

// class OtherDetailsSection extends StatefulWidget {
//   final List<Map<String, dynamic>> fields;

//   const OtherDetailsSection({Key? key, required this.fields}) : super(key: key);

//   @override
//   _OtherDetailsSectionState createState() => _OtherDetailsSectionState();
// }

// class _OtherDetailsSectionState extends State<OtherDetailsSection> {
//   // Declare TextEditingControllers
//   final TextEditingController propertyController = TextEditingController();
//   final TextEditingController expectationController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController contactController = TextEditingController();

//   @override
//   void dispose() {
//     // Dispose of the controllers
//     propertyController.dispose();
//     expectationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Other Details', style: TextStyle(fontSize: 18.0)),
//         Row(
//           children: [
//             SizedBox(
//               width: 270,
//               height: 60,
//               child: TextFormField(
//                 controller: propertyController,
//                 decoration: const InputDecoration(
//                   labelText: 'Property',
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
//         Row(
//           children: [
//             SizedBox(
//               width: 270,
//               height: 60,
//               child: TextFormField(
//                 controller: expectationController,
//                 decoration: const InputDecoration(
//                   labelText: 'Expectations',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             const Icon(
//               Icons.keyboard_arrow_up,
//               size: 30,
//               color: AppTheme.primaryColor,
//             ),
//             const Icon(
//               Icons.delete,
//               color: AppTheme.primaryColor,
//             ),
//           ],
//         ),

//         // Submit Button
//         ElevatedButton(
//           onPressed: () async {
//             // Get input data from controllers
//             String property = propertyController.text;
//             String expectation = expectationController.text;

//             // Call the API
//             await EducationDetailsRequest()
//                 .otherDetailsApi(property, expectation, email, contact);

//             // Navigate to PersonalTesting screen with data
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) => PersonalTesting(
//             //       title: "Other Details",
//             //       property: property,
//             //       expectation: expectation,
//             //     ),
//             //   ),
//             // );
//           },
//           child: Text("Submit Other Details"),
//         ),

//         ...widget.fields.map((field) => DynamicField(field: field)),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../request/education_details_api.dart';
import '../screens/AppTheme.dart';
import 'dynamic_field.dart';

class OtherDetailsSection extends StatefulWidget {
  final List<Map<String, dynamic>> fields;

  const OtherDetailsSection({Key? key, required this.fields}) : super(key: key);

  @override
  _OtherDetailsSectionState createState() => _OtherDetailsSectionState();
}

class _OtherDetailsSectionState extends State<OtherDetailsSection> {
  // Declare TextEditingControllers for all fields
  final TextEditingController propertyController = TextEditingController();
  final TextEditingController expectationController = TextEditingController();
  final TextEditingController emailController =
      TextEditingController(); // For email
  final TextEditingController contactController =
      TextEditingController(); // For contact

  @override
  void dispose() {
    // Dispose of all the controllers
    propertyController.dispose();
    expectationController.dispose();
    emailController.dispose();
    contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Other Details', style: TextStyle(fontSize: 18.0)),
        // Property Field
        Row(
          children: [
            SizedBox(
              width: 270,
              height: 60,
              child: TextFormField(
                controller: propertyController,
                decoration: const InputDecoration(
                  labelText: 'Property',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 30,
              color: AppTheme.primaryColor,
            ),
            const Icon(
              Icons.delete,
              color: AppTheme.primaryColor,
            ),
          ],
        ),
        // Expectation Field
        Row(
          children: [
            SizedBox(
              width: 270,
              height: 60,
              child: TextFormField(
                controller: expectationController,
                decoration: const InputDecoration(
                  labelText: 'Expectations',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_up,
              size: 30,
              color: AppTheme.primaryColor,
            ),
            const Icon(
              Icons.delete,
              color: AppTheme.primaryColor,
            ),
          ],
        ),
        // Email Field
        Row(
          children: [
            SizedBox(
              width: 270,
              height: 60,
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        // Contact Field
        Row(
          children: [
            SizedBox(
              width: 270,
              height: 60,
              child: TextFormField(
                controller: contactController,
                decoration: const InputDecoration(
                  labelText: 'Contact',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        // Submit Button
        ElevatedButton(
          onPressed: () async {
            // Get input data from all controllers
            String property = propertyController.text;
            String expectation = expectationController.text;
            String email = emailController.text;
            String contact = contactController.text;

            // Call the API with all the gathered data
            await EducationDetailsRequest()
                .otherDetailsApi(property, expectation, email, contact);
          },
          child: Text("Submit Other Details"),
        ),
        ...widget.fields.map((field) => DynamicField(field: field)),
      ],
    );
  }
}
