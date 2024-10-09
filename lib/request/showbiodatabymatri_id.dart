// import 'dart:convert';

// import 'package:bio_data_maker/models/show_biodata_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class ShowbiodatabymatriId {
//   static final ShowbiodatabymatriId _instance =
//       ShowbiodatabymatriId._internal();
//   ShowbiodatabymatriId._internal();

//   factory ShowbiodatabymatriId() => _instance;

//   static Future<ShowBiodataModel?> showBiodata(String matri_id) async {
//     // Get SharedPreferences instance to retrieve matri_id
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     String? matriId = pref.getString("matri_id");

//     // Check if matri_id exists
//     if (matriId == null) {
//       print('No matri_id found in SharedPreferences');
//       return null;
//     }

//     // Create the URL with the retrieved matri_id
//     final url = Uri.parse(
//             'https://techfluxsolutions.com/royal_maratha/api/users/showBiodataByMatriId')
//         .replace(queryParameters: {'matri_id': matriId});

//     try {
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         // Parse and return the ShowBiodataModel
//         return ShowBiodataModel.fromJson(jsonDecode(response.body));
//       } else {
//         print('Failed to fetch biodata: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       print('Error occurred: $e');
//       return null;
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ShowbiodatabymatriId {
  static final ShowbiodatabymatriId _instance =
      ShowbiodatabymatriId._internal();
  ShowbiodatabymatriId._internal();

  factory ShowbiodatabymatriId() => _instance;

  static Future<void> showBiodata() async {
    // Get SharedPreferences instance to retrieve matri_id
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? matriId = pref.getString("matri_id");

    // Check if matri_id exists
    if (matriId == null) {
      print('No matri_id found in SharedPreferences');
      return;
    }

    // Create the URL with the retrieved matri_id
    final url = Uri.parse(
            'https://techfluxsolutions.com/royal_maratha/api/users/showBiodataByMatriId')
        .replace(queryParameters: {'matri_id': matriId});

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final jsonResponse = jsonDecode(response.body);
        print('Biodata response: $jsonResponse');

        // Optionally, store the raw data in SharedPreferences
        await pref.setString('biodata_response', jsonEncode(jsonResponse));

        // You can handle the raw JSON here without returning a model
      } else {
        print('Failed to fetch biodata: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
