// providers/user_provider.dart

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/api_services.dart';

class UserController with ChangeNotifier {
  User? _user;
  bool _loading = false;

  User? get user => _user;
  bool get loading => _loading;

  Future<void> fetchUserData() async {
    _loading = true;
    notifyListeners(); // Notify listeners that state has changed
    _user = await ApiService.getUserData();
    _loading = false;
  }
}
