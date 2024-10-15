// // // // // // // // providers/user_provider.dart
// // // // // // // import 'package:bio_data_maker/models/show_biodata_model.dart';
// // // // // // // import 'package:bio_data_maker/request/showbiodatabymatri_id.dart';
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:shared_preferences/shared_preferences.dart';

// // // // // // // class ShowbiodataController with ChangeNotifier {
// // // // // // //   bool _loading = false;
// // // // // // //   bool get loading => _loading;
// // // // // // //   ShowBiodataModel? userData;

// // // // // // //   // Fetch biodata, no need to pass matriId as a parameter anymore
// // // // // // //   Future<void> fetchBiodata() async {
// // // // // // //     _loading = true;
// // // // // // //     // notifyListeners(); // Notify listeners that loading has started

// // // // // // //     try {
// // // // // // //       // Get the saved matri_id from SharedPreferences
// // // // // // //       SharedPreferences pref = await SharedPreferences.getInstance();
// // // // // // //       String? matriId = pref.getString("matri_id");

// // // // // // //       // Check if matriId is not null
// // // // // // //       if (matriId != null) {
// // // // // // //         // Call the API using the retrieved matri_id
// // // // // // //         userData = await ShowbiodatabymatriId.showBiodata(matriId);
// // // // // // //         print("Biodata fetched for matri_id: $matriId");
// // // // // // //       } else {
// // // // // // //         print("matri_id not found in SharedPreferences");
// // // // // // //       }
// // // // // // //     } catch (e) {
// // // // // // //       print("Error fetching biodata: $e");
// // // // // // //     } finally {
// // // // // // //       _loading = false;
// // // // // // //       notifyListeners(); // Notify listeners that loading has finished
// // // // // // //     }
// // // // // // //   }
// // // // // // // }

// // // // // // import 'dart:convert';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:shared_preferences/shared_preferences.dart';

// // // // // // import '../request/showbiodatabymatri_id.dart';

// // // // // // class ShowbiodataController with ChangeNotifier {
// // // // // //   bool _loading = false;
// // // // // //   bool get loading => _loading;

// // // // // //   Map<String, dynamic>? userData; // Store the raw data instead of the model

// // // // // //   // Fetch biodata without returning a model
// // // // // //   Future<void> fetchBiodata() async {
// // // // // //     _loading = true;
// // // // // //     notifyListeners(); // Notify listeners that loading has started

// // // // // //     try {
// // // // // //       // Call the API to fetch the biodata
// // // // // //       await ShowbiodatabymatriId.showBiodata();

// // // // // //       // Retrieve the stored response from SharedPreferences
// // // // // //       SharedPreferences pref = await SharedPreferences.getInstance();
// // // // // //       String? biodataResponse = pref.getString('biodata_response');

// // // // // //       // If the response is not null, parse it into a Map
// // // // // //       if (biodataResponse != null) {
// // // // // //         userData = jsonDecode(biodataResponse);
// // // // // //         print("Biodata fetched: $userData");
// // // // // //       } else {
// // // // // //         print("No biodata found in SharedPreferences");
// // // // // //       }
// // // // // //     } catch (e) {
// // // // // //       print("Error fetching biodata: $e");
// // // // // //     } finally {
// // // // // //       _loading = false;
// // // // // //       notifyListeners(); // Notify listeners that loading has finished
// // // // // //     }
// // // // // //   }

// // // // // //   ShowbiodataController() {
// // // // // //     // Initialize with empty data or fetch from an API
// // // // // //     userData = {
// // // // // //       'data': [],
// // // // // //     };
// // // // // //   }

