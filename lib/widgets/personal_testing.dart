import 'package:flutter/material.dart';

class PersonalTesting extends StatelessWidget {
  final String title;
  final String fullName;
  final String caste;
  final String subCaste;
  final String bloodGroup;
  final String birthDate;
  final String birthTime;
  final String height;
  final String gothra;
  final String complexion;
  final String property; // Add property
  final String expectation; // Add expectation

  const PersonalTesting({
    Key? key,
    required this.title,
    required this.fullName,
    required this.caste,
    required this.subCaste,
    required this.bloodGroup,
    required this.birthDate,
    required this.birthTime,
    required this.height,
    required this.gothra,
    required this.complexion,
    required this.property, // Add property to constructor
    required this.expectation, // Add expectation to constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title: $title', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text('Full Name: $fullName', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text('Caste: $caste', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text('Sub Caste: $subCaste', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text('Blood Group: $bloodGroup', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text('Birth Date: $birthDate', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text('Birth Time: $birthTime', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text('Height: $height', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text('Gothra: $gothra', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text('Complexion: $complexion', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 16),
              Divider(), // Divider between sections
              Text('Property: $property',
                  style: TextStyle(fontSize: 18)), // Display property
              const SizedBox(height: 8),
              Text('Expectation: $expectation',
                  style: TextStyle(fontSize: 18)), // Display expectation
            ],
          ),
        ),
      ),
    );
  }
}
