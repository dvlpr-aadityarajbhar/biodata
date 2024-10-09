// services/api_service.dart
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class ApiService {
  static Future<User> getUserData() async {
    const String apiUrl = "https://api.example.com/user";
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User(name: data['name'], email: data['email']);
    } else {
      throw Exception('Failed to load user data');
    }
  }

//chatgpt
  submitPersonalDetails(Map<String, String> formData) {
    return http.post(
      Uri.parse(
          'https://techfluxsolutions.com/royal_maratha/api/users/personal_details'),
      body: formData,
    );
  }
}
