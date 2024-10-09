// import 'dart:convert';
// import 'dart:developer';

// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class EducationDetailsRequest {
//   static EducationDetailsRequest _instance = EducationDetailsRequest.internal();
//   EducationDetailsRequest.internal();

//   factory EducationDetailsRequest() => _instance;

//   Future<void> educationDetailsApi(
//     String educationLevel,
//     String educationDetail,
//     String occupation,
//     String income,
//   ) async {
//     Uri url = Uri.parse(
//         "https://techfluxsolutions.com/royal_maratha/api/users/EducationOccupation");

//     // Retrieve SharedPreferences instance
//     SharedPreferences pref = await SharedPreferences.getInstance();

//     // Retrieve biodata_id as an int (not String)
//     int? biodataId = pref.getInt("biodata_id"); // Use getInt to fetch the int
//     String? matriId = pref.getString("matri_id"); // matri_id is likely a String

//     // Log the IDs for debugging
//     log("Biodata ID: $biodataId");
//     log("Matri ID: $matriId");

//     var payload = {
//       "education_level": educationLevel,
//       "education_detail": educationDetail,
//       "occupation": occupation,
//       "income": income,
//       "biodata_id": biodataId, // Send the int biodata_id
//       "matri_id": matriId // Send the String matri_id
//     };

//     try {
//       http.Response res = await http.post(
//         url,
//         body: jsonEncode(payload),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//       );

//       if (res.statusCode == 200) {
//         log("Education Details updated successfully: ${res.statusCode}");
//         log("Response: ${res.body}");
//       } else {
//         log("Failed to update Education Details: ${res.statusCode}");
//         log("Error response: ${res.body}");
//       }
//     } catch (e, t) {
//       log("Exception occurred while updating Education Details: $e");
//       log("Exception occurred while updating Education Details: $t");
//     }
//   }

//   Future<void> familyDetailsApi(
//     fathersName,
//     fatherOccupation,
//     mothersName,
//     mothersOccupation,
//     mobileNumber,
//     totalBrothers,
//     totalSisters,
//     residentialAddress,
//     maternalUncle,
//     nativePlace,
//     surnameRelatives,
//   ) async {
//     Uri url = Uri.parse(
//         "https://techfluxsolutions.com/royal_maratha/api/users/FamilyDetails");

//     SharedPreferences pref = await SharedPreferences.getInstance();
//     int? biodata_id = pref.getInt("biodata_id");
//     String? matri_id = pref.getString("matri_id");

//     // Log the IDs
//     log("Biodata ID: $biodata_id");
//     log("Matri ID: $matri_id");

//     var payload = {
//       "father_name": fathersName,
//       "mother_name": mothersName,
//       "father_occupation": fatherOccupation,
//       "mother_occupation": mothersOccupation,
//       "address": residentialAddress,
//       "no_of_brothers": totalBrothers,
//       "no_of_sisters": totalSisters,
//       "mobile": mobileNumber,
//       "mama_surname": maternalUncle,
//       "surname_of_relatives": surnameRelatives,
//       "family_native_place": nativePlace,
//       'biodata_id': biodata_id,
//       'matri_id': matri_id,
//     };

//     try {
//       http.Response res = await http.post(
//         url,
//         body: jsonEncode(payload),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//       );

//       if (res.statusCode == 200) {
//         log("Family Details updated successfully: ${res.statusCode}");
//         log("Response: ${res.body}");
//       } else {
//         log("Failed to update Family Details: ${res.statusCode}");
//         log("Error response: ${res.body}");
//       }
//     } catch (e, t) {
//       log("Exception occurred while updating Education Details: $e");
//       log("Exception occurred while updating Education Details: $t");
//     }
//   }

//   Future<void> otherDetailsApi(
//       String property, String expectation, String email, String contact) async {
//     Uri url = Uri.parse(
//         "https://techfluxsolutions.com/royal_maratha/api/users/OtherDetails");

//     SharedPreferences pref = await SharedPreferences.getInstance();
//     int? biodata_id = pref.getInt("biodata_id");
//     String? matri_id = pref.getString("matri_id");

//     log("Biodata ID: $biodata_id");
//     log("Matri ID: $matri_id");

//     var payload = {
//       "property": property,
//       "expectations": expectation,
//       "email": email,
//       "contact": contact,
//       "matri_id": matri_id,
//       "biodata_id": biodata_id,
//     };