// // // // // //   // Method to add dummy biodata
// // // // // //   void addDummyBiodata() {
// // // // // //     // Create a dummy biodata entry
// // // // // //     final newBiodata = {
// // // // // //       'username': 'Sample User',
// // // // // //       'caste': 'Sample Caste',
// // // // // //       'subcaste': 'Sample Subcaste',
// // // // // //       'birthdate': '12-06-2000',
// // // // // //       'birthtime': '12:00 PM',
// // // // // //       'birthplace': 'Sample Place',
// // // // // //       'height': '5.6',
// // // // // //       'blood_group': 'O+',
// // // // // //       'mobile': '1234567890',
// // // // // //       'gothra': 'Sample Gothra',
// // // // // //       'complexion': 'Fair',
// // // // // //       'education_level': 'Bachelor',
// // // // // //       'occupation': 'Engineer',
// // // // // //       'income': '50000',
// // // // // //       'father_name': 'Sample Father',
// // // // // //       'father_occupation': 'Business',
// // // // // //       'mother_name': 'Sample Mother',
// // // // // //       'mother_occupation': 'Housewife',
// // // // // //       'no_of_brothers': '1',
// // // // // //       'no_of_sisters': '1',
// // // // // //       'address': 'Sample Address',
// // // // // //       'native_taluka': 'Sample Native',
// // // // // //       'property': 'Sample Property',
// // // // // //       'expectations': 'Sample Expectations',
// // // // // //     };

// // // // // //     // Add the new sample to the list
// // // // // //     userData!['data'].add(newBiodata);

// // // // // //     // Notify listeners to rebuild the UI
// // // // // //     notifyListeners();
// // // // // //   }
// // // // // // }

// // // // // import 'dart:convert';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:shared_preferences/shared_preferences.dart';

// // // // // import '../request/showbiodatabymatri_id.dart';

// // // // // class ShowbiodataController with ChangeNotifier {
// // // // //   bool _loading = false;
// // // // //   bool get loading => _loading;

// // // // //   // Map<String, dynamic>? userData; // Store the raw data instead of the model
// // // // //   List<Map<String, dynamic>> userData = [];
// // // // //   // Fetch biodata without returning a model
// // // // //   Future<void> fetchBiodata() async {
// // // // //     _loading = true;
// // // // //     notifyListeners(); // Notify listeners that loading has started

// // // // //     try {
// // // // //       // Call the API to fetch the biodata
// // // // //       await ShowbiodatabymatriId.showBiodata();

// // // // //       // Retrieve the stored response from SharedPreferences
// // // // //       SharedPreferences pref = await SharedPreferences.getInstance();
// // // // //       String? biodataResponse = pref.getString('biodata_response');

// // // // //       // If the response is not null, parse it into a Map
// // // // //       if (biodataResponse != null) {
// // // // //         userData = jsonDecode(biodataResponse);
// // // // //         print("Biodata fetched: $userData");
// // // // //       } else {
// // // // //         print("No biodata found in SharedPreferences");
// // // // //       }
// // // // //     } catch (e) {
// // // // //       print("Error fetching biodata: $e");
// // // // //     } finally {
// // // // //       _loading = false;
// // // // //       notifyListeners(); // Notify listeners that loading has finished
// // // // //     }
// // // // //   }

// // // // //   ShowbiodataController() {
// // // // //     // Initialize with empty data or fetch from an API
// // // // //     userData = {
// // // // //       'data': [], // Initialize with an empty list
// // // // //     };
// // // // //   }

// // // // //   // Method to add dummy biodata at the top of the list
// // // // //   void addDummyBiodata() {
// // // // //     // Create a dummy biodata entry
// // // // //     final newBiodata = {
// // // // //       'username': 'Sample User',
// // // // //       'caste': 'Sample Caste',
// // // // //       'subcaste': 'Sample Subcaste',
// // // // //       'birthdate': '12-06-2000',
// // // // //       'birthtime': '12:00 PM',
// // // // //       'birthplace': 'Sample Place',
// // // // //       'height': '5.6',
// // // // //       'blood_group': 'O+',
// // // // //       'mobile': '1234567890',
// // // // //       'gothra': 'Sample Gothra',
// // // // //       'complexion': 'Fair',
// // // // //       'education_level': 'Bachelor',
// // // // //       'occupation': 'Engineer',
// // // // //       'income': '50000',
// // // // //       'father_name': 'Sample Father',
// // // // //       'father_occupation': 'Business',
// // // // //       'mother_name': 'Sample Mother',
// // // // //       'mother_occupation': 'Housewife',
// // // // //       'no_of_brothers': '1',
// // // // //       'no_of_sisters': '1',
// // // // //       'address': 'Sample Address',
// // // // //       'native_taluka': 'Sample Native',
// // // // //       'property': 'Sample Property',
// // // // //       'expectations': 'Sample Expectations',
// // // // //       'profile_image': 'assets/images/profile.png', // Dummy image URL
// // // // //     };

