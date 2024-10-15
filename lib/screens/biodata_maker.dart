import 'dart:convert'; // For JSON encoding/decoding
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // For making API calls

class DynamicForm extends StatefulWidget {
  @override
  _DynamicFormState createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  List<Map<String, dynamic>> personalDetails = [];
  Map<String, dynamic> formData = {};
  bool isLoading = true; // To track loading state

  @override
  void initState() {
    super.initState();
    fetchFieldsData(); // Fetch fields data from the API
  }

  // Fetch data from the get_all_fields_data_api
  Future<void> fetchFieldsData() async {
    final url = Uri.parse('https://example.com/get_all_fields_data_api');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final data = jsonDecode(response.body);

        // Assuming that the response contains the 'personal_details' key
        setState(() {
          personalDetails =
              List<Map<String, dynamic>>.from(data['personal_details']);

          // Initialize formData with default values from the API response
          for (var field in personalDetails) {
            formData[field['param']] = field['value'];
          }

          isLoading = false; // Data has been loaded
        });
      } else {
        print('Failed to load fields. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching fields: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Form'),
      ),
      body: isLoading
          ? Center(
              child:
                  CircularProgressIndicator()) // Show loader while fetching data
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: personalDetails.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> field = personalDetails[index];
                        return buildField(field);
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Call the function to post the data
                      postFormData();
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
    );
  }

  // Widget to build each form field dynamically
  Widget buildField(Map<String, dynamic> field) {
    String type = field['type'];
    String label = field['label'];
    String param = field['param'];
    dynamic value = field['value'];
    List<dynamic> options = field['options'];

    switch (type) {
      case 'text':
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TextFormField(
            initialValue: value,
            decoration: InputDecoration(
              labelText: label,
            ),
            onChanged: (val) {
              formData[param] = val;
            },
          ),
        );
      case 'date':
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ListTile(
            title: Text(label),
            subtitle: Text(formData[param] ?? ''),
            trailing: Icon(Icons.calendar_today),
            onTap: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (selectedDate != null) {
                setState(() {
                  formData[param] = selectedDate.toString();
                });
              }
            },
          ),
        );
      case 'dropdown':
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: DropdownButtonFormField<String>(
            value: value,
            items: options
                .map<DropdownMenuItem<String>>(
                    (option) => DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        ))
                .toList(),
            onChanged: (val) {
              formData[param] = val;
            },
            decoration: InputDecoration(
              labelText: label,
            ),
          ),
        );
      default:
        return Container();
    }
  }

  // Function to post form data to save_personal_api
  Future<void> postFormData() async {
    final url = Uri.parse('https://example.com/save_personal_api');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(formData), // Convert the formData map to JSON
      );

      if (response.statusCode == 200) {
        // Handle success
        print('Form data submitted successfully');
      } else {
        // Handle error
        print(
            'Failed to submit form data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error posting form data: $e');
    }
  }
}
