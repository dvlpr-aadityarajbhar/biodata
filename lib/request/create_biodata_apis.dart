import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateBiodataApis {
  static final CreateBiodataApis _instance = CreateBiodataApis._internal();

  CreateBiodataApis._internal();

  factory CreateBiodataApis() => _instance;

  String newBiodataId = '';

  Future<dynamic?> personalDetailsApi(
    String title,
    String userName,
    String caste,
    String subCaste,
    String birthDate,
    String birthTime,
    String birthPlace,
    String height,
    String bloodGroup,
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
      'birthdate': birthDate,
      'birthtime': birthTime,
      'birthplace': birthPlace,
      'height': height,
      'blood_group': bloodGroup,
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
}