// // // // //     // Add the new sample to the top of the list
// // // // //     userData!['data'].insert(0, newBiodata);

// // // // //     // Notify listeners to rebuild the UI
// // // // //     notifyListeners();
// // // // //   }

// // // // void copyBiodata(Map<String, dynamic> biodata) {
// // // //   // Duplicate the biodata entry
// // // //   userData.add(Map.from(biodata)); // Create a copy to avoid reference issues
// // // //   notifyListeners(); // Notify listeners to rebuild the UI
// // // // }
// // // // // }

// // // import 'dart:convert';
// // // import 'package:flutter/material.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';

// // // import '../request/home_screen_apis.dart';
// // // import '../request/showbiodatabymatri_id.dart';

// // // class ShowbiodataController with ChangeNotifier {
// // //   bool _loading = false;
// // //   bool get loading => _loading;

// // //   // userData will store a list of biodata entries
// // //   List<Map<String, dynamic>> userData = [];

// // //   Future<void> fetchBiodata() async {
// // //     _loading = true;
// // //     notifyListeners(); // Notify listeners that loading has started

// // //     try {
// // //       // Call the API to fetch the biodata
// // //       await ShowbiodatabymatriId.showBiodata();

// // //       // Retrieve the stored response from SharedPreferences
// // //       SharedPreferences pref = await SharedPreferences.getInstance();
// // //       String? biodataResponse = pref.getString('biodata_response');

// // //       // If the response is not null, parse it into a Map
// // //       if (biodataResponse != null) {
// // //         // Parse the response as a Map
// // //         Map<String, dynamic> parsedResponse = jsonDecode(biodataResponse);

// // //         // Check for success in the API response
// // //         if (parsedResponse['status'] == true &&
// // //             parsedResponse['data'] != null) {
// // //           // Extract the list from the "data" key
// // //           List<dynamic> biodataList = parsedResponse['data'];

// // //           // Ensure the list is a List<Map<String, dynamic>> by casting
// // //           userData = biodataList.cast<Map<String, dynamic>>();

// // //           print("Biodata fetched: $userData");
// // //         } else {
// // //           print("Error: ${parsedResponse['message'] ?? 'No data found'}");
// // //         }
// // //       } else {
// // //         print("No biodata found in SharedPreferences");
// // //       }
// // //     } catch (e) {
// // //       print("Error fetching biodata: $e");
// // //     } finally {
// // //       _loading = false;
// // //       notifyListeners(); // Notify listeners that loading has finished
// // //     }
// // //   }

// // //   // Method to add dummy biodata at the top of the list
// // //   void addDummyBiodata() {
// // //     // Create a dummy biodata entry
// // //     final newBiodata = {
// // //       'username': 'Tejas Manilal Patel',
// // //       'caste': 'Hindu',
// // //       'subcaste': 'Sample Subcaste',
// // //       'birthdate': '12-06-2000',
// // //       'birthtime': '12:00 PM',
// // //       'birthplace': 'Sample Place',
// // //       'height': '5ft 2in',
// // //       'blood_group': 'O+',
// // //       'mobile': '1234567890',
// // //       'gothra': 'Sample Gothra',
// // //       'complexion': 'Fair',
// // //       'education_level': 'Bachelor',
// // //       'occupation': 'Engineer',
// // //       'income': '50000',
// // //       'father_name': 'Sample Father',
// // //       'father_occupation': 'Business',
// // //       'mother_name': 'Sample Mother',
// // //       'mother_occupation': 'Housewife',
// // //       'no_of_brothers': '1',
// // //       'no_of_sisters': '1',
// // //       'address': 'Sample Address',
// // //       'native_taluka': 'Sample Native',
// // //       'property': 'Sample Property',
// // //       'expectations': 'Sample Expectations',
// // //       'profile_image': 'assets/images/profile.png', // Dummy image URL
// // //     };

