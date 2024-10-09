// // providers/user_provider.dart
// import 'package:bio_data_maker/models/show_biodata_model.dart';
// import 'package:bio_data_maker/request/showbiodatabymatri_id.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ShowbiodataController with ChangeNotifier {
//   bool _loading = false;
//   bool get loading => _loading;
//   ShowBiodataModel? userData;

//   // Fetch biodata, no need to pass matriId as a parameter anymore
//   Future<void> fetchBiodata() async {
//     _loading = true;
//     // notifyListeners(); // Notify listeners that loading has started

//     try {
//       // Get the saved matri_id from SharedPreferences
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       String? matriId = pref.getString("matri_id");

//       // Check if matriId is not null
//       if (matriId != null) {
//         // Call the API using the retrieved matri_id
//         userData = await ShowbiodatabymatriId.showBiodata(matriId);
//         print("Biodata fetched for matri_id: $matriId");
//       } else {
//         print("matri_id not found in SharedPreferences");
//       }
//     } catch (e) {
//       print("Error fetching biodata: $e");
//     } finally {
//       _loading = false;
//       notifyListeners(); // Notify listeners that loading has finished
//     }
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../request/showbiodatabymatri_id.dart';

class ShowbiodataController with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  Map<String, dynamic>? userData; // Store the raw data instead of the model

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
        userData = jsonDecode(biodataResponse);
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
}
