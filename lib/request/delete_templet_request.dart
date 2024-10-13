// // import 'dart:convert';
// // import 'package:http/http.dart' as http;

// // class DeleteTemplateRequest {
// //   final String baseUrl =
// //       'https://techfluxsolutions.com/royal_maratha/api/users';

// //   Future<void> deleteSampleTemplate(int id) async {
// //     final response = await http.delete(
// //       Uri.parse('$baseUrl/delete_sample_template?id=$id'),
// //       headers: {
// //         'Content-Type': 'application/json',
// //         // Add any other necessary headers here, such as Authorization
// //       },
// //     );

// //     if (response.statusCode != 200) {
// //       throw Exception('Failed to delete template: ${response.reasonPhrase}');
// //     }
// //   }
// // }

// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class DeleteTemplateRequest {
//   final String baseUrl =
//       'https://techfluxsolutions.com/royal_maratha/api/users';

//   Future<void> deleteBiodata(String id, String? authToken) async {
//     final response = await http.delete(
//       Uri.parse('$baseUrl/delete_sample_template?id=$id'),
//       headers: {
//         'Authorization': 'Bearer $authToken',
//         'Content-Type': 'application/json',
//       },
//     );

//     if (response.statusCode != 200) {
//       throw Exception('Failed to delete biodata: ${response.reasonPhrase}');
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class DeleteTemplateRequest {
  final String baseUrl =
      'https://techfluxsolutions.com/royal_maratha/api/users';

  Future<void> deleteBiodata(String id, String? authToken) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/delete_sample_template?id=$id'),
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      },
    );

    // Check the status code and handle errors
    if (response.statusCode == 200) {
      // Successful deletion
      final responseData = json.decode(response.body);
      if (responseData['success'] != true) {
        throw Exception('Failed to delete biodata: ${responseData['message']}');
      }
    } else {
      // Handle server error
      throw Exception('Failed to delete biodata: ${response.reasonPhrase}');
    }
  }
}
