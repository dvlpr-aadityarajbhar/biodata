// // // // // providers/user_provider.dart
// // // // import 'package:bio_data_maker/models/show_biodata_model.dart';
// // // // import 'package:bio_data_maker/request/showbiodatabymatri_id.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:shared_preferences/shared_preferences.dart';

// // // // class ShowbiodataController with ChangeNotifier {
// // // //   bool _loading = false;
// // // //   bool get loading => _loading;
// // // //   ShowBiodataModel? userData;

// // // //   // Fetch biodata, no need to pass matriId as a parameter anymore
// // // //   Future<void> fetchBiodata() async {
// // // //     _loading = true;
// // // //     // notifyListeners(); // Notify listeners that loading has started

// // // //     try {
// // // //       // Get the saved matri_id from SharedPreferences
// // // //       SharedPreferences pref = await SharedPreferences.getInstance();
// // // //       String? matriId = pref.getString("matri_id");

// // // //       // Check if matriId is not null
// // // //       if (matriId != null) {
// // // //         // Call the API using the retrieved matri_id
// // // //         userData = await ShowbiodatabymatriId.showBiodata(matriId);
// // // //         print("Biodata fetched for matri_id: $matriId");
// // // //       } else {
// // // //         print("matri_id not found in SharedPreferences");
// // // //       }
// // // //     } catch (e) {
// // // //       print("Error fetching biodata: $e");
// // // //     } finally {
// // // //       _loading = false;
// // // //       notifyListeners(); // Notify listeners that loading has finished
// // // //     }
// // // //   }
// // // // }

// // // import 'dart:convert';
// // // import 'package:flutter/material.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';

// // // import '../request/showbiodatabymatri_id.dart';

// // // class ShowbiodataController with ChangeNotifier {
// // //   bool _loading = false;
// // //   bool get loading => _loading;

// // //   Map<String, dynamic>? userData; // Store the raw data instead of the model

// // //   // Fetch biodata without returning a model
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
// // //         userData = jsonDecode(biodataResponse);
// // //         print("Biodata fetched: $userData");
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

// // //   ShowbiodataController() {
// // //     // Initialize with empty data or fetch from an API
// // //     userData = {
// // //       'data': [],
// // //     };
// // //   }

// // //   // Method to add dummy biodata
// // //   void addDummyBiodata() {
// // //     // Create a dummy biodata entry
// // //     final newBiodata = {
// // //       'username': 'Sample User',
// // //       'caste': 'Sample Caste',
// // //       'subcaste': 'Sample Subcaste',
// // //       'birthdate': '12-06-2000',
// // //       'birthtime': '12:00 PM',
// // //       'birthplace': 'Sample Place',
// // //       'height': '5.6',
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
// // //     };

// // //     // Add the new sample to the list
// // //     userData!['data'].add(newBiodata);

// // //     // Notify listeners to rebuild the UI
// // //     notifyListeners();
// // //   }
// // // }

// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // import '../request/showbiodatabymatri_id.dart';

// // class ShowbiodataController with ChangeNotifier {
// //   bool _loading = false;
// //   bool get loading => _loading;

// //   // Map<String, dynamic>? userData; // Store the raw data instead of the model
// //   List<Map<String, dynamic>> userData = [];
// //   // Fetch biodata without returning a model
// //   Future<void> fetchBiodata() async {
// //     _loading = true;
// //     notifyListeners(); // Notify listeners that loading has started

// //     try {
// //       // Call the API to fetch the biodata
// //       await ShowbiodatabymatriId.showBiodata();

// //       // Retrieve the stored response from SharedPreferences
// //       SharedPreferences pref = await SharedPreferences.getInstance();
// //       String? biodataResponse = pref.getString('biodata_response');

// //       // If the response is not null, parse it into a Map
// //       if (biodataResponse != null) {
// //         userData = jsonDecode(biodataResponse);
// //         print("Biodata fetched: $userData");
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

// //   ShowbiodataController() {
// //     // Initialize with empty data or fetch from an API
// //     userData = {
// //       'data': [], // Initialize with an empty list
// //     };
// //   }

// //   // Method to add dummy biodata at the top of the list
// //   void addDummyBiodata() {
// //     // Create a dummy biodata entry
// //     final newBiodata = {
// //       'username': 'Sample User',
// //       'caste': 'Sample Caste',
// //       'subcaste': 'Sample Subcaste',
// //       'birthdate': '12-06-2000',
// //       'birthtime': '12:00 PM',
// //       'birthplace': 'Sample Place',
// //       'height': '5.6',
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
// //     userData!['data'].insert(0, newBiodata);

// //     // Notify listeners to rebuild the UI
// //     notifyListeners();
// //   }

// //   void copyBiodata(Map<String, dynamic> biodata) {
// //     // Duplicate the biodata entry
// //     userData.add(Map.from(biodata)); // Create a copy to avoid reference issues
// //     notifyListeners(); // Notify listeners to rebuild the UI
// //   }
// // }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../request/showbiodatabymatri_id.dart';