// // //     // Add the new sample to the top of the list
// // //     userData.insert(0, newBiodata);

// // //     // Notify listeners to rebuild the UI
// // //     notifyListeners();
// // //   }

// // //   void clearBiodata() {
// // //     userData.clear();
// // //     notifyListeners(); // Notify UI to rebuild after clearing the list
// // //   }

// // // void copyBiodata(Map<String, dynamic> biodata) {
// // //   // Duplicate the biodata entry
// // //   userData.add(Map.from(biodata)); // Create a copy to avoid reference issues
// // //   notifyListeners(); // Notify listeners to rebuild the UI
// // // }

// // //   // Future<bool> copySample(String id) async {
// // //   //   _loading = true;
// // //   //   notifyListeners(); // Notify that copying process started

// // //   //   try {
// // //   //     bool success = await HomeScreenApis().copySampleApi(id);
// // //   //     if (success) {
// // //   //       // After successful copy, you can fetch updated data
// // //   //       await fetchBiodata(); // Refresh list after copying
// // //   //     } else {
// // //   //       print("Failed to copy sample");
// // //   //     }
// // //   //     return success; // Return the success flag
// // //   //   } catch (e, t) {
// // //   //     print("Error occurred while copying sample: $e");
// // //   //     print("Stacktrace: $t");
// // //   //     return false; // Handle any errors
// // //   //   } finally {
// // //   //     _loading = false;
// // //   //     notifyListeners(); // Notify that copying process is done
// // //   //   }
// // //   // }
// // // }

// // // // import 'dart:convert';
// // // // import 'dart:developer';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:shared_preferences/shared_preferences.dart';

// // // // import '../models/dummy_sample_model.dart';
// // // // import '../request/home_screen_apis.dart';
// // // // import '../request/showbiodatabymatri_id.dart';

// // // // class ShowbiodataController with ChangeNotifier {
// // // //   bool _loading = false;
// // // //   bool get loading => _loading;

// // // //   List<Map<String, dynamic>> userData = [];

// // // //   List<Data> AddSampleData = [];
// // // //   bool isLoading = false;

// // // //   // Create Biodata API - Adding Sample
// // // //   Future<void> createBiodataApi() async {
// // // //     setLoading(true);

// // // //     DummySampleModel? responseModel =
// // // //         await HomeScreenApis().addDummySampleApi();
// // // //     if (responseModel != null && responseModel.data != null) {
// // // //       AddSampleData.add(responseModel.data!);
// // // //       notifyListeners(); // Notify listeners after updating the data list
// // // //     }

// // // //     setLoading(false);
// // // //   }

// // // //   void setLoading(bool value) {
// // // //     isLoading = value;
// // // //     notifyListeners(); // Notify listeners when loading state changes
// // // //   }

// // // //   // Fetch biodata without returning a model
// // // //   Future<void> fetchBiodata() async {
// // // //     _loading = true;
// // // //     notifyListeners(); // Notify listeners that loading has started

// // // //     try {
// // // //       // Call the API to fetch the biodata
// // // //       await ShowbiodatabymatriId.showBiodata();

// // // //       // Retrieve the stored response from SharedPreferences
// // // //       SharedPreferences pref = await SharedPreferences.getInstance();
// // // //       String? biodataResponse = pref.getString('biodata_response');

// // // //       // If the response is not null, parse it into a Map
// // // //       if (biodataResponse != null) {
// // // //         // Parse the response as a Map
// // // //         Map<String, dynamic> parsedResponse = jsonDecode(biodataResponse);

// // // //         // Extract the list from the "data" key
// // // //         List<dynamic> biodataList = parsedResponse['data'];

// // // //         // Ensure the list is a List<Map<String, dynamic>> by casting
// // // //         userData = biodataList.cast<Map<String, dynamic>>();

// // // //         print("Biodata fetched: $AddSampleData");
// // // //       } else {
// // // //         print("No biodata found in SharedPreferences");
// // // //       }
// // // //     } catch (e) {
// // // //       print("Error fetching biodata: $e");
// // // //     } finally {
// // // //       _loading = false;
// // // //       notifyListeners(); // Notify listeners that loading has finished
// // // //     }
// // // //   }

