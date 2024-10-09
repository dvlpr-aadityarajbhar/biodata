import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalDetailsPage extends StatefulWidget {
  final Map<String, String>? initialValues;

  const PersonalDetailsPage({super.key, this.initialValues});

  @override
  _PersonalDetailsPageState createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  String? _uploadImageUrl;

  late final TextEditingController biodataTitleController;
  late final List<Map<String, dynamic>> _fields;
  final List<String> castes = [
    'Buddhism',
    'Christianity',
    'Hindu',
    'Islam',
    'Jainism',
    'Sikh'
  ];
  final List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'O+', 'O-'];
  final List<String> heights = [
    '4.10"',
    '5.00"',
    '5.02"',
    '5.04"',
    '5.06"',
    '5.08"',
    '6.00"',
    '6.01"',
    '6.02"',
    '6.03"',
    '6.04"',
    '6.05"',
    '6.06"',
    '6.07"',
  ];

  final List<String> years =
      List<String>.generate(100, (index) => (2023 - index).toString());
  final List<String> months =
      List<String>.generate(12, (index) => (index + 1).toString());
  final List<String> days =
      List<String>.generate(31, (index) => (index + 1).toString());

  String? selectedYear;
  String? selectedMonth;
  String? selectedDay;

  String? selectedCaste;
  String? selectedBloodGroup;
  String? selectedHeight;
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();

    biodataTitleController = TextEditingController(
      text: widget.initialValues?['Biodata Title'] ??
          "|| Shree Ganeshaya Namah ||",
    );

    _fields = [
      {
        'label': 'Full Name',
        'controller': TextEditingController(
            text: widget.initialValues?['Full Name'] ?? '')
      },
      {
        'label': 'Caste',
        'controller':
            TextEditingController(text: widget.initialValues?['Caste'] ?? '')
      },
      {
        'label': 'Subcaste',
        'controller': TextEditingController(
            text: widget.initialValues?['Sub-caste'] ?? '')
      },
      {'label': 'BirthDate', 'controller': null},
      {
        'label': 'BirthTime',
        'controller': TextEditingController(
            text: widget.initialValues?['Birth Time'] ?? '')
      },
      {
        'label': 'BirthPlace',
        'controller': TextEditingController(
            text: widget.initialValues?['Birth Place'] ?? '')
      },
      {
        'label': 'Height',
        'controller':
            TextEditingController(text: widget.initialValues?['Height'] ?? '')
      },
      // {
      //   'label': 'Blood_Group',
      //   'controller': TextEditingController(
      //       text: widget.initialValues?['Blood Group'] ?? '')
      // },
      {
        'label': 'Gothra',
        'controller': TextEditingController(
            text: widget.initialValues?['Devak/Gotra'] ?? ''),
        'moveable': true
      },
      {
        'label': 'Complexion',
        'controller': TextEditingController(
            text: widget.initialValues?['Complexion'] ?? ''),
        'moveable': true
      },
    ];

    selectedDay = widget.initialValues?['Day'];
    selectedMonth = widget.initialValues?['Month'];
    selectedYear = widget.initialValues?['Year'];
    selectedCaste = widget.initialValues?['Caste'];
    selectedHeight = widget.initialValues?['Height'];
    selectedBloodGroup = widget.initialValues?['Blood Group'];
    selectedTime = widget.initialValues?['Birth Time'] != null
        ? TimeOfDay.fromDateTime(
            DateTime.parse("2021-01-01 ${widget.initialValues?['Birth Time']}"))
        : null;
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (selectedYear == null ||
          selectedMonth == null ||
          selectedDay == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('please select a complete birth date')),
        );
        return;
      }

      // Prepare data to send
      Map<String, String> formData = {
        'username': _fields[0]['controller'].text,
        'caste': _fields[1]['controller'].text,
        'subcaste': _fields[2]['controller'].text,
        // 'birthdate': '$selectedYear-$selectedMonth-$selectedDay',
        'birthtime': _fields[4]['controller'].text,
        'birthplace': _fields[5]['controller'].text,
        'height': selectedHeight ?? '',
        //  'blood_group': selectedBloodGroup ?? '',
        'gothra': _fields[8]['controller'].text,
        'complexion': _fields[9]['controller'].text,
        'title': biodataTitleController.text,
        // 'photo1': _image?.path ?? '',
        //  "photo1": new File(_image?.path)
      };

      try {
        // Get Shared Prefereences

        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? matriId = prefs.getString('matri_id');
        String? biodataId = prefs.getString('biodata_id');
        print(_fields[2]['controller'].text);
        print(matriId);
        // print(biodataId);
        // return;
        // Add matriid to formdata
        formData['matri_id'] = matriId ?? '';
        // formData['biodata_id'] = '145';

        if (biodataId != 123) {
          print(biodataId);
          return;

          formData['biodata_id'] = biodataId ?? '';
        }
        print(formData);
        // return;
        // POST request to create the initail record
        final response = await http.post(
          Uri.parse(
              'https://techfluxsolutions.com/royal_maratha/api/users/personal_details'),
          body: formData,
        );

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);

          if (data["response"] == true) {
            print(data);
            // return;
            //  print('Response body: ${response.body}');
            String biodataId = data["data"]["biodata_id"].toString();
            // print(biodataId);
            // var matriId = data["data"]["matri_id"];
            // Remove data for the 'biodata_id' key.
            await prefs.remove('biodata_id');
            await prefs.setString('biodata_id', biodataId);
            // Navigate to the next page
            // _navigateToNextPage();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(data["error_msg"] ?? 'Unknown error occurred'),
            ));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Error: Could not submit data. Status code: ${response.statusCode}'),
          ));
        }
      } catch (e) {
        print("Error during form submission: $e");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('An unexpected error occurred. Please try again.'),
        ));
      }
    }
  }

  // void _navigateToNextPage() {
  //   Navigator.push(
  //     context,
  //     // MaterialPageRoute(builder: (context) => const EducationOccupationPage()),
  //   );
  // }

  bool _validateHeight(String value) {
    final heightRegex = RegExp(r'^\d\.\d{2}$');
    return heightRegex.hasMatch(value);
  }

  bool _validateBloodGroup(String value) {
    // This list contains all valid blood group types
    final validBloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
    return validBloodGroups.contains(value.toUpperCase());
  }

  Widget _buildTextField(String label, TextEditingController? controller,
      {int? index}) {
    if (label == 'Caste') {
      return DropdownButtonFormField<String>(
        value: selectedCaste,
        items: castes.map((String caste) {
          return DropdownMenuItem<String>(
            value: caste,
            child: Text(caste),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedCaste = newValue;
          });
        },
        decoration: InputDecoration(labelText: label),
        validator: (value) => value == null ? 'Please select a caste' : null,
      );
    } else if (label == 'Height') {
      return DropdownButtonFormField<String>(
        value: selectedHeight,
        items: heights.map((String heights) {
          return DropdownMenuItem<String>(
            value: heights,
            child: Text(heights),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedHeight = newValue;
          });
        },
        decoration: InputDecoration(labelText: label),
        validator: (value) => value == null ? 'Please select a height' : null,
      );
    } else if (label == 'Blood_Group') {
      return DropdownButtonFormField<String>(
        value: selectedBloodGroup,
        items: bloodGroups.map((String group) {
          return DropdownMenuItem<String>(
            value: group,
            child: Text(group),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedBloodGroup = newValue;
          });
        },
        decoration: InputDecoration(labelText: label),
        validator: (value) =>
            value == null ? 'Please select a blood group' : null,
      );
    } else if (label == 'BirthTime') {
      return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: IconButton(
            icon: const Icon(Icons.access_time),
            onPressed: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: selectedTime ?? TimeOfDay.now(),
              );
              if (picked != null && picked != selectedTime) {
                setState(() {
                  selectedTime = picked;
                  controller!.text = picked.format(context);
                });
              }
            },
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $label';
          }
          return null;
        },
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(labelText: label),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your $label';
                }
                if (label == 'Height' && !_validateHeight(value)) {
                  return 'Enter height in format "X.XX"';
                }
                if (label == 'Blood Group' && !_validateBloodGroup(value)) {
                  return 'Enter a valid blood group (e.g., A+, O-)';
                }
                return null;
              },
            ),
          ),
          if (index != null && _fields[index]['moveable'] == true)
            Row(
              children: [
                // Up Arrow
                IconButton(
                  icon: const Icon(Icons.arrow_upward, size: 16),
                  onPressed: () {
                    setState(() {
                      if (index > 0) {
                        final temp = _fields[index];
                        _fields[index] = _fields[index - 1];
                        _fields[index - 1] = temp;
                      }
                    });
                  },
                ),

                // Down Arrow
                IconButton(
                  icon: const Icon(Icons.arrow_downward, size: 16),
                  onPressed: () {
                    setState(() {
                      if (index < _fields.length - 1) {
                        final temp = _fields[index];
                        _fields[index] = _fields[index + 1];
                        _fields[index + 1] = temp;
                      }
                    });
                  },
                ),

                // Delete Icon
                IconButton(
                  icon: const Icon(Icons.delete, size: 16, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      _fields.removeAt(index);
                    });
                  },
                ),
              ],
            ),
        ],
      );
    }
  }

  Widget _buildBirthdayField() {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Date'),
            value: selectedDay,
            items: days.map((String day) {
              return DropdownMenuItem<String>(
                value: day,
                child: Text(day),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedDay = newValue;
              });
            },
            validator: (value) => value == null ? 'Select Day' : null,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Month'),
            value: selectedMonth,
            items: months.map((String month) {
              return DropdownMenuItem<String>(
                value: month,
                child: Text(month),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedMonth = newValue;
              });
            },
            validator: (value) => value == null ? 'Select Month' : null,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Year'),
            value: selectedYear,
            items: years.map((String year) {
              return DropdownMenuItem<String>(
                value: year,
                child: Text(year),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedYear = newValue;
              });
            },
            validator: (value) => value == null ? 'Select Year' : null,
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.readAsBytes() as String);
      });
    }
  }

  void _addNewField() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController fieldNameController = TextEditingController();
        return AlertDialog(
          title: const Text('Add New Field'),
          content: TextFormField(
            controller: fieldNameController,
            decoration: const InputDecoration(hintText: 'Enter field name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _fields.add({
                    'label': fieldNameController.text,
                    'controller': TextEditingController(),
                    'moveable': true,
                  });
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToPreviousPage() {
    // Logic for navigating to the previous page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 6.0),
          child: Text(
            'Create Biodata',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color(0xFFFF5507),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // ... [Keep existing widgets]
              // Personal Details Title with Arrows on Both Sides
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon:
                        const Icon(Icons.arrow_back, color: Color(0xFFFF5507)),
                    onPressed: _navigateToPreviousPage,
                  ),
                  const Text(
                    'Personal Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward,
                        color: Color(0xFFFF5507)),
                    onPressed: _submitForm,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Biodata Title
              const Center(
                child: Text(
                  'Biodata Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: biodataTitleController,
                decoration: const InputDecoration(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? Icon(Icons.add_a_photo,
                            size: 50, color: Colors.grey[700])
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              _buildTextField('Full Name', _fields[0]['controller']),
              const SizedBox(height: 10),
              _buildTextField('Caste', _fields[1]['controller']),
              const SizedBox(height: 10),
              _buildTextField('Subcaste', _fields[2]['controller']),
              const SizedBox(height: 10),
              _buildBirthdayField(),
              const SizedBox(height: 10),
              _buildTextField('BirthTime', _fields[4]['controller']),
              const SizedBox(height: 10),
              _buildTextField('BirthPlace', _fields[5]['controller']),
              const SizedBox(height: 10),
              _buildTextField('Height', _fields[6]['controller']),
              const SizedBox(height: 10),
              _buildTextField('Blood_Group', _fields[7]['controller']),
              const SizedBox(height: 10),
              for (int i = 8; i < _fields.length; i++)
                _buildTextField(_fields[i]['label'], _fields[i]['controller'],
                    index: i),
              const SizedBox(height: 10),

              // ... [Keep existing buttons and layout]
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFFFF5507),
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  minimumSize: const Size(325, 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _addNewField,
                child: const Text('+ Add New Field'),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFFFF5507),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      minimumSize: const Size(325, 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _submitForm,
                    child: const Text('Save and Continue'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