// class ShowbiodataController with ChangeNotifier {
//   bool _loading = false;
//   bool get loading => _loading;

//   // userData will store a list of biodata entries
//   List<Map<String, dynamic>> userData = [];

//   // Fetch biodata without returning a model
//   Future<void> fetchBiodata() async {
//     _loading = true;
//     notifyListeners(); // Notify listeners that loading has started

//     try {
//       // Call the API to fetch the biodata
//       await ShowbiodatabymatriId.showBiodata();

//       // Retrieve the stored response from SharedPreferences
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       String? biodataResponse = pref.getString('biodata_response');

//       // If the response is not null, parse it into a Map
//       if (biodataResponse != null) {
//         // Parse the response as a Map
//         Map<String, dynamic> parsedResponse = jsonDecode(biodataResponse);

//         // Extract the list from the "data" key
//         List<dynamic> biodataList = parsedResponse['data'];

//         // Ensure the list is a List<Map<String, dynamic>> by casting
//         userData = biodataList.cast<Map<String, dynamic>>();

//         print("Biodata fetched: $userData");
//       } else {
//         print("No biodata found in SharedPreferences");
//       }
//     } catch (e) {
//       print("Error fetching biodata: $e");
//     } finally {
//       _loading = false;
//       notifyListeners(); // Notify listeners that loading has finished
//     }
//   }

//   // Method to add dummy biodata at the top of the list
//   void addDummyBiodata() {
//     // Create a dummy biodata entry
//     final newBiodata = {
//       'username': 'Sample User',
//       'caste': 'Sample Caste',
//       'subcaste': 'Sample Subcaste',
//       'birthdate': '12-06-2000',
//       'birthtime': '12:00 PM',
//       'birthplace': 'Sample Place',
//       'height': '5.6',
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
//       'profile_image': 'assets/images/profile.png', // Dummy image URL
//     };

//     // Add the new sample to the top of the list
//     userData.insert(0, newBiodata);

//     // Notify listeners to rebuild the UI
//     notifyListeners();
//   }

//   // Method to copy an existing biodata entry
//   void copyBiodata(Map<String, dynamic> biodata) {
//     // Duplicate the biodata entry
//     userData.add(Map.from(biodata)); // Create a copy to avoid reference issues
//     notifyListeners(); // Notify listeners to rebuild the UI
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/dummy_sample_model.dart';
import '../request/showbiodatabymatri_id.dart';

class ShowbiodataController with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  List<Map<String, dynamic>> userData = [];

  // Fetch biodata without returning a model
  Future<void> fetchBiodata() async {
    _loading = true;
    notifyListeners(); // Notify listeners that loading has started

    try {
      // Call the API to fetch the biodata
      await ShowbiodatabymatriId.showBiodata();

      // Retrieve the stored response from SharedPreferences
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? biodataResponse = pref.getString('biodata_response');

      // If the response is not null, parse it into a Map
      if (biodataResponse != null) {
        // Parse the response as a Map
        Map<String, dynamic> parsedResponse = jsonDecode(biodataResponse);

        // Extract the list from the "data" key
        List<dynamic> biodataList = parsedResponse['data'];

        // Ensure the list is a List<Map<String, dynamic>> by casting
        userData = biodataList.cast<Map<String, dynamic>>();

        print("Biodata fetched: $userData");
      } else {
        print("No biodata found in SharedPreferences");
      }
    } catch (e) {
      print("Error fetching biodata: $e");
    } finally {
      _loading = false;
      notifyListeners(); // Notify listeners that loading has finished
    }
  }

  //  List<Data> userData = [];
  // bool loading = false;

  // void setLoading(bool value) {
  //   loading = value;
  //   notifyListeners();
  // }

  // Future<void> addDummySampleApi() async {
  //   setLoading(true);

  //   Uri url = Uri.parse(
  //       "https://techfluxsolutions.com/royal_maratha/api/users/create_sample_template");

  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? matriId = pref.getString("matri_id");

  //   var payload = {
  //     "matri_id": matriId,
  //   };

  //   try {
  //     http.Response res = await http.post(
  //       url,
  //       body: jsonEncode(payload),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //       },
  //     );

  //     if (res.statusCode == 200) {
  //       log("Dummy sample created successfully: ${res.statusCode}");
  //       DummySampleModel responseModel =
  //           DummySampleModel.fromJson(jsonDecode(res.body));
  //       userData.add(responseModel.data!); // Add new biodata to list
  //     } else {
  //       log("Failed to create dummy sample: ${res.statusCode}");
  //     }
  //   } catch (e, t) {
  //     log("Exception occurred while creating dummy sample: $e");
  //     log("Stacktrace: $t");
  //   } finally {
  //     setLoading(false);
  //   }
  // }
}