// // //   //  List<Data> userData = [];
// // //   // bool loading = false;

// // //   // void setLoading(bool value) {
// // //   //   loading = value;
// // //   //   notifyListeners();
// // //   // }

// // //   // Future<void> addDummySampleApi() async {
// // //   //   setLoading(true);

// // //   //   Uri url = Uri.parse(
// // //   //       "https://techfluxsolutions.com/royal_maratha/api/users/create_sample_template");

// // //   //   SharedPreferences pref = await SharedPreferences.getInstance();
// // //   //   String? matriId = pref.getString("matri_id");

// // //   //   var payload = {
// // //   //     "matri_id": matriId,
// // //   //   };

// // //   //   try {
// // //   //     http.Response res = await http.post(
// // //   //       url,
// // //   //       body: jsonEncode(payload),
// // //   //       headers: {
// // //   //         'Content-Type': 'application/json',
// // //   //         'Accept': 'application/json',
// // //   //       },
// // //   //     );

// // //   //     if (res.statusCode == 200) {
// // //   //       log("Dummy sample created successfully: ${res.statusCode}");
// // //   //       DummySampleModel responseModel =
// // //   //           DummySampleModel.fromJson(jsonDecode(res.body));
// // //   //       userData.add(responseModel.data!); // Add new biodata to list
// // //   //     } else {
// // //   //       log("Failed to create dummy sample: ${res.statusCode}");
// // //   //     }
// // //   //   } catch (e, t) {
// // //   //     log("Exception occurred while creating dummy sample: $e");
// // //   //     log("Stacktrace: $t");
// // //   //   } finally {
// // //   //     setLoading(false);
// // //   //   }
// // //   // }
// // // // }

// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // import '../request/home_screen_apis.dart';
// // import '../request/showbiodatabymatri_id.dart';

// // class ShowbiodataController with ChangeNotifier {
// //   bool _loading = false;
// //   bool get loading => _loading;

// //   // userData will store a list of biodata entries
// //   List<Map<String, dynamic>> userData = [];

// //   Future<void> loadDummyBiodata() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     List<String>? existingBiodata = prefs.getStringList('dummy_biodata');

// //     if (existingBiodata != null) {
// //       userData = existingBiodata
// //           .map((item) => jsonDecode(item))
// //           .cast<Map<String, dynamic>>()
// //           .toList();
// //     }
// //   }

// //   Future<void> fetchBiodata() async {
// //     _loading = true;
// //     notifyListeners(); // Notify listeners that loading has started

// //     // Load the existing dummy biodata
// //     await loadDummyBiodata();

// //     try {
// //       // Call the API to fetch the biodata
// //       await ShowbiodatabymatriId.showBiodata();

// //       // Retrieve the stored response from SharedPreferences
// //       SharedPreferences pref = await SharedPreferences.getInstance();
// //       String? biodataResponse = pref.getString('biodata_response');

// //       // If the response is not null, parse it into a Map
// //       if (biodataResponse != null) {
// //         // Parse the response as a Map
// //         Map<String, dynamic> parsedResponse = jsonDecode(biodataResponse);

// //         // Check for success in the API response
// //         if (parsedResponse['status'] == true &&
// //             parsedResponse['data'] != null) {
// //           // Extract the list from the "data" key
// //           List<dynamic> biodataList = parsedResponse['data'];

// //           // Ensure the list is a List<Map<String, dynamic>> by casting
// //           userData.addAll(biodataList.cast<Map<String, dynamic>>());

// //           print("Biodata fetched: $userData");
// //         } else {
// //           print("Error: ${parsedResponse['message'] ?? 'No data found'}");
// //         }
// //       } else {
// //         print("No biodata found in SharedPreferences");
// //       }
// //     } catch (e) {
// //       print("Error fetching biodata: $e");
// //     } finally {
// //       _loading = false;
// //       notifyListeners(); // Notify listeners that loading has finished
// //     }
// //   }

