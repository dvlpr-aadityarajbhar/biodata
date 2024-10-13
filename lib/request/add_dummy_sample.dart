import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

Future<void> addDummySampleApi() async {
  // Define the API endpoint
  Uri url = Uri.parse(
      "https://techfluxsolutions.com/royal_maratha/api/users/create_sample_template");

  // Fetch the required data from SharedPreferences
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? matriId = pref.getString("matri_id");

  // Log the retrieved matri_id
  log("Matri ID: $matriId");

  // Prepare the payload
  var payload = {
    "matri_id": matriId,
  };

  try {
    // Send the POST request
    http.Response res = await http.post(
      url,
      body: jsonEncode(payload),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    // Check for a successful response
    if (res.statusCode == 200) {
      log("Dummy sample created successfully: ${res.statusCode}");
      log("Response: ${res.body}");
    } else {
      log("Failed to create dummy sample: ${res.statusCode}");
      log("Error response: ${res.body}");
    }
  } catch (e, t) {
    // Handle any exceptions
    log("Exception occurred while creating dummy sample: $e");
    log("Stacktrace: $t");
  }
}
