// import 'dart:convert';
// import 'dart:developer';

// import 'package:shared_preferences/shared_preferences.dart';

// import '../models/dummy_sample_model.dart';
// import 'package:http/http.dart' as http;

// class HomeScreenApis {
//   static final HomeScreenApis _instance = HomeScreenApis._internal();

//   HomeScreenApis._internal();

//   factory HomeScreenApis() => _instance;

//   List<Data> userData = [];

//   Future<void> addDummySampleApi() async {
//     Uri url = Uri.parse(
//         "https://techfluxsolutions.com/royal_maratha/api/users/create_sample_template");

//     SharedPreferences pref = await SharedPreferences.getInstance();
//     String? matriId = pref.getString("matri_id");

//     var payload = {
//       "matri_id": matriId,
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
//         log("Dummy sample created successfully: ${res.statusCode}");
//         DummySampleModel responseModel =
//             DummySampleModel.fromJson(jsonDecode(res.body));
//         userData.add(responseModel.data!); // Add new biodata to list
//       } else {
//         log("Failed to create dummy sample: ${res.statusCode}");
//       }
//     } catch (e, t) {
//       log("Exception occurred while creating dummy sample: $e");
//       log("Stacktrace: $t");
//     }
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/dummy_sample_model.dart';
import 'package:http/http.dart' as http;

class HomeScreenApis {
  static final HomeScreenApis _instance = HomeScreenApis._internal();

  HomeScreenApis._internal();

  factory HomeScreenApis() => _instance;

  Future<DummySampleModel?> addDummySampleApi() async {
    Uri url = Uri.parse(
        "https://techfluxsolutions.com/royal_maratha/api/users/create_sample_template");

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? matriId = pref.getString("matri_id");

    var payload = {
      "matri_id": matriId,
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
        log("Dummy sample created successfully: ${res.statusCode}");
        log(res.body.toString());
        return DummySampleModel.fromJson(jsonDecode(res.body));
      } else {
        log("Failed to create dummy sample: ${res.statusCode}");
        return null;
      }
    } catch (e, t) {
      log("Exception occurred while creating dummy sample: $e");
      log("Stacktrace: $t");
      return null;
    }
  }

  Future<bool> deleteSampleApi(String id) async {
    Uri url = Uri.parse(
        "https://techfluxsolutions.com/royal_maratha/api/users/delete_sample_template?id=$id");

    try {
      http.Response res = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        log("Sample deleted successfully: ${res.statusCode}");
        return true;
      } else {
        log("Failed to delete sample: ${res.statusCode}");
        return false;
      }
    } catch (e, t) {
      log("Exception occurred while deleting sample: $e");
      log("Stacktrace: $t");
      return false;
    }
  }
}