// //   // Method to add dummy biodata at the top of the list
// //   void addDummyBiodata() async {
// //     // Create a dummy biodata entry
// //     final newBiodata = {
// //       'username': 'Tejas Manilal Patel',
// //       'caste': 'Hindu',
// //       'subcaste': 'Sample Subcaste',
// //       'birthdate': '12-06-2000',
// //       'birthtime': '12:00 PM',
// //       'birthplace': 'Sample Place',
// //       'height': '5ft 2in',
// //       'blood_group': 'O+',
// //       'mobile': '1234567890',
// //       'gothra': 'Sample Gothra',
// //       'complexion': 'Fair',
// //       'education_level': 'Bachelor',
// //       'occupation': 'Engineer',
// //       'income': '50000',
// //       'father_name': 'Sample Father',
// //       'father_occupation': 'Business',
// //       'mother_name': 'Sample Mother',
// //       'mother_occupation': 'Housewife',
// //       'no_of_brothers': '1',
// //       'no_of_sisters': '1',
// //       'address': 'Sample Address',
// //       'native_taluka': 'Sample Native',
// //       'property': 'Sample Property',
// //       'expectations': 'Sample Expectations',
// //       'profile_image': 'assets/images/profile.png', // Dummy image URL
// //     };

// //     // Add the new sample to the top of the list
// //     userData.insert(0, newBiodata);

// //     // Save the biodata to SharedPreferences
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     List<String> existingBiodata = prefs.getStringList('dummy_biodata') ?? [];
// //     existingBiodata.insert(
// //         0, jsonEncode(newBiodata)); // Store the new dummy biodata
// //     await prefs.setStringList('dummy_biodata', existingBiodata);

// //     // Notify listeners to rebuild the UI
// //     notifyListeners();
// //   }

// //   void clearBiodata() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs
// //         .remove('biodata_response'); // Clear the biodata response if needed
// //     userData.clear(); // Clear the user data in the controller
// //     notifyListeners(); // Notify listeners to rebuild the UI
// //   }

// //   void copyBiodata(Map<String, dynamic> biodata) {
// //     // Duplicate the biodata entry
// //     userData.add(Map.from(biodata)); // Create a copy to avoid reference issues
// //     notifyListeners(); // Notify listeners to rebuild the UI
// //   }

// //   // Method to delete a specific biodata entry
// //   Future<void> deleteBiodata(Map<String, dynamic> biodata) async {
// //     userData.remove(biodata); // Remove the biodata from the list

// //     // Update SharedPreferences to reflect the deletion
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     List<String> existingBiodata = prefs.getStringList('dummy_biodata') ?? [];

// //     // Re-save the remaining biodata in SharedPreferences
// //     existingBiodata = userData.map((item) => jsonEncode(item)).toList();
// //     await prefs.setStringList('dummy_biodata', existingBiodata);

// //     notifyListeners(); // Notify listeners to update the UI
// //   }
// // }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../request/showbiodatabymatri_id.dart';

// class ShowbiodataController with ChangeNotifier {
//   bool isLoading = false;
//   // bool get loading => _loading;

//   set loading(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   List<Map<String, dynamic>> userData = [];

//   Future<void> loadDummyBiodata() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String>? existingBiodata = prefs.getStringList('dummy_biodata');
//     if (existingBiodata != null) {
//       userData = existingBiodata
//           .map((item) => jsonDecode(item))
//           .cast<Map<String, dynamic>>()
//           .toList();
//     }
//   }

//   Future<void> fetchBiodata() async {
//     loading = true;
//     notifyListeners();

//     await loadDummyBiodata();

//     try {
//       await ShowbiodatabymatriId.showBiodata();

//       SharedPreferences pref = await SharedPreferences.getInstance();
//       String? biodataResponse = pref.getString('biodata_response');

//       if (biodataResponse != null) {
//         Map<String, dynamic> parsedResponse = jsonDecode(biodataResponse);

//         if (parsedResponse['status'] == true &&
//             parsedResponse['data'] != null) {
//           List<dynamic> biodataList = parsedResponse['data'];
//           userData.addAll(biodataList.cast<Map<String, dynamic>>());