//     try {
//       http.Response res = await http.post(
//         url,
//         body: jsonEncode(payload),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//       );

//       if (res.statusCode == 200) {
//         log("Other Details updated successfully: ${res.statusCode}");
//         log("Response: ${res.body}");
//       } else {
//         log("Failed to update Other Details: ${res.statusCode}");
//         log("Error response: ${res.body}");
//       }
//     } catch (e, t) {
//       log("Exception occurred while updating Other Details: $e");
//       log("Exception occurred while updating Other Details: $t");
//     }
//   }

//   Future<void> personalDetailsApi(
//     String title,
//     String userName,
//     String height,
//     String birthTime,
//     String birthPlace,
//     String caste,
//     String subCaste,
//     String complexion,
//     String gothra,
//   ) async {
//     Uri url = Uri.parse(
//         "https://techfluxsolutions.com/royal_maratha/api/users/personal_details");

//     // Get the saved matri_id from SharedPreferences
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     String? matriId = pref.getString("matri_id");

//     log("Matri ID: $matriId");

//     // Prepare the payload for the API request
//     var payload = {
//       'title': title,
//       'username': userName,
//       'height': height,
//       'birthtime': birthTime,
//       'birthplace': birthPlace,
//       'caste': caste,
//       'subcaste': subCaste,
//       'complexion': complexion,
//       'gothra': gothra,
//       'matri_id': matriId, // Send the saved matri_id
//     };

//     try {
//       http.Response res = await http.post(
//         url,
//         body: jsonEncode(payload),
//         headers: {
//           'Content-Type': 'application/json'
//         }, // Set content type to JSON
//       );

//       if (res.statusCode == 200) {
//         log("Request successful: ${res.statusCode}");
//         log("Response: ${res.body}");

//         // Parse the response body
//         var responseData = jsonDecode(res.body);

//         // Check the response and handle biodata_id saving
//         if (responseData['response'] == true) {
//           // Extract the newly generated biodata_id from the response and save it
//           int newBiodataId = responseData['data']['biodata_id'];

