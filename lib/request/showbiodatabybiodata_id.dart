import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/show_biodata_model.dart';

class ShowbiodatabybiodataId {
  static final ShowbiodatabybiodataId _instance =
      ShowbiodatabybiodataId._internal();
  ShowbiodatabybiodataId._internal();

  factory ShowbiodatabybiodataId() => _instance;

  static Future<ShowBiodataModel?> fetchBiodata(int biodata_id) async {
    // Get SharedPreferences instance to retrieve matri_id
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? biodataId = pref.getInt("biodata_id");

    // Check if matri_id exists
    if (biodataId == null) {
      print('No biodata_id found in SharedPreferences');
      return null;
    }

    // Create the URL with the retrieved matri_id
    final url = Uri.parse(
            'https://techfluxsolutions.com/royal_maratha/api/users/showBiodataByBiodataId')
        .replace(queryParameters: {'biodata_id': biodataId.toString()});

    try {
      final response = await http.get(url);
      print(response.body); // Print raw API response
      print('Api response: ${response.body}');

      if (response.statusCode == 200) {
        // Parse and return the ShowBiodataModel
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'success' &&
            jsonResponse['data'] != null) {
          return ShowBiodataModel.fromJson(jsonResponse['data']);
        } else {
          print(response.body); // Print raw API response
          print(
              'API returned success but no data or unexpected format: ${response.body}');
          return null;
        }
      } else {
        print(
            'Failed to fetch biodata: ${response.statusCode}, ${response.body}');
        return null;
      }
    } catch (e, t) {
      print('Error occurred: $e');
      print('Error occurred: $t');
      return null;
    }
  }
}