//           print("Biodata fetched: $userData");
//         } else {
//           print("Error: ${parsedResponse['message'] ?? 'No data found'}");
//         }
//       } else {
//         print("No biodata found in SharedPreferences");
//       }
//     } catch (e) {
//       print("Error fetching biodata: $e");
//     } finally {
//       loading = false;
//       notifyListeners();
//     }
//   }

//   void addDummyBiodata() async {
//     loading = true;
//     notifyListeners();

//     // Simulating a 2-second delay for adding sample data
//     await Future.delayed(const Duration(seconds: 2));
//     final newBiodata = {
//       'username': 'Tejas Manilal Patel',
//       'caste': 'Hindu',
//       'subcaste': 'Sample Subcaste',
//       'birthdate': '12-06-2000',
//       'birthtime': '12:00 PM',
//       'birthplace': 'Sample Place',
//       'height': '5ft 2in',
//       'blood_group': 'O+',
//       'mobile': '1234567890',
//       'gothra': 'Sample Gothra',
//       'complexion': 'Fair',
//       'education_level': 'Bachelor',
//       'occupation': 'Engineer',
//       'income': '50000',
//       'father_name': 'Sample Father',
//       'father_occupation': 'Business',
//       'mother_name': 'Sample Mother',
//       'mother_occupation': 'Housewife',
//       'no_of_brothers': '1',
//       'no_of_sisters': '1',
//       'address': 'Sample Address',
//       'native_taluka': 'Sample Native',
//       'property': 'Sample Property',
//       'expectations': 'Sample Expectations',
//       'profile_image': 'assets/images/profile.png',
//     };

//     userData.insert(0, newBiodata);

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> existingBiodata = prefs.getStringList('dummy_biodata') ?? [];
//     existingBiodata.insert(0, jsonEncode(newBiodata));
//     await prefs.setStringList('dummy_biodata', existingBiodata);

//     notifyListeners();
//   }

//   void clearBiodata() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('biodata_response');
//     userData.clear();
//     notifyListeners();
//   }

//   void copyBiodata(Map<String, dynamic> biodata) {
//     userData.add(Map.from(biodata));
//     notifyListeners();
//   }

//   // Future<void> deleteBiodata(Map<String, dynamic> biodata) async {
//   //   userData.remove(biodata);

//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   List<String> existingBiodata = prefs.getStringList('dummy_biodata') ?? [];
//   //   existingBiodata = userData.map((item) => jsonEncode(item)).toList();
//   //   await prefs.setStringList('dummy_biodata', existingBiodata);

//   //   notifyListeners();
//   // }

//   // Future<void> deleteBiodata(Map<String, dynamic> biodata) async {
//   //   // Remove the selected biodata from the in-memory list
//   //   userData.remove(biodata);

//   //   // Get SharedPreferences instance
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();

//   //   // Retrieve and update the dummy biodata list in SharedPreferences
//   //   List<String> existingBiodata = prefs.getStringList('dummy_biodata') ?? [];
//   //   existingBiodata = userData
//   //       .map((item) => jsonEncode(item))
//   //       .toList(); // Convert updated data back to JSON strings

//   //   // Update SharedPreferences with the new list (which excludes the deleted biodata)
//   //   await prefs.setStringList('dummy_biodata', existingBiodata);

//   //   // Notify listeners to update the UI
//   //   notifyListeners();
//   // }

//   Future<void> deleteBiodata(Map<String, dynamic> biodata) async {
//     // Remove the selected biodata from the in-memory list
//     userData.remove(biodata);

//     // Get SharedPreferences instance
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     // Retrieve and update the dummy biodata list in SharedPreferences
//     List<String> existingBiodata = prefs.getStringList('dummy_biodata') ?? [];

//     // Remove the specific biodata from the SharedPreferences list
//     existingBiodata.removeWhere((item) {
//       // Decode the item from SharedPreferences and compare it to the biodata being deleted
//       Map<String, dynamic> storedBiodata = jsonDecode(item);
//       return storedBiodata['username'] == biodata['username'] &&
//           storedBiodata['mobile'] ==
//               biodata[
//                   'mobile']; // Use unique fields like username and mobile to identify the biodata
//     });