//           await pref.setInt("biodata_id", newBiodataId);
//           log("New biodata_id saved: $newBiodataId");
//         } else {
//           log("Error: ${responseData['error_msg']}");
//         }
//       } else {
//         log("Failed: ${res.statusCode}");
//         log("Error response: ${res.body}");
//       }
//     } catch (e, t) {
//       log("Exception occurred: $e");
//       log("Stacktrace: $t");
//     }
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EducationDetailsRequest {
  String newBiodataId = '';
  static final EducationDetailsRequest _instance =
      EducationDetailsRequest._internal();

  EducationDetailsRequest._internal();

  factory EducationDetailsRequest() => _instance;

  Future<dynamic?> personalDetailsApi(
    String title,
    String userName,
    String caste,
    String subCaste,
    String birthTime,
    String birthPlace,
    String height,
    String gothra,
    String complexion,
    // String matri_id,
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
      'caste': caste,
      'subcaste': subCaste,
      'birthtime': birthTime,
      'birthplace': birthPlace,
      'height': height,
      'gothra': gothra,
      'complexion': complexion,
      'matri_id': matriId, // Send the saved matri_id
    };

    try {
      http.Response res = await http.post(
        url,
        body: jsonEncode(payload),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
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
          newBiodataId = responseData['data']['biodata_id'].toString();
          await pref.setInt("biodata_id", int.parse(newBiodataId));
          log("New biodata_id saved: $newBiodataId");
          return responseData; // Return the biodata_id
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
    return null; // Return null if something went wrong
  }

  Future<void> educationDetailsApi(
    String educationLevel,
    double income,
    String occupation,
    String educationDetail,

    // int biodataId,
    // String matriId,
  ) async {
    Uri url = Uri.parse(
        "https://techfluxsolutions.com/royal_maratha/api/users/EducationOccupation");

    // Retrieve SharedPreferences instance
    SharedPreferences pref = await SharedPreferences.getInstance();
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // Retrieve biodata_id as an int (not String)
    int? biodataId = pref.getInt("biodata_id");
    String? matriId = pref.getString("matri_id");

    // Log the IDs for debugging
    log("Biodata ID: $biodataId");
    log("Matri ID: $matriId");

    var payload = {
      "education_level": educationLevel,
      "education_detail": educationDetail,
      "occupation": occupation,
      "income": income,
      "matri_id": matriId
    };

    try {
      http.Response res = await http.post(
        url,
        body: jsonEncode(payload),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        log("Education Details updated successfully: ${res.statusCode}");
        log("Response: ${res.body}");
      } else {
        log("Failed to update Education Details: ${res.statusCode}");
        log("Error response: ${res.body}");
      }
    } catch (e, t) {
      log("Exception occurred while updating Education Details: $e");
      log("Stacktrace: $t");
    }
  }

  Future<void> familyDetailsApi(
    String fathersName,
    String fatherOccupation,
    String mothersName,
    String mothersOccupation,
    String mobileNumber,
    String totalBrothers,
    String totalSisters,
    String residentialAddress,
    String maternalUncle,
    String nativePlace,
    String surnameRelatives,
    // int biodataId,
    // String matriId,
  ) async {
    Uri url = Uri.parse(
        "https://techfluxsolutions.com/royal_maratha/api/users/FamilyDetails");

    SharedPreferences pref = await SharedPreferences.getInstance();
    int? biodataId = pref.getInt("biodata_id");
    String? matriId = pref.getString("matri_id");

    // Log the IDs
    log("Biodata ID: $biodataId");
    log("Matri ID: $matriId");

    var payload = {
      "father_name": fathersName,
      "mother_name": mothersName,
      "father_occupation": fatherOccupation,
      "mother_occupation": mothersOccupation,
      "address": residentialAddress,
      "no_of_brothers": totalBrothers,
      "no_of_sisters": totalSisters,
      "mobile": mobileNumber,
      "mama_surname": maternalUncle,
      "surname_of_relatives": surnameRelatives,
      "family_native_place": nativePlace,
      'biodata_id': biodataId,
      'matri_id': matriId,
    };

    try {
      http.Response res = await http.post(
        url,
        body: jsonEncode(payload),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        log("Family Details updated successfully: ${res.statusCode}");
        log("Response: ${res.body}");
      } else {
        log("Failed to update Family Details: ${res.statusCode}");
        log("Error response: ${res.body}");
      }
    } catch (e, t) {
      log("Exception occurred while updating Family Details: $e");
      log("Stacktrace: $t");
    }
  }

  Future<void> otherDetailsApi(
    String property,
    String expectation,
    String email,
    String contact,
    // int biodataId,
    // String matriId,
  ) async {
    Uri url = Uri.parse(
        "https://techfluxsolutions.com/royal_maratha/api/users/OtherDetails");

    SharedPreferences pref = await SharedPreferences.getInstance();
    int? biodataId = pref.getInt("biodata_id");
    String? matriId = pref.getString("matri_id");

    log("Biodata ID: $biodataId");
    log("Matri ID: $matriId");

    var payload = {
      "property": property,
      "expectations": expectation,
      "email": email,
      "contact": contact,
      "matri_id": matriId,
      "biodata_id": biodataId,
    };

    try {
      http.Response res = await http.post(
        url,
        body: jsonEncode(payload),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        log("Other Details updated successfully: ${res.statusCode}");
        log("Response: ${res.body}");
      } else {
        log("Failed to update Other Details: ${res.statusCode}");
        log("Error response: ${res.body}");
      }
    } catch (e, t) {
      log("Exception occurred while updating Other Details: $e");
      log("Stacktrace: $t");
    }
  }

  Future<void> insertImageApi(File imageFile) async {
    Uri url = Uri.parse(
        "https://techfluxsolutions.com/royal_maratha/api/users/insertImage");

    SharedPreferences pref = await SharedPreferences.getInstance();
    int? biodataId = pref.getInt("biodata_id");
    String? matriId = pref.getString("matri_id");

    log("Biodata ID: $biodataId");
    log("Matri ID: $matriId");

    try {
      var request = http.MultipartRequest('POST', url);

      if (imageFile != null) {
        var stream = http.ByteStream(imageFile.openRead());
        var length = await imageFile.length();
        var multipartFile = http.MultipartFile(
          'photo1',
          stream,
          length,
          filename: basename(imageFile.path),
        );

        request.files.add(multipartFile);
      }
      request.fields['biodata_id'] = biodataId.toString();
      request.fields['matri_id'] = matriId ?? '';
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        log("Image uploaded successfully: ${response.statusCode}");
        log("Response: $responseData");
      } else {
        log("Failed to upload image: ${response.statusCode}");
      }
    } catch (e, t) {
      log("Exception occurred while uploading image: $e");
      log("Stacktrace: $t");
    }
  }
}
