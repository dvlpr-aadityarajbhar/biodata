// import 'dart:convert';
// import 'dart:developer';

// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class PersonalDetailsRequest {
//   static PersonalDetailsRequest _instance = PersonalDetailsRequest.internal();
//   PersonalDetailsRequest.internal();

//   factory PersonalDetailsRequest() => _instance;

//   Future<void> personalDetailsApi(
//       String title,
//       String userName,
//       String height,
//       // String bloodGroup,
//       String birthTime,
//       String birthPlace,
//       // String birthDate,
//       String caste,
//       String subCaste,
//       String complexion,
//       String gothra) async {
//     Uri url = Uri.parse(
//         "https://techfluxsolutions.com/royal_maratha/api/users/personal_details");

//     // SharedPreferences pref = await SharedPreferences.getInstance();

//     // Int biodata_id = await pref.setInt("biodata_id", biodataId);
//     // String? matri_id = pref.getString("matri_id");
//     SharedPreferences pref = await SharedPreferences.getInstance();

// // Store the biodata_id (assuming biodataId is an integer)
//     int biodataId = 177; // Replace with your actual biodata_id value
//     await pref.setInt('biodata_id',
//         biodataId); // This returns a Future<bool>, so no need to assign it to an int

//     String? matri_id = pref.getString("matri_id");

//     // Log the IDs"
//     log("Biodata ID: ABC");
//     log("Matri ID: $matri_id");

//     var payload = {
//       'title': title,
//       'username': userName,
//       'height': height,
//       // 'blood_group': bloodGroup
//       'birthtime': birthTime,
//       'birthplace': birthPlace,
//       // 'birthdate': birthDate
//       'caste': caste,
//       'subcaste': subCaste,
//       'complexion': complexion,
//       'gothra': gothra,
//       'biodata_id': biodataId,
//       'matri_id': matri_id,
//     };

//     try {
//       http.Response res = await http.post(
//         url,
//         body: jsonEncode(payload),
//         headers: {
//           'Content-Type': 'application/json'
//         }, // Make sure to set the content type
//       );

//       if (res.statusCode == 200) {
//         log("Request successful: ${res.statusCode}");
//         log("Response: ${res.body}");
//       } else {
//         log("Failed: ${res.statusCode}");
//         log("Error response: ${res.body}");
//       }
//     } catch (e, t) {
//       log("Exception occurred: $e");
//       log("Exception occurred: $t");
//     }
//   }
// }
// //////////
import 'dart:convert';
import 'dart:developer'; // for logging

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PersonalDetailsRequest {
  static PersonalDetailsRequest _instance = PersonalDetailsRequest.internal();
  PersonalDetailsRequest.internal();
  factory PersonalDetailsRequest() => _instance;

  Future<void> personalDetailsApi(
    String title,
    String userName,
    String height,
    String birthTime,
    String birthPlace,
    String caste,
    String subCaste,
    String complexion,
    String gothra,
  ) async {
    Uri url = Uri.parse(
        "https://techfluxsolutions.com/royal_maratha/api/users/personal_details");

    // Get the saved matri_id from SharedPreferences
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? matriId = pref.getString("matri_id");

    log("Matri ID: $matriId");

    // Prepare the payload for the API request
    var payload = {
      'title': title,
      'username': userName,
      'height': height,
      'birthtime': birthTime,
      'birthplace': birthPlace,
      'caste': caste,
      'subcaste': subCaste,
      'complexion': complexion,
      'gothra': gothra,
      'matri_id': matriId, // Send the saved matri_id
    };

    try {
      http.Response res = await http.post(
        url,
        body: jsonEncode(payload),
        headers: {
          'Content-Type': 'application/json'
        }, // Set content type to JSON
      );

      if (res.statusCode == 200) {
        log("Request successful: ${res.statusCode}");
        log("Response: ${res.body}");

        // Parse the response body
        var responseData = jsonDecode(res.body);

        // Check the response and handle biodata_id saving
        if (responseData['response'] == true) {
          // Extract the newly generated biodata_id from the response and save it
          int newBiodataId = responseData['data']['biodata_id'];

          await pref.setInt("biodata_id", newBiodataId);
          log("New biodata_id saved: $newBiodataId");
        } else {
          log("Error: ${responseData['error_msg']}");
        }
      } else {
        log("Failed: ${res.statusCode}");
        log("Error response: ${res.body}");
      }
    } catch (e, t) {
      log("Exception occurred: $e");
      log("Stacktrace: $t");
    }
  }
}