//     // Update SharedPreferences with the modified list (after deletion)
//     await prefs.setStringList('dummy_biodata', existingBiodata);

//     // Notify listeners to update the UI
//     notifyListeners();
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../request/showbiodatabymatri_id.dart';

class ShowbiodataController with ChangeNotifier {
  bool isLoading = false;

  // This is the getter for loading
  bool get loading => isLoading;

  // This is the setter for loading
  set loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> userData = [];

  // Load dummy biodata from shared preferences
  Future<void> loadDummyBiodata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? existingBiodata = prefs.getStringList('dummy_biodata');
    if (existingBiodata != null) {
      userData = existingBiodata
          .map((item) => jsonDecode(item))
          .cast<Map<String, dynamic>>()
          .toList();
    }
  }

  // Fetch biodata from API and shared preferences
  Future<void> fetchBiodata() async {
    loading = true;

    await loadDummyBiodata();

    try {
      await ShowbiodatabymatriId.showBiodata();

      SharedPreferences pref = await SharedPreferences.getInstance();
      String? biodataResponse = pref.getString('biodata_response');

      if (biodataResponse != null) {
        Map<String, dynamic> parsedResponse = jsonDecode(biodataResponse);

        if (parsedResponse['status'] == true &&
            parsedResponse['data'] != null) {
          List<dynamic> biodataList = parsedResponse['data'];
          userData.addAll(biodataList.cast<Map<String, dynamic>>());

          print("Biodata fetched: $userData");
        } else {
          print("Error: ${parsedResponse['message'] ?? 'No data found'}");
        }
      } else {
        print("No biodata found in SharedPreferences");
      }
    } catch (e) {
      print("Error fetching biodata: $e");
    } finally {
      loading = false;
    }
  }

  // Add dummy biodata with 2-second delay
  Future<void> addDummyBiodata() async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    final newBiodata = {
      'username': 'Tejas Manilal Patel',
      'caste': 'Hindu',
      'subcaste': 'Sample Subcaste',
      'birthdate': '12/06/2000',
      'birthtime': '12:00 PM',
      'birthplace': 'Sample Place',
      'height': '5ft 2in',
      'blood_group': 'O+',
      'mobile': '1234567890',
      'gothra': 'Sample Gothra',
      'complexion': 'Fair',
      'education_level': 'Bachelor',
      'occupation': 'Engineer',
      'income': '50000',
      'father_name': 'Sample Father',
      'father_occupation': 'Business',
      'mother_name': 'Sample Mother',
      'mother_occupation': 'Housewife',
      'no_of_brothers': '1',
      'no_of_sisters': '1',
      'address': 'Sample Address',
      'native_taluka': 'Sample Native',
      'property': 'Sample Property',
      'expectations': 'Sample Expectations',
      'profile_image': 'assets/images/profile.png',
    };

    userData.insert(0, newBiodata);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> existingBiodata = prefs.getStringList('dummy_biodata') ?? [];
    existingBiodata.insert(0, jsonEncode(newBiodata));
    await prefs.setStringList('dummy_biodata', existingBiodata);

    loading = false;
    notifyListeners();
  }

  // Clear all biodata
  Future<void> clearBiodata() async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('biodata_response');
    userData.clear();
    loading = false;
    notifyListeners();
  }

  // Copy biodata
  void copyBiodata(Map<String, dynamic> biodata) async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    userData.add(Map.from(biodata));
    loading = false;

    notifyListeners();
  }

  // Delete a specific biodata entry
  Future<void> deleteBiodata(Map<String, dynamic> biodata) async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    userData.remove(biodata);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> existingBiodata = prefs.getStringList('dummy_biodata') ?? [];

    // Remove the specific biodata from the SharedPreferences list
    existingBiodata.removeWhere((item) {
      Map<String, dynamic> storedBiodata = jsonDecode(item);
      return storedBiodata['username'] == biodata['username'] &&
          storedBiodata['mobile'] == biodata['mobile'];
    });

    await prefs.setStringList('dummy_biodata', existingBiodata);
    loading = false;

    notifyListeners();
  }
}
